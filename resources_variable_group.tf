resource "azuredevops_variable_group" "terraform-backend" {
  project_id   = local.project_id
  name         = "terraform-backend-01"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "backendAzureRmKey"
    value = "terraform.tfstate"
  }

  variable {
    name  = "backendAzureRmResourceGroupLocation"
    value = "uksouth"
  }

  variable {
    name  = "backendAzureRmResourceGroupName"
    value = "TerraformServices-rg"
  }

  variable {
    name  = "backendAzureRmStorageAccountName"
    value = "terraformsvcsprodsa"
  }

  variable {
    name  = "backendServiceArm"
    value = "ARM-Alpha"
  }
}

resource "azuredevops_variable_group" "terraform-global" {
  project_id   = local.project_id
  name         = "terraform-global"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "DelayMinutes"
    value = "5"
  }
}

resource "azuredevops_variable_group" "terraform-system" {
  project_id   = local.project_id
  name         = "terraform-system"
  description  = "Managed by Terraform"
  allow_access = true

  variable {
    name  = "terraformVersion"
    value = "1.0.4"
  }
}
