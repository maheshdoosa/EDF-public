#Secrets
data "azurerm_key_vault" "hssecgovSecrets" {
  name                = var.hssecgovKvName
  resource_group_name = var.hssecgovKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.hssecgovSecrets.id
}

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.hssecgovSecrets.id
# }

# data "azurerm_client_config" "current" {
# }

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.hssecgovSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.hssecgovSecrets.id
}
