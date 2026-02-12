# CLAUDE.md - Agent Guide for mage-os.terraform

This file provides context for AI agents maintaining this repository.

## Repository Purpose

This is an **OpenTofu/Terraform Infrastructure-as-Code** repository that
declaratively manages the [Mage-OS](https://mage-os.org) GitHub organization.
Mage-OS is an independent nonprofit distribution of Magento Open Source.

**What it manages:**
- Organization membership and roles (admin vs member)
- 6 teams and their members
- ~60 source repositories with settings, branch protection, and access control
- ~39 mirror repositories (read-only forks of upstream Magento/Adobe projects)
- Auto-generated files pushed to all repos (CODEOWNERS, workflow files)

## File Structure

```
main.tf          # All Terraform resources (provider, data sources, resources)
variables.tf     # All variable definitions with inline default values
                 #   - authentication vars (provided via TF_VAR_* env vars)
                 #   - organization_name, administrators
                 #   - mirror_repositories, teams, repositories (large maps)
README.md        # Human-oriented usage guide
INSTALL.md       # From-scratch setup guide (GitHub App, backend, secrets)
.github/workflows/
  tofu-checks.yml   # PR: format check, init, validate (no secrets)
  tofu-plan.yml     # PR comment "/plan": runs tofu plan (access-controlled)
  tofu-apply.yml    # Push to main: auto-applies changes
  sansec-ecomscan.yml  # Template: injected into all repos by Terraform
```

There are no Terraform modules -- everything is in `main.tf` and `variables.tf`.

## Validation Commands

```bash
tofu fmt -check -diff    # Check formatting (CI runs this)
tofu fmt                 # Auto-fix formatting
tofu init -backend=false # Initialize without backend (for local validation)
tofu validate            # Validate syntax and references
```

Format must pass before merge. Run `tofu fmt` after any `.tf` file changes.

## Provider and Backend

- **Provider:** `integrations/github ~> 6.2` (GitHub provider via GitHub App auth)
- **Backend:** Google Cloud Storage bucket `mage-os-tf-state`
- **Auth:** GitHub App with ID, installation ID, and PEM file (via `TF_VAR_*`)

## Variable Schemas

Variables are defined in `variables.tf` with default values that serve as the
actual configuration. There are no `.tfvars` files.

### `repositories` (map of objects)

Each key is the repository name. Object fields:

| Field | Required | Type | Description |
|---|---|---|---|
| `description` | yes | string | Repository description |
| `teams` | yes | list(string) | Team names (must exist in `teams` var) |
| `users` | no | list(string) | Individual GitHub usernames with push access |
| `topics` | no | list(string) | GitHub topics |
| `default_branch` | no | string | Override default branch (omit for "main") |
| `homepage_url` | no | string | Repository homepage URL |
| `archived` | no | bool | Set `true` to archive (skips branch protection) |
| `is_part_of_monorepo` | no | bool | If `true`, only mage-os-ci can push |
| `release_please_branch` | no | string | Branch name for release-please protection |

### `mirror_repositories` (map of objects)

Each key is the mirror repository name (convention: `mirror-{upstream-name}`).

| Field | Required | Type | Description |
|---|---|---|---|
| `description` | yes | string | Repository description |
| `teams` | yes | list(string) | Team names |
| `topics` | no | list(string) | GitHub topics |

### `teams` (map of objects)

Each key is the team slug used in resource references.

| Field | Required | Type | Description |
|---|---|---|---|
| `name` | yes | string | Display name |
| `description` | yes | string | Team description |
| `members` | yes | list(string) | GitHub usernames |

### `administrators` (list of strings)

GitHub usernames with org admin role. Admins automatically get "maintainer"
role on any team they belong to.

## Resource Dependency Map

```
variables.tf (teams, repositories, mirror_repositories, administrators)
  |
  v
main.tf resources (in dependency order):
  |
  +-- github_membership.users        (org membership from teams + administrators)
  +-- github_team.teams              (team creation)
  |     +-- github_team_membership.members  (team member assignment)
  |
  +-- github_repository.mirrors      (mirror repo creation)
  |     +-- github_branch_protection.mirrors (wildcard protection, ci-only push)
  |
  +-- github_repository.repositories (source repo creation)
  |     +-- github_branch_default.repositories (custom default branches)
  |     +-- github_branch_protection.repositories (PR reviews, push restrictions)
  |     +-- github_branch_protection.repositories-release-please
  |     +-- github_team_repository.teams      (team push access)
  |     +-- github_team_repository.tech-lead  (tech-lead maintain on all repos)
  |     +-- github_repository_file.codeowners (auto-generated CODEOWNERS)
  |     +-- github_repository_file.merge-upstream-changes (for mageos-* repos)
  |     +-- github_repository_file.sansec_ecomscan_workflow (security scanning)
```

## Common Tasks

### Add a user to a team

In `variables.tf`, find the team in `variable "teams"` and add the GitHub
username to the `members` list:

```hcl
distribution = {
  name        = "Distribution"
  description = "Distribution mergers"
  members = [
    "existinguser",
    "newuser",        # <-- add here
  ]
}
```

This automatically handles org membership invitation and team assignment.

### Add a new source repository

In `variables.tf`, add an entry to `variable "repositories"` > `default`:

```hcl
new-repo-name = {
  description = "Description of the repository."
  teams       = ["distribution"]  # must reference existing team keys
  topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
}
```

Terraform will automatically:
- Create the repository with standard settings (issues, projects, auto-init,
  delete-branch-on-merge)
- Set branch protection (required PR reviews, status checks, push restrictions)
- Give the tech-lead team "maintain" permission
- Generate a CODEOWNERS file from teams/users
- Add the Sansec eComscan security workflow

If importing an existing repo, run:
```bash
tofu import github_repository.repositories[\"repo-name\"] repo-name
```

### Add a new mirror repository

In `variables.tf`, add to `variable "mirror_repositories"` > `default`:

```hcl
mirror-upstream-name = {
  description = "Mage-OS mirror fork of https://github.com/magento/upstream-name."
  teams       = ["continuous-integration"]
  topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
}
```

Mirrors get wildcard branch protection where only `mage-os-ci` can push.

**Mirror-to-fork linkage:** If a `mageos-*` repository exists whose name
corresponds to a mirror (e.g., `mageos-foo` <-> `mirror-foo`), Terraform
auto-generates a `merge-upstream-changes.yml` workflow in the mageos-* repo.

### Archive a repository

Set `archived = true` on the repository entry. This skips branch protection
and the eComscan workflow for that repo.

### Give a user direct push access to a repo

Add the `users` field to the repository entry:

```hcl
some-repo = {
  description = "..."
  teams       = ["distribution"]
  users       = ["githubusername"]
}
```

### Add a new team

Add to `variable "teams"` in `variables.tf`, then reference the team key in
repository `teams` lists.

## Safety and Lifecycle Notes

- **All repositories have `prevent_destroy = true`** -- Terraform will refuse
  to delete a repository. This is intentional. To actually delete a repo, you
  must first remove the lifecycle block or use `tofu state rm`.
- **Org membership is explicit.** Removing a user from all teams does NOT
  revoke org membership. You must also remove them from the `teams` variable
  entirely for Terraform to revoke access.
- **Admins get maintainer role automatically.** Users in `administrators` are
  set as team maintainers wherever they appear -- this is done explicitly to
  avoid state drift since GitHub does this implicitly.
- **`app_node_id`** is used in branch protection push allowances to identify
  the GitHub App in ACLs. It is separate from the app ID.
- **`is_part_of_monorepo`** repos have special branch protection: only
  `mage-os-ci` can push (instead of team-based push access).
- **Repository files** (CODEOWNERS, workflows) ignore `commit_author` and
  `commit_email` changes in lifecycle to avoid unnecessary state drift.

## CI/CD Pipeline

1. **PR opened** -> `tofu-checks.yml` runs format check + validate (no secrets)
2. **Admin comments `/plan`** -> `tofu-plan.yml` runs `tofu plan` and posts
   output as PR comment (access restricted to Vinai and sprankhub)
3. **PR merged to main** -> `tofu-apply.yml` runs `tofu apply -auto-approve`

Only `.tf` file changes trigger the workflows. Changes to `.md`, `.gitignore`,
and `CODEOWNERS` are excluded.

Concurrency group `tofu-ci` prevents parallel plan/apply operations.

## Naming Conventions

- Mirror repos: `mirror-{upstream-name}` (e.g., `mirror-magento2`)
- Fork repos: `mageos-{upstream-name}` (e.g., `mageos-magento2`)
- Lab modules: `module-{name}` with topic `mage-os-lab`
- Team keys are lowercase slugs (e.g., `tech-lead`, `continuous-integration`)

## Gotchas

- The `$${{ ... }}` syntax in `github_repository_file` content blocks is
  intentional -- the double `$` escapes GitHub Actions expression syntax so
  Terraform doesn't interpret it as an interpolation.
- `data.github_user.users` dynamically looks up all users referenced in
  repository `users` fields. If you add a `users` entry, the user must exist
  on GitHub or `tofu plan` will fail.
- Branch protection for repositories uses `pattern = "*"` (wildcard), meaning
  it applies to all branches, not just the default branch.
- The `tofu-plan.yml` workflow has a hardcoded ACL of GitHub usernames allowed
  to trigger plans. Update the `if` condition to change who can run `/plan`.
