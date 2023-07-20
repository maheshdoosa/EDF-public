#Secrets
data "azurerm_key_vault" "kvTransitSecrets" {
  name                = var.transitKvName
  resource_group_name = var.transitKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "az-lz-transit-tenant-id"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

# data "azurerm_key_vault_secret" "hubSubscriptionId" {
#   name         = "hubSubscriptionId"
#   key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
# }

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_client_config" "current" {
# }

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}


data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
