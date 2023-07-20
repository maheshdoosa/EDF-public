provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

//have to use remote state due to tf task
terraform {
  backend "azurerm" {}
  //backend "local" {}
}

provider "github" {
  token        = data.azurerm_key_vault_secret.kvsecretghpat.value
  organization = var.ghOrganisation
  version      = "~> 2.3"
}
