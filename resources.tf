resource "azuredevops_build_definition" "tfmodule-resource_group" {
  project_id = data.azuredevops_projects.terraform.projects[0].project_id
  name       = "tfmodule-resource_group-${var.service_deployment}"
  path       = "\\Modules\\Deployments"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type             = "GitHub"
    repo_id               = "wesley-trust/tfmodule-resource_group"
    branch_name           = "main"
    yml_path              = "Pipeline/azure-pipelines.yml"
    service_connection_id = "33f222d9-67c3-4645-a96b-157a5f29b41e"
  }
}