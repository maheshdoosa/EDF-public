#Secrets
data "azurerm_key_vault" "cenadtSecrets" {
  name                = var.cenadtKvName
  resource_group_name = var.cenadtKvRgName
}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = var.laworkspaceResourceId
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
