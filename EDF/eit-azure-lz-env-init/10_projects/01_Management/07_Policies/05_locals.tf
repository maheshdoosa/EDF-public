locals {
  platformManagementGroupId  = data.azurerm_key_vault_secret.platformManagementGroupId.value
  managementHsSubscriptionId = data.azurerm_key_vault_secret.managementHsSubscriptionId.value
}
