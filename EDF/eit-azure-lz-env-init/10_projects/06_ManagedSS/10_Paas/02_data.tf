#Secrets
data "azurerm_key_vault" "kvmanagedSSSecrets" {
  name                = var.managedSSKvName
  resource_group_name = var.managedSSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagedSSSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "subscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagedSSSecrets.id
}

########### Backup ###########

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagedSSSecrets.id
}

# data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
#   resource_id = module.az-recoveryservicevault.recovery_services_vault.id
# }

#### SA with PE ############
data "azurerm_subnet" "managedSSpesubnet" {
  name                 = var.managedSSpesubnetName
  virtual_network_name = var.managedSSVnetName
  resource_group_name  = var.managedSSNetworkingRgName
}
data "azurerm_storage_account" "managedSSvmDiagsa" {
  name                = var.vmDiagSA
  resource_group_name = var.lzmanagedSSVmLogsRgName
}
# data "azurerm_key_vault_secret" "SScentraldnszoneid" {
#   name         = "SScentraldnszoneid"
#   key_vault_id = data.azurerm_key_vault.kvmanagedSSSecrets.id
# }

data "azurerm_key_vault_secret" "SScentralblobdnszoneid" {
  name         = "SScentralblobdnszoneid"
  key_vault_id = data.azurerm_key_vault.kvmanagedSSSecrets.id
}

data "azurerm_storage_account" "managedSSauxsa" {
  name                = var.auxSaName
  resource_group_name = var.auxRgName
}

data "azurerm_storage_account" "managedSSrestoresa" {
  name                = var.managedSSrestoresa
  resource_group_name = var.managedSSrestoresaRgName
  depends_on          = [module.managedSSrestoreStorageAccount]
}
