# #Secrets
data "azurerm_key_vault" "transitSecrets" {
  name                = var.transitKvName
  resource_group_name = var.transitKvRgName
}

data "azurerm_key_vault_secret" "transitSubscriptionId" {
  name         = "az-lz-transit-subscription-id"
  key_vault_id = data.azurerm_key_vault.transitSecrets.id
}
