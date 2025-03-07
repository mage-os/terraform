# terraform
OpenTofu files for managing organization infrastructure. See `INSTALL.md` for instructions on how to prepare this setup from scratch on GitHub.

## Adding Users To Teams

In order to add a new user to an existing team, follow these steps:

1. Open the [variables.tf](https://github.com/mage-os/opentofu/blob/main/variables.tf) file.
2. Find the team you want to edit in the `variable "teams"` section.
3. Add the GitHub user name to the `members` array of the respective team.

## Adding New Repositories

In order to add new repositories, so that the respective permissions / protections are applied automatically, follow these steps:

1. Open the [variables.tf](https://github.com/mage-os/opentofu/blob/main/variables.tf) file.
2. Add the repository in the `variable "repositories"` > `default` section replacing the placeholders:

        {{REPOSITORY_NAME}} = {
          description = "{{DESCRIPTION}}"
          teams = [
            "{{TEAM_NAME}}"
          ]
        }

OpenTofu will then automatically create this repository with the appropriate settings. If you created the repository manually on GitHub before, you need to manually import that repository into OpenTofu. Therefore, [run the following OpenTofu command locally](#executing-opentofu-actions-locally):

For source repositories:

    tofu import github_repository.repositories[\"your-repository-name\"] your-repository-name

For mirror repositories:

    tofu import github_repository.mirrors[\"your-mirror-repository-name\"] your-mirror-repository-name

## Changing OpenTofu Configuration

The process for changing OpenTofu configuration is as follows:

1. Change configuration as you wish and send a pull request.
2. GitHub Actions will automatically be run to check the syntax of the updated configuration. For first-time users, an administrator needs to approve the run of this GitHub Action once.
3. Administrators can now add a comment to the pull request with the text "/plan". This will dry-run the configuration changes and show the output of the applied changes.
4. When the merge checks are fulfilled, the pull request can be merged. Another GitHub Action will automatically be triggered and will actually apply the changes.

## Executing OpenTofu Actions Locally

In general, we run OpenTofu via GitHub Actions. However, in certain cases, it might be handy to execute OpenTofu locally. Therefore, install OpenTofu and set the following environment variables:

* `TF_VAR_github_app_id`: The ID of the Mage-OS OpenTofu GitHub App, which is shown at https://github.com/organizations/mage-os/settings/apps/mage-os-terraform.
* `TF_VAR_github_app_installation_id`: The installation ID of the Mage-OS OpenTofu GitHub App, which you find in the URL when you click on "Configure" for the respective app on https://github.com/organizations/mage-os/settings/installations.
* `TF_VAR_app_node_id`: The node ID of the app, which you find out as described in the [installation docs](INSTALL.md#getting-github-app-node-id).
* `TF_VAR_github_app_pem_file`: The contents of the private key that you can create on https://github.com/organizations/mage-os/settings/apps/mage-os-terraform.
* `GOOGLE_APPLICATION_CREDENTIALS`: The (preferably absolute) path to the key file you can generate in Google Cloud > IAM & Admin > Service Accounts > Mage-OS Terraform account > Keys.
