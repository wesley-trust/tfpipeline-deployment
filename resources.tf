resource "azuredevops_project" "example" {
  name               = "Example Project-${var.service_deployment}"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "example" {
  project_id = azuredevops_project.example.id
  name       = "Example Repository"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_variable_group" "example" {
  project_id   = azuredevops_project.example.id
  name         = "Example Pipeline Variables"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "FOO"
    value = "BAR"
  }
}

resource "azuredevops_build_definition" "example" {
  project_id = azuredevops_project.example.id
  name       = "Example Build Definition"
  path       = "\\ExampleFolder"

  ci_trigger {
    use_yaml = true
  }

  schedules {
    branch_filter {
      include = ["master"]
      exclude = ["test", "regression"]
    }
    days_to_build              = ["Wed", "Sun"]
    schedule_only_with_changes = true
    start_hours                = 10
    start_minutes              = 59
    time_zone                  = "(UTC) Coordinated Universal Time"
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.example.id
    branch_name = azuredevops_git_repository.example.default_branch
    yml_path    = "azure-pipelines.yml"
  }

  variable_groups = [
    azuredevops_variable_group.example.id
  ]

  variable {
    name  = "PipelineVariable"
    value = "Go Microsoft!"
  }

  variable {
    name         = "PipelineSecret"
    secret_value = "ZGV2cw"
    is_secret    = true
  }
}