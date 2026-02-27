# CLAUDE.md

OpenTofu IaC managing the Mage-OS GitHub organization (nonprofit Magento Open Source distribution).
Manages: org membership/roles, 6 teams, ~60 source repos, ~39 mirror repos, auto-generated repo files (CODEOWNERS, workflows).

## Files

No modules. All config is in two files:
- `main.tf` — provider, data sources, all resources
- `variables.tf` — all variables with defaults as actual config (no .tfvars)
- `.github/workflows/tofu-checks.yml` — PR: fmt + validate (no secrets)
- `.github/workflows/tofu-plan.yml` — `/plan` PR comment triggers plan (ACL: Vinai, sprankhub)
- `.github/workflows/tofu-apply.yml` — push to main: auto-apply

## Validation

```bash
tofu fmt           # auto-fix formatting (must pass CI)
tofu init -backend=false && tofu validate  # local syntax check
```

## Provider/Backend

Provider: `integrations/github ~> 6.2`, auth via GitHub App (`TF_VAR_github_app_id`, `TF_VAR_github_app_installation_id`, `TF_VAR_github_app_pem_file`).
Backend: GCS bucket `mage-os-tf-state`.

## Variable Schemas

All config lives in `variables.tf` default values.

**`repositories`** map — key = repo name:
- `description` (required, string)
- `teams` (required, list of team keys)
- `users` (optional, list of GitHub usernames — adds direct push access)
- `topics` (optional, list of strings)
- `default_branch` (optional, string)
- `homepage_url` (optional, string)
- `archived` (optional, bool — skips branch protection + eComscan)
- `is_part_of_monorepo` (optional, bool — restricts push to mage-os-ci only)
- `release_please_branch` (optional, string — adds protected branch for release-please)
- `branch_protection_patterns` (optional, list of strings — custom branch protection patterns instead of wildcard `"*"`; each pattern gets the same PR review/push restriction rules)

**`mirror_repositories`** map — key = `mirror-{upstream-name}`:
- `description` (required), `teams` (required), `topics` (optional)

**`teams`** map — key = team slug:
- `name` (required), `description` (required), `members` (required, list of GitHub usernames)

**`administrators`** list — GitHub usernames with org admin role + auto-maintainer on teams.

## Resources (main.tf)

```
github_membership.users             — org membership from all team members + administrators
github_team.teams                   — team creation
  github_team_membership.members    — team member assignment
github_repository.mirrors           — mirror repos (has_issues=false, prevent_destroy)
  github_branch_protection.mirrors  — wildcard "*", only mage-os-ci can push
github_repository.repositories      — source repos (auto_init, delete_branch_on_merge, prevent_destroy)
  github_branch_default             — custom default branches
  github_branch_protection          — wildcard "*" for repos without custom patterns: require PR reviews (1 approval, code owner, tech-lead dismissal), team/user push restrictions
  github_branch_protection...custom — per-pattern rules for repos with branch_protection_patterns (same settings)
  github_branch_protection...release-please — release-please branch protection
  github_team_repository.teams      — team push access
  github_team_repository.tech-lead  — tech-lead gets maintain on all repos
  github_repository_file.codeowners — auto-generated from teams/users
  github_repository_file.merge-upstream-changes — for mageos-* repos with matching mirror-* repo
  github_repository_file.sansec_ecomscan_workflow — security scanning on all non-archived repos
```

## Common Tasks

All changes are in `variables.tf`:
- **Add user to team:** add username to team's `members` list (auto-handles org invite)
- **Add source repo:** add entry to `repositories` with `description` + `teams` (auto-creates branch protection, CODEOWNERS, eComscan workflow, tech-lead access)
- **Add mirror repo:** add entry to `mirror_repositories` as `mirror-{name}` (auto-creates ci-only branch protection)
- **Archive repo:** set `archived = true`
- **Add user push access:** add `users = ["username"]` to repo entry
- **Import existing repo:** `tofu import github_repository.repositories[\"name\"] name`
- **Mirror-fork linkage:** `mageos-X` auto-gets `merge-upstream-changes.yml` if `mirror-X` exists

## CI/CD

1. PR opened → `tofu-checks.yml` (fmt + validate, no secrets)
2. `/plan` comment → `tofu-plan.yml` (posts plan to PR, ACL-gated)
3. Merge to main → `tofu-apply.yml` (auto-approve)

Only `.tf` changes trigger workflows. Concurrency group `tofu-ci` prevents parallel runs.

## Safety

- `prevent_destroy = true` on all repos — cannot delete via Terraform
- Removing user from all teams does NOT revoke org membership — must remove from `teams` var entirely
- `administrators` get explicit maintainer role on teams to avoid state drift
- `app_node_id` (separate from app ID) identifies the GitHub App in branch protection ACLs
- Repository files ignore `commit_author`/`commit_email` lifecycle changes

## Naming

- Mirrors: `mirror-{upstream}` (e.g., `mirror-magento2`)
- Forks: `mageos-{upstream}` (e.g., `mageos-magento2`)
- Lab modules: `module-{name}` with topic `mage-os-lab`
- Team keys: lowercase slugs (`tech-lead`, `continuous-integration`)

## Gotchas

- `$${{ }}` in `github_repository_file` content is intentional — escapes GitHub Actions expressions from Terraform interpolation
- `data.github_user.users` dynamically resolves repo `users` entries — user must exist on GitHub or plan fails
- Branch protection uses `pattern = "*"` (all branches, not just default)
- `/plan` ACL is hardcoded in `tofu-plan.yml` `if` condition
