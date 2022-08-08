data "azuredevops_projects" "terraform" {
  name = var.pipeline_project
}