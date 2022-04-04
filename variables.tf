# Provided in environment as TF_VAR_* variables
variable "github_app_id" { default = null }
variable "github_app_installation_id" { default = null }
variable "github_app_pem_file" { default = null }
variable "app_node_id" { default = null }

variable "organization_name" {
  default = "Jakski-IT"
}

variable "administrators" {
  default = [
    "Jakski",
    "Vinai",
    "sprankhub",
  ]
}

variable "mirror_repositories" {
  default = {
    sphinxcontrib-autoyaml = {}
  }
}

variable "teams" {
  default = {
    tech-lead = {
      name        = "Tech-lead"
      description = "Technical leaders"
      members = [
        "Jakski",
      ]
    }

    infrastructure = {
      name        = "Infrastructure"
      description = "Infrastructure mergers"
      members = [
        "JakskiWork",
      ]
    }

    content = {
      name        = "Content"
      description = "Content mergers"
      members = [
        "JakskiWork",
      ]
    }

    distribution = {
      name        = "Distribution"
      description = "Distribution mergers"
      members = [
        "JakskiWork",
        "Jakski",
      ]
    }
  }
}

variable "repositories" {
  default = {
    terraform = {
      description = "Terraform files for managing organization infrastructure"
    }

    distribution1 = {
      description = "Distribution 1"
      teams = ["distribution"]
    }

    shared1 = {
      description = "Shared repository"
      teams = ["content", "distribution"]
    }
  }
}
