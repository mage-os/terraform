# Provided in environment as TF_VAR_* variables
variable "github_app_id" { default = null }
variable "github_app_installation_id" { default = null }
variable "github_app_pem_file" { default = null }
variable "app_node_id" { default = null }

variable "organization_name" {
  default = "Mage-OS"
}

variable "administrators" {
  default = [
    "mage-os-ci",
  ]
}

variable "mirror_repositories" {
  default = {
    mirror-adobe-ims = {
      description = "Mage-OS mirror fork of https://github.com/magento/adobe-ims."
      teams       = ["continuous-integration"]
    }

    mirror-adobe-stock-integration = {
      description = "Mage-OS mirror fork of https://github.com/magento/adobe-stock-integration."
      teams       = ["continuous-integration"]
    }

    mirror-commerce-data-export = {
      description = "Mage-OS mirror fork of https://github.com/magento/commerce-data-export."
      teams       = ["continuous-integration"]
    }

    mirror-composer = {
      description = "Mage-OS mirror fork of https://github.com/magento/composer."
      teams       = ["continuous-integration"]
    }

    mirror-composer-dependency-version-audit-plugin = {
      description = "Mage-OS mirror fork of https://github.com/magento/composer-dependency-version-audit-plugin."
      teams       = ["continuous-integration"]
    }

    mirror-composer-root-update-plugin = {
      description = "Mage-OS mirror fork of https://github.com/magento/composer-root-update-plugin."
      teams       = ["continuous-integration"]
    }

    mirror-devdocs = {
      description = "Mage-OS mirror fork of https://github.com/magento/devdocs."
      teams       = ["continuous-integration"]
    }

    mirror-inventory = {
      description = "Mage-OS mirror fork of https://github.com/magento/inventory."
      teams       = ["continuous-integration"]
    }

    mirror-inventory-composer-installer = {
      description = "Mage-OS mirror fork of https://github.com/magento/inventory-composer-installer."
      teams       = ["continuous-integration"]
    }

    mirror-magento-composer-installer = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-composer-installer."
      teams       = ["continuous-integration"]
    }

    mirror-magento2 = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2."
      teams       = ["continuous-integration"]
    }

    mirror-magento2-page-builder = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2-page-builder."
      teams       = ["continuous-integration"]
    }

    mirror-magento2-sample-data = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2-sample-data."
      teams       = ["continuous-integration"]
    }

    mirror-module-configurable-sample-data-venia = {
      description = "Mage-OS mirror fork of https://github.com/magento/module-configurable-sample-data-venia."
      teams       = ["continuous-integration"]
    }

    mirror-page-builder-types = {
      description = "Mage-OS mirror fork of https://github.com/magento/page-builder-types."
      teams       = ["continuous-integration"]
    }

    mirror-security-package = {
      description = "Mage-OS mirror fork of https://github.com/magento/security-package."
      teams       = ["continuous-integration"]
    }

    mirror-zf1 = {
      description = "Mage-OS mirror fork of https://github.com/magento/zf1."
      teams       = ["continuous-integration"]
    }
  }
}

variable "teams" {
  default = {
    tech-lead = {
      name        = "Tech-lead"
      description = "Technical leaders"
      members = [
        "Vinai",
      ]
    }

    infrastructure = {
      name        = "Infrastructure"
      description = "Infrastructure mergers"
      members = [
        "Vinai",
        "sprankhub",
        "damienwebdev",
      ]
    }

    content = {
      name        = "Content"
      description = "Content mergers"
      members = [
        "johnhughes1984",
        "wigman",
        "Vinai",
      ]
    }

    distribution = {
      name        = "Distribution"
      description = "Distribution mergers"
      members = [
        "Vinai",
        "sprankhub",
      ]
    }

    continuous-integration = {
      name        = "Continuous Integration"
      description = "Continuous Integration"
      members = [
        "mage-os-ci",
      ]
    }
  }
}

variable "repositories" {
  default = {
    terraform = {
      description = "Terraform files for managing the organization repository permissions."
    }

    infrastructure = {
      description = "Mage-OS organization infrastructure discussion and GitHub Actions."
      teams       = ["infrastructure"]
    }

    mage-os-website = {
      description = "Source of the mage-os.org website."
      teams       = ["content"]
    }

    mageos-magento2 = {
      description = "Work in progress."
      teams       = ["distribution"]
    }

    namespace = {
      description = "This repository serves to register the mage-os packagist namespace."
      teams       = ["infrastructure"]
    }
  }
}
