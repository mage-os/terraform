terraform {
  backend "gcs" {
    bucket = "mage-os-tf-state"
    prefix = "terraform/state"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.8"
    }
  }
}

provider "github" {
  owner = var.organization_name
  app_auth {
    id              = var.github_app_id
    installation_id = var.github_app_installation_id
    pem_file        = var.github_app_pem_file
  }
}

data "github_user" "mage-os-ci" {
  username = "mage-os-ci"
}

# Test change

# Using exclusively github_team_membership properly sends invitation, but
# doesn't handle revoking organization membership. Someone can be a part of
# organization, but not belong to any team. Stating membership explicitly also
# makes transitions between administrators and normal members possible in
# single apply.
resource "github_membership" "users" {
  for_each = toset(distinct(concat(
    flatten([for team in var.teams : team.members]),
    var.administrators,
  )))
  username = each.key
  role     = contains(var.administrators, each.key) ? "admin" : "member"
}

resource "github_team" "teams" {
  for_each    = var.teams
  name        = each.key
  description = each.value.description
  privacy     = "closed"
}

resource "github_team_membership" "members" {
  for_each = { for i in flatten([
    for team_name, team in var.teams : [
      for member in team.members : {
        team = team_name
        user = member
      }
    ]
  ]) : "${i.user}_${i.team}" => i }
  team_id  = github_team.teams[each.value.team].id
  username = each.value.user
  # Administrators are automatically assigned maintainer role. Do it explicitly
  # to avoid state discrepancy.
  role = contains(
    var.administrators, each.value.user
  ) ? "maintainer" : "member"
}

resource "github_repository" "mirrors" {
  for_each     = var.mirror_repositories
  name         = each.key
  description  = each.value.description
  has_issues   = false
  has_projects = false
  has_wiki     = false
  topics       = try(each.value.topics, [])

  lifecycle {
    # Never try to replace repository in order to change its configuration.
    prevent_destroy = true
  }
}

resource "github_branch_protection" "mirrors" {
  for_each            = var.mirror_repositories
  repository_id       = github_repository.mirrors[each.key].node_id
  pattern             = "*"
  enforce_admins      = true
  push_restrictions   = [data.github_user.mage-os-ci.node_id]
  allows_force_pushes = true
}

resource "github_repository" "repositories" {
  for_each               = var.repositories
  name                   = each.key
  description            = each.value.description
  has_issues             = true
  has_projects           = true
  has_wiki               = false
  topics                 = try(each.value.topics, [])
  auto_init              = true
  delete_branch_on_merge = true
  homepage_url           = try(each.value.homepage_url, "")
  archived               = try(each.value.archived, false)

  lifecycle {
    # Never try to replace repository in order to change its configuration.
    prevent_destroy = true
  }
}

resource "github_branch_protection" "repositories" {
  for_each      = var.repositories
  repository_id = github_repository.repositories[each.key].node_id
  pattern       = "*"

  required_status_checks {
    strict   = true
    contexts = []
  }

  required_pull_request_reviews {
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
    restrict_dismissals             = true
    dismissal_restrictions = [
      github_team.teams["tech-lead"].node_id,
    ]
  }
}

resource "github_branch_default" "repositories" {
  for_each   = { for key, value in var.repositories : key => value if try(value.default_branch, "") != "" }
  repository = github_repository.repositories[each.key].name
  branch     = each.value.default_branch
}

resource "github_team_repository" "teams" {
  for_each = { for i in flatten([
    for repository_name, repository in var.repositories : [
      for team in try(repository.teams, []) : {
        repository = repository_name
        team       = team
      }
    ]
  ]) : "${i.repository}_${i.team}" => i }
  team_id    = github_team.teams[each.value.team].name
  repository = github_repository.repositories[each.value.repository].name
  permission = "push"
}

resource "github_team_repository" "tech-lead" {
  for_each   = var.repositories
  team_id    = github_team.teams["tech-lead"].id
  repository = github_repository.repositories[each.key].name
  permission = "maintain"
}

resource "github_repository_file" "codeowners" {
  for_each   = var.repositories
  repository = github_repository.repositories[each.key].name
  branch     = github_repository.repositories[each.key].default_branch
  file       = "CODEOWNERS"
  content = "* ${join(
    " ",
    formatlist("@${var.organization_name}/%s", try(each.value.teams, []))
  )}"
  commit_message      = "Managed by Terraform"
  commit_author       = "mage-os-ci"
  commit_email        = "info@mage-os.org"
  overwrite_on_create = true
}

resource "github_repository_collaborator" "collaborators" {
  for_each = { for i in flatten([
    for repository_name, repository in var.repositories : [
      for collaborator in try(repository.collaborators, []) : {
        repository   = repository_name
        collaborator = collaborator
      }
    ]
  ]) : "${i.repository}_${i.collaborator}" => i }
  repository = github_repository.repositories[each.value.repository].name
  username   = each.value.collaborator
  permission = "push"
}
