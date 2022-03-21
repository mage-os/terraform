variable "app_node_id" {
  type    = string
  default = null
}

variable "organization_name" {
  type    = string
  default = "Jakski-IT"
}

# NOTE: Administrators are automatically maintainers for all teams.
variable "administrators" {
  type = list(string)
  default = [
    "Jakski",
    "Vinai",
    "sprankhub",
  ]
}

variable "mirror_repositories" {
  type = map(any)
  default = {
    sphinxcontrib-autoyaml = {}
  }
}

variable "teams" {
  type = map(object({
    name        = string
    description = string
    members     = list(string)
  }))
  default = {
    tech-lead = {
      name        = "Tech-lead"
      description = "Technical leaders"
      members = [
        "JakskiWork",
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
        "sprankhub",
      ]
    }
  }
}

# NOTE: Don't assign tech-lead to any repository. They're maintainers by
# default.
variable "repositories" {
  type = map(object({
    description = string
    teams       = list(string)
  }))

  default = {
    terraform = {
      description = "Terraform files for managing organization infrastructure"
      teams       = []
    }

    distribution1 = {
      description = "Distribution 1"
      teams = [
        "distribution"
      ]
    }

    shared1 = {
      description = "Shared repository"
      teams = [
        "content",
        "distribution",
      ]
    }
  }
}
