resource "azuredevops_build_definition" "submodule" {
  for_each   = toset(var.resource_pipeline.submodule)
  name       = "ENV-${local.service_environment_prefix};TAG-${var.service_deployment}; ${each.value}"
  project_id = local.project_id
  path       = var.pipeline_path.submodule

  repository {
    repo_id               = "${var.repo_id}/${each.value}"
    repo_type             = var.repo_type
    yml_path              = var.yml_path
    branch_name           = var.pipeline_branch
    service_connection_id = var.service_connection_id
  }

  ci_trigger {
    use_yaml = true
  }

  pull_request_trigger {
    use_yaml = true

    forks {
      enabled       = false
      share_secrets = false
    }
  }
}
