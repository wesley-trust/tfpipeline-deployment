resource "azuredevops_build_definition" "root" {
  for_each   = toset(var.resource_pipeline.root)
  name       = "ENV-${local.service_environment_prefix};${var.service_deployment}; ${each.value}"
  project_id = local.project_id
  path       = "\\${var.pipeline_service[each.value]}"

  repository {
    repo_id               = "${var.repo_id}/${each.value}"
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
