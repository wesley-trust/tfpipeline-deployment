# Variables
variable "resource_pipeline" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    root = [
      "tfroot-directory_services"
    ]

    module = [
      "tfmodule-resource_group"
    ]

    submodule = [
      "tfsubmodule-network"
    ]
  }
}

variable "pipeline_service" {
  description = "The pipeline service"
  type        = map(any)
  default = {
    "tfroot-directory_services" = "DirectoryServices"
  }
}

variable "pipeline_path" {
  description = "The folder used to store the pipeline within Azure DevOps"
  type        = map(any)
  default = {
    root      = "\\Modules\\Root"
    module    = "\\Modules\\Deployments"
    submodule = "\\Modules\\Resources"

  }
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "service_connection_id" {
  description = "The GitHub service_connection_id used in Azure DevOps"
  type        = string
  default     = "33f222d9-67c3-4645-a96b-157a5f29b41e"
}

variable "pipeline_branch" {
  description = "The GitHub branch that contains the pipeline definition"
  type        = string
  default     = "refs/heads/main"
}

variable "yml_path" {
  description = "The path to the YAML definition in the GitHub repo"
  type        = string
  default     = "Pipeline/azure-pipelines.yml"
}

variable "repo_type" {
  description = "The repo type for the Pipeline"
  type        = string
  default     = "GitHub"
}

variable "repo_id" {
  description = "The repo id (user account or organisation)"
  type        = string
  default     = "wesley-trust"
}
