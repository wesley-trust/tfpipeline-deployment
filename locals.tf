# Calculate local variables
locals {
  # Service functions and concatenations
  service_environment_prefix = substr(terraform.workspace, 0, 1)
}
