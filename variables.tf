variable "app_node_id" {
  type    = string
  default = null
}

variable "organization_name" {
  type    = string
  default = "Jakski-IT"
}

# NOTE: Administrators are automatically assigned to every team. Trying to
# assign them will cause phantom changes in provider.
variable "administrators" {
  type = list(string)
  default = [
    "Jakski"
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
      repositories = {
        content1 = {}
      }
    }

    distribution = {
      name        = "Distribution"
      description = "Distribution mergers"
      members = [
        "JakskiWork",
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

    infra1-test = {
      description = "Infrastructure repository 1"
      teams = [
        "infrastructure",
      ]
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
