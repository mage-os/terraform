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
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-adobe-stock-integration = {
      description = "Mage-OS mirror fork of https://github.com/magento/adobe-stock-integration."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    "mirror-commerce-admin.en" = {
      description = "Mage-OS mirror of https://github.com/AdobeDocs/commerce-admin.en."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-commerce-data-export = {
      description = "Mage-OS mirror fork of https://github.com/magento/commerce-data-export."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    "mirror-commerce-operations.en" = {
      description = "Mage-OS mirror of https://github.com/AdobeDocs/commerce-operations.en."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-composer = {
      description = "Mage-OS mirror fork of https://github.com/magento/composer."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-composer-dependency-version-audit-plugin = {
      description = "Mage-OS mirror fork of https://github.com/magento/composer-dependency-version-audit-plugin."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-composer-root-update-plugin = {
      description = "Mage-OS mirror fork of https://github.com/magento/composer-root-update-plugin."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-devdocs = {
      description = "Mage-OS mirror fork of https://github.com/magento/devdocs."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-inventory = {
      description = "Mage-OS mirror fork of https://github.com/magento/inventory."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-inventory-composer-installer = {
      description = "Mage-OS mirror fork of https://github.com/magento/inventory-composer-installer."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento-cloud-patches = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-cloud-patches."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento-coding-standard = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-coding-standard."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento-composer-installer = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-composer-installer."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento2 = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento2-functional-testing-framework = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2-functional-testing-framework."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento2-page-builder = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2-page-builder."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-magento2-sample-data = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento2-sample-data."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-module-configurable-sample-data-venia = {
      description = "Mage-OS mirror fork of https://github.com/magento/module-configurable-sample-data-venia."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-page-builder-types = {
      description = "Mage-OS mirror fork of https://github.com/magento/page-builder-types."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-quality-patches = {
      description = "Mage-OS mirror fork of https://github.com/magento/quality-patches."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-security-package = {
      description = "Mage-OS mirror fork of https://github.com/magento/security-package."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }

    mirror-zf1 = {
      description = "Mage-OS mirror fork of https://github.com/magento/zf1."
      teams       = ["continuous-integration"]
      topics      = ["mage-os", "mirror", "magento", "php", "ecommerce", "magento2", "adobecommerce"]
    }
  }
}

variable "teams" {
  default = {
    async-events = {
      name        = "async-events"
      description = "Team collaborating on the mageos-async-events repository."
      members = [
        "gowrizrh",
      ]
    }

    content = {
      name        = "Content"
      description = "Content mergers"
      members = [
        "johnhughes1984",
        "wigman",
        "Vinai",
        "DavidLambauer"
      ]
    }

    continuous-integration = {
      name        = "Continuous Integration"
      description = "Continuous Integration"
      members = [
        "mage-os-ci",
      ]
    }

    distribution = {
      name        = "Distribution"
      description = "Distribution mergers"
      members = [
        "Vinai",
        "sprankhub",
        "damienwebdev",
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

    tech-lead = {
      name        = "Tech-lead"
      description = "Technical leaders"
      members = [
        "Vinai",
      ]
    }
  }
}

variable "repositories" {
  default = {
    devdocs-website = {
      description = "Mage-OS devdocs website"
      teams       = ["infrastructure", "content"]
      topics      = ["mage-os", "documentation", "ecommerce", "magento2", "adobecommerce"]
    },
    devdocs = {
      description = "Mage-OS devdocs"
      teams       = ["infrastructure", "content"]
      topics      = ["mage-os", "documentation", "ecommerce", "magento2", "adobecommerce"]
    },
    dev-env-gitpod = {
      description = "Mage-OS development environment via Gitpod."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    generate-mirror-repo-js = {
      description = "Mage-OS packaging implementation (JavaScript)."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    github-actions = {
      description = "Mage-OS GitHub Actions for the distribution repositories."
      teams       = ["distribution"]
      topics      = ["mage-os", "devops", "qa", "ecommerce", "ci", "actions", "magento2", "github-actions", "adobecommerce"]
    }

    infrastructure = {
      description = "Mage-OS organization infrastructure discussion and GitHub Actions."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "terraform", "IaC", "magento2", "adobecommerce"]
    }

    mage-os-website = {
      description  = "Source of the mage-os.org website."
      teams        = ["content"]
      homepage_url = "https://mage-os.org"
      archived     = true
    }

    mageos-adobe-stock-integration = {
      description = "This is a Mage-OS fork of the Magento Adobe Stock Integration Project found at https://github.com/magento/adobe-stock-integration."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-async-events = {
      description    = "This is a Mage-OS repo for the porting of the Magento Asynchronous Events Project found at https://github.com/aligent/magento-async-events."
      teams          = ["distribution", "async-events"]
      default_branch = "3.x"
      topics         = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-commerce-data-export = {
      description = "This is a Mage-OS fork of the Magento Commerce Data Export Project found at https://github.com/magento/commerce-data-export."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-composer = {
      description = "This is a Mage-OS fork of the Magento Composer package Project found at https://github.com/magento/composer."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-composer-dependency-version-audit-plugin = {
      description = "This is a Mage-OS fork of the validating Magento packages through a composer plugin Project found at https://github.com/magento/composer-dependency-version-audit-plugin."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-composer-root-update-plugin = {
      description = "This is a Mage-OS fork of the Magento Composer Root Update Plugin found at https://github.com/magento/composer-root-update-plugin."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-inventory = {
      description = "This is a Mage-OS fork of the Magento Inventory Project (a.k.a MSI) found at https://github.com/magento/inventory."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-inventory-composer-installer = {
      description = "This is a Mage-OS fork of the Inventory Composer Installer Project found at https://github.com/magento/inventory-composer-installer."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento-coding-standard = {
      description = "This is a Mage-OS fork of the Magento Coding Standrad found at https://github.com/magento/magento-coding-standard."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento-composer-installer = {
      description = "This is a Mage-OS fork of the Magento Composer Installer Project found at https://github.com/magento/magento-composer-installer."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento2 = {
      description = "Work in progress."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento2-functional-testing-framework = {
      description = "This is a Mage-OS fork of the Magento 2 Functional Testing Framework found at https://github.com/magento/magento2-functional-testing-framework."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento2-page-builder = {
      description = "This is a Mage-OS fork of the Magento2 PageBuilder Project found at https://github.com/magento/magento2-page-builder."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento2-sample-data = {
      description = "This is a Mage-OS fork of the Magento 2 Sample Data Project found at https://github.com/magento/magento2-sample-data."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-security-package = {
      description = "This is a Mage-OS fork of the Magento Security Extensions Project found at https://github.com/magento/security-package."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    meta = {
      description = "This is a Mage-OS repo for documents like the contribution/review guidelines."
      teams = [
        "tech-lead",
        "infrastructure",
        "content",
        "distribution",
        "continuous-integration"
      ]
      topics = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    namespace = {
      description = "This repository serves to register the mage-os packagist namespace."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    terraform = {
      description = "Terraform files for managing the organization repository permissions."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }
  }
}
