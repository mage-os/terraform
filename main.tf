terraform {
  backend "gcs" {
    bucket  = "mage-os-tf-state"
    prefix  = "terraform/state"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
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
  description = try(each.value.description, null)
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
  description  = try(each.value.description, null)
  has_issues   = false
  has_projects = false
  has_wiki     = false

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
  push_restrictions   = [var.app_node_id]
  allows_force_pushes = false
}

resource "github_repository" "repositories" {
  for_each    = var.repositories
  name        = each.key
  description = try(each.value.description, null)
  auto_init   = true

  lifecycle {
    # Never try to replace repository in order to change its configuration.
    prevent_destroy = true
  }
}

resource "github_branch_protection" "repositories" {
  for_each          = var.repositories
  repository_id     = github_repository.repositories[each.key].node_id
  pattern           = "*"
  push_restrictions = []

  required_status_checks {
    strict   = true
    contexts = []
  }

  required_pull_request_reviews {
    require_code_owner_reviews      = true
    required_approving_review_count = 2
    dismiss_stale_reviews           = true
    restrict_dismissals             = true
    dismissal_restrictions = [
      github_team.teams["tech-lead"].node_id,
    ]
  }
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
  file       = "CODEOWNERS"
  content = "* ${join(
    " ",
    formatlist("@${var.organization_name}/%s", try(each.value.teams, []))
  )}"
  commit_message      = "Managed by Terraform"
  commit_author       = "Mage-OS CI Bot"
  commit_email        = "info+ci@mage-os.org"
  overwrite_on_create = true
}
