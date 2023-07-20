data "azurerm_key_vault" "kvSSecrets" {
  name                = var.SSKvName
  resource_group_name = var.KvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvSSecrets.id
}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvSSecrets.id
}
