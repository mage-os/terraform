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

    mirror-data-migration-tool = {
      description = "Mage-OS mirror fork of https://github.com/magento/data-migration-tool."
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

    mirror-magento-zend-cache = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-cache."
      teams       = ["continuous-integration"]
    }

    mirror-magento-zend-db = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-db."
      teams       = ["continuous-integration"]
    }

    mirror-magento-zend-exception = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-exception."
      teams       = ["continuous-integration"]
    }

    mirror-magento-zend-loader = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-loader."
      teams       = ["continuous-integration"]
    }

    mirror-magento-zend-log = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-log."
      teams       = ["continuous-integration"]
    }

    mirror-magento-zend-memory = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-memory."
      teams       = ["continuous-integration"]
    }

    mirror-magento-zend-pdf = {
      description = "Mage-OS mirror fork of https://github.com/magento/magento-zend-pdf."
      teams       = ["continuous-integration"]
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

    mirror-PHPCompatibilityFork = {
      description = "Mage-OS mirror fork of https://github.com/magento/PHPCompatibilityFork."
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
        "avstudnitz",
      ]
    }

    content = {
      name        = "Content"
      description = "Content mergers"
      members = [
        "johnhughes1984",
        "wigman",
        "Vinai",
        "DavidLambauer",
        "johnprendergast"
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
        "rhoerr",
        "fballiano",
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
        "rhoerr",
        "cmuench",
        "fballiano",
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

    generate-mirror-repo-js = {
      description = "Mage-OS packaging implementation (JavaScript)."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    github-actions = {
      description           = "Mage-OS GitHub Actions for the distribution repositories."
      teams                 = ["infrastructure"]
      topics                = ["mage-os", "devops", "qa", "ecommerce", "ci", "actions", "magento2", "github-actions", "adobecommerce", "hacktoberfest"]
      release_please_branch = "release-please--branches--main--components--github-actions"
    }

    infrastructure = {
      description = "Mage-OS organization infrastructure discussion and GitHub Actions."
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "terraform", "magento2", "adobecommerce"]
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
      default_branch = "4.x"
      topics         = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-async-events-sinks = {
      description = "This is a mono repository for different event sinks for mageos-async-events."
      teams       = ["distribution", "async-events"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-async-events-aws = {
      description         = "This module provides events integrations to AWS."
      teams               = ["distribution", "async-events"]
      topics              = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce", "aws"]
      is_part_of_monorepo = true
    }

    mageos-async-events-azure = {
      description         = "This module provides events integrations to Azure."
      teams               = ["distribution", "async-events"]
      topics              = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce", "azure"]
      is_part_of_monorepo = true
    }

    mageos-async-events-gcp = {
      description         = "This module provides events integrations to GCP."
      teams               = ["distribution", "async-events"]
      topics              = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce", "gcp"]
      is_part_of_monorepo = true
    }

    mageos-async-events-admin-ui = {
      description = "This module provides an admin UI for the Mage-OS Asynchronous Events module."
      teams       = ["distribution", "async-events"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-commerce-data-export = {
      description = "This is a Mage-OS fork of the Magento Commerce Data Export Project found at https://github.com/magento/commerce-data-export."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-common-async-events = {
      description = "This module implements the most common events like order creation or customer change for the Mage-OS Asynchronous Events module."
      teams       = ["distribution", "async-events"]
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
      description = "This is a Mage-OS fork of the Magento Coding Standard found at https://github.com/magento/magento-coding-standard."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento-composer-installer = {
      description = "This is a Mage-OS fork of the Magento Composer Installer Project found at https://github.com/magento/magento-composer-installer."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-magento-zend-cache = {
      description = "This is a Mage-OS fork of the Zend_Cache Project found at https://github.com/magento/magento-zend-cache."
      teams       = ["distribution"]
    }

    mageos-magento-zend-db = {
      description = "This is a Mage-OS fork of the Zend_Db Project found at https://github.com/magento/magento-zend-db."
      teams       = ["distribution"]
    }

    mageos-magento-zend-exception = {
      description = "This is a Mage-OS fork of the Zend_Exception Project found at https://github.com/magento/magento-zend-exception."
      teams       = ["distribution"]
    }

    mageos-magento-zend-loader = {
      description = "This is a Mage-OS fork of the Zend_Loader Project found at https://github.com/magento/magento-zend-loader."
      teams       = ["distribution"]
    }

    mageos-magento-zend-log = {
      description = "This is a Mage-OS fork of the Zend_Log Project found at https://github.com/magento/magento-zend-log."
      teams       = ["distribution"]
    }

    mageos-magento-zend-memory = {
      description = "This is a Mage-OS fork of the Zend_Memory Project found at https://github.com/magento/magento-zend-memory."
      teams       = ["distribution"]
    }

    mageos-magento-zend-pdf = {
      description = "This is a Mage-OS fork of the Zend_Pdf Project found at https://github.com/magento/magento-zend-pdf."
      teams       = ["distribution"]
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

    mageos-PHPCompatibilityFork = {
      description = "This is a Mage-OS fork of the Magento 2 PHPCompatibility fork found at https://github.com/magento/PHPCompatibilityFork."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    mageos-security-package = {
      description = "This is a Mage-OS fork of the Magento Security Extensions Project found at https://github.com/magento/security-package."
      teams       = ["distribution"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
    }

    magento-gitpod = {
      description = "Mage-OS Mirror & Nightly Build Instances In One Click"
      teams       = ["infrastructure"]
      topics      = ["mage-os", "magento", "ecommerce", "magento2", "adobecommerce"]
      archived     = true
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
