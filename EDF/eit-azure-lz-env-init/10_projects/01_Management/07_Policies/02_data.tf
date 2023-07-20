# #Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = var.managementHsKvRgName
}

data "azurerm_key_vault_secret" "platformManagementGroupId" {
  name         = "platformManagementGroupId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "managementHsSubscriptionId" {
  name         = "hsManagementSubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "alz-sentinel-seclogs-winevent" {
  name         = "ALZ-SENTINEL-SECLOGS-WINEVENT"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}


data "azurerm_key_vault_secret" "alz-sentinel-seclogs-linuxevent" {
  name         = "ALZ-SENTINEL-SECLOGS-LINUXEVENT"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
