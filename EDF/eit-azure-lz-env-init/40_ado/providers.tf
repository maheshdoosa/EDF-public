provider "azurerm" {
  version = "~>2.0"
  features {}
}

//have to use remote state due to tf task
terraform {
  backend "azurerm" {}
}

provider "azuredevops" {
  version               = ">= 0.0.1"
  personal_access_token = data.azurerm_key_vault_secret.kvsecretadopat.value
  org_service_url       = var.adoOrganisation
}
