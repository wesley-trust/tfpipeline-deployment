# Variables
variable "resource_pipeline" {
  description = "The pipelines to deploy"
  type        = map(any)
  default = {
    root = [
      "pkr-directory_services",
      "tfroot-directory_services",
      "tfroot-edge_services",
      "tfroot-file_services",
      "tfroot-management_services",
      "tfrepo-deployment"
    ]

    module = [
      "tfmodule-resource_group",
      "tfmodule-compute",
      "tfmodule-network_peering",
      "tfmodule-recovery_services",
      "tfmodule-static_site",
      "tfmodule-storage_sync",
      "tfmodule-traffic_manager"
    ]

    submodule = [
      "tfsubmodule-network",
      "tfsubmodule-disks",
      "tfsubmodule-key_vault",
      "tfsubmodule-network_interfaces",
      "tfsubmodule-public_load_balancer",
      "tfsubmodule-virtual_machine"
    ]
  }
}

variable "pipeline_service" {
  description = "The pipeline service"
  type        = map(any)
  default = {
    "pkr-directory_services"     = "Image-DirectoryServices"
    "tfroot-directory_services"  = "DirectoryServices"
    "tfroot-edge_services"       = "EdgeServices"
    "tfroot-file_services"       = "FileServices"
    "tfroot-management_services" = "ManagementServices"
    "tfrepo-deployment"          = "RepositoryServices"
  }
}

variable "pipeline_path" {
  description = "The folder used to store the pipeline within Azure DevOps"
  type        = map(any)
  default = {
    module    = "\\Modules\\Deployments"
    submodule = "\\Modules\\Resources"
  }
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "latest"
}

variable "service_connection_id" {
  description = "The GitHub service_connection_id used in Azure DevOps"
  type        = string
  default     = "33f222d9-67c3-4645-a96b-157a5f29b41e"
}

variable "pipeline_project" {
  description = "Azure DevOps Project name used for the collection of Pipelines"
  type        = string
  default     = "Terraform"
}

variable "pipeline_branch" {
  description = "The GitHub branch that contains the pipeline definition"
  type        = string
  default     = "refs/heads/main"
}

variable "yml_path" {
  description = "The path to the YAML definition in the GitHub repo"
  type        = string
  default     = "pipeline/azure-pipelines.yml"
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
