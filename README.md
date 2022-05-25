# terraform
Terraform files for managing organization infrastructure. See `INSTALL.md` for instructions on how to prepare this setup from scratch on GitHub.

## Adding Users To Teams

In order to add a new user to an existing team, follow these steps:

1. Open the [variables.tf](https://github.com/mage-os/terraform/blob/main/variables.tf) file.
2. Find the team you want to edit in the `variable "teams"` section.
3. Add the GitHub user name to the `members` array of the respective team.

## Adding New Repositories

In order to add new repositories, so that the respective permissions / protections are applied automatically, follow these steps:

1. Open the [variables.tf](https://github.com/mage-os/terraform/blob/main/variables.tf) file.
2. Add the repository in the `variable "repositories"` > `default` section replacing the placeholders:

        {{REPOSITORY_NAME}} = {
          description = "{{DESCRIPTION}}"
          teams = [
            "{{TEAM_NAME}}"
          ]
        }


## Changing Terraform Configuration

The process for changing Terraform configuration is as follows:

1. Change configuration as you wish and send a pull request.
2. GitHub Actions will automatically be run to check the syntax of the updated configuration. For first-time users, an administrator needs to approve the run of this GitHub Action once.
3. Administrators can now add a comment to the pull request with the text "/plan". This will dry-run the configuration changes and show the output of the applied changes.
4. When the merge checks are fulfilled, the pull request can be merged. Another GitHub Action will automatically be triggered and will actually apply the changes.
