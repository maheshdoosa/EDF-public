#Secrets
data "azurerm_key_vault" "Secrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.Secrets.id
# }

# data "azurerm_client_config" "current" {
# }

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}
