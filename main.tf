terraform {
  backend "swift" {
    auth_url    = "https://auth.cloud.ovh.net/v3"
    region_name = "WAW"
    container   = "terraform-jakski-it"
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
  app_auth {}
}

resource "github_membership" "administrators" {
  for_each = toset(var.administrators)
  username = each.key
  role     = "admin"
}

resource "github_team" "teams" {
  for_each    = var.teams
  name        = each.key
  description = try(each.value.description, null)
  privacy     = "closed"
}

resource "github_team_members" "members" {
  for_each = var.teams
  team_id  = github_team.teams[each.key].id
  dynamic "members" {
    for_each = try(each.value.members, [])
    content {
      username = members.value
      role     = "member"
    }
  }
}

resource "github_repository" "mirrors" {
  for_each     = var.mirror_repositories
  name         = each.key
  description  = try(each.value.description, null)
  has_issues   = false
  has_projects = false
  has_wiki     = false
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
      for team in repository.teams : {
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
  content = "* @${var.organization_name}/tech-lead ${join(
    " ",
    formatlist("@${var.organization_name}/%s", each.value.teams)
  )}"
  commit_message      = "Managed by Terraform"
  commit_author       = "Jakski IT Bot"
  commit_email        = "issues+github@jakski.name"
  overwrite_on_create = true
}
