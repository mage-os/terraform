# terraform
Terraform files for managing organization infrastructure. See `INSTALL.md` for instructions on how to prepare this setup from scratch on GitHub.


## Adding Users To Teams

In order to add a new user to an existing team, follow these steps:

1. Open the [variables.tf](https://github.com/Jakski-IT/terraform/blob/main/variables.tf) file.
2. Find the team you want to edit in the `variable "teams"` section.
3. Add the GitHub user name to the `members` array of the respective team.


## Adding New Repositories

In order to add new repositories, so that the respective permissions / protections are applied automatically, follow these steps:

1. Open the [variables.tf](https://github.com/Jakski-IT/terraform/blob/main/variables.tf) file.
2. Add the repository in the `variable "repositories"` > `default` section replacing the placeholders:

        {{REPOSITORY_NAME}} = {
          description = "{{DESCRIPTION}}"
          teams = [
            "{{TEAM_NAME}}"
          ]
        }
