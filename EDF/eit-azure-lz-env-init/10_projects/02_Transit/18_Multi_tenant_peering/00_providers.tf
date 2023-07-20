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
  alias           = "Transit"
  version         = "~>2.0.0"
  subscription_id = data.azurerm_key_vault_secret.sub_id_transit.value
  tenant_id       = data.azurerm_key_vault_secret.tenant_id_transit.value
  # client_id            = var.client_id_1
  # client_secret        = var.secret_1
  auxiliary_tenant_ids = [data.azurerm_key_vault_secret.tenant_id_remote.value]
  features {}
}

provider "azurerm" {
  alias           = "Remote"
  version         = "~>2.0.0"
  subscription_id = data.azurerm_key_vault_secret.sub_id_remote.value
  tenant_id       = data.azurerm_key_vault_secret.tenant_id_remote.value
  # client_id            = var.client_id_1
  # client_secret        = var.secret_1
  auxiliary_tenant_ids = [data.azurerm_key_vault_secret.tenant_id_transit.value]
  features {}
}


//have to use remote state due to tf task
terraform {
  backend "azurerm" {}
}
