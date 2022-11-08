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

    "mirror-commerce-admin.en" = {
      description = "Mage-OS mirror of https://github.com/AdobeDocs/commerce-admin.en."
      teams       = ["continuous-integration"]
    }

    mirror-commerce-data-export = {
      description = "Mage-OS mirror fork of https://github.com/magento/commerce-data-export."
      teams       = ["continuous-integration"]
    }

    "mirror-commerce-operations.en" = {
      description = "Mage-OS mirror of https://github.com/AdobeDocs/commerce-operations.en."
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
        "DavidLambauer",
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

    generate-mirror-repo-js = {
      description = "Mage-OS packaging implementation (JavaScript)."
      teams       = ["infrastructure"]
    }

    infrastructure = {
      description = "Mage-OS organization infrastructure discussion and GitHub Actions."
      teams       = ["infrastructure"]
    }

    mage-os-website = {
      description = "Source of the mage-os.org website."
      teams       = ["content"]
      homepage_url = "https://mage-os.org"
    }

    mageos-adobe-stock-integration = {
      description = "This is a Mage-OS fork of the Magento Adobe Stock Integration Project found at https://github.com/magento/adobe-stock-integration."
      teams       = ["distribution"]
    }

    mageos-commerce-data-export = {
      description = "This is a Mage-OS fork of the Magento Commerce Data Export Project found at https://github.com/magento/commerce-data-export."
      teams       = ["distribution"]
    }

    mageos-composer-dependency-version-audit-plugin = {
      description = "This is a Mage-OS fork of the validating Magento packages through a composer plugin Project found at https://github.com/magento/composer-dependency-version-audit-plugin."
      teams       = ["distribution"]
    }

    mageos-composer-root-update-plugin = {
      description = "This is a Mage-OS fork of the Magento Composer Root Update Plugin found at https://github.com/magento/composer-root-update-plugin."
      teams       = ["distribution"]
    }

    mageos-inventory = {
      description = "This is a Mage-OS fork of the Magento Inventory Project (a.k.a MSI) found at https://github.com/magento/inventory."
      teams       = ["distribution"]
    }

    mageos-inventory-composer-installer = {
      description = "This is a Mage-OS fork of the Inventory Composer Installer Project found at https://github.com/magento/inventory-composer-installer."
      teams       = ["distribution"]
    }

    mageos-magento-composer-installer = {
      description = "This is a Mage-OS fork of the Magento Composer Installer Project found at https://github.com/magento/magento-composer-installer."
      teams       = ["distribution"]
    }

    mageos-magento2 = {
      description = "Work in progress."
      teams       = ["distribution"]
    }

    mageos-magento2-page-builder = {
      description = "This is a Mage-OS fork of the Magento2 PageBuilder Project found at https://github.com/magento/magento2-page-builder."
      teams       = ["distribution"]
    }

    mageos-magento2-sample-data = {
      description = "This is a Mage-OS fork of the Magento 2 Sample Data Project found at https://github.com/magento/magento2-sample-data."
      teams       = ["distribution"]
    }

    mageos-security-package = {
      description = "This is a Mage-OS fork of the Magento Security Extensions project found at https://github.com/magento/security-package."
      teams       = ["distribution"]
    }

    namespace = {
      description = "This repository serves to register the mage-os packagist namespace."
      teams       = ["infrastructure"]
    }
  }
}
