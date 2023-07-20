provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
# terraform {
#   required_providers {
#     azurerm = "~> 2.0"
#     #    features {}
#   }
# }

provider "azurerm" {
  version         = "~>2.0"
  tenant_id       = data.azurerm_key_vault_secret.tenantId.value
  subscription_id = data.azurerm_key_vault_secret.hubSubscriptionId.value
  alias           = "hub"
  features {}
}

provider "azurerm" {
  version         = "~>2.0"
  tenant_id       = data.azurerm_key_vault_secret.tenantId.value
  subscription_id = data.azurerm_key_vault_secret.spokeSubscriptionId.value
  alias           = "spoke"
  features {}
}

//have to use remote state due to tf task
terraform {
  backend "azurerm" {}
}
