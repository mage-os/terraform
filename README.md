# terraform
Terraform files for managing organization infrastructure


## Adding Users To Teams

In order to add a new user to an existing team, follow these steps:

1. Open the [variables.tf](https://github.com/Jakski-IT/terraform/blob/main/variables.tf) file.
2. Find the team you want to edit in the `variable "teams"` section.
3. Add the GitHub user name to the `members` array of the respective team.
