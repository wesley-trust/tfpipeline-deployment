resource "azuredevops_build_definition" "tfmodule-resource_group" {
  project_id = one(data.azuredevops_projects.terraform.projects[*].project_id)
  name       = "ENV-${local.service_environment_prefix}; tfmodule-resource_group; REF-${var.service_deployment};"
  path       = var.deployment_module_folder

  repository {
    repo_id               = "wesley-trust/tfmodule-resource_group"
    repo_type             = var.repo_type
    yml_path              = var.yml_path
    branch_name           = var.pipeine_branch
    service_connection_id = var.service_connection_id
  }

  ci_trigger {
    use_yaml = true
  }

  variable {
    Environment = terraform.workspace
    Service     = "ModuleServices"
  }
}
