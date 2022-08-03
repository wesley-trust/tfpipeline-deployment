resource "azuredevops_build_definition" "deployments" {
  for_each   = toset(var.resource_pipeline.deployments)
  name       = "ENV-${local.service_environment_prefix}; ${each.value}; REF-${var.service_deployment};"
  project_id = local.project_id
  path       = var.pipeline_path[deployments]

  repository {
    repo_id               = "wesley-trust/${each.value}"
    repo_type             = var.repo_type
    yml_path              = var.yml_path
    branch_name           = var.pipeline_branch
    service_connection_id = var.service_connection_id
  }

  variable {
    name  = "Service"
    value = var.pipeline_service[each.value]
  }

  variable {
    name  = "Environment"
    value = terraform.workspace
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
