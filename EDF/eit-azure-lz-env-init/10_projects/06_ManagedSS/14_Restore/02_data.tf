data "azurerm_key_vault" "kvmanagedSsSecrets" {
  name                = var.managedSsKvName
  resource_group_name = var.managedSsKvRgName
}


data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "subscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "spSecret" {
  name         = "avmgenprdssmngdsub01spkey"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "spApplicationId" {
  name         = "avmgenprdssmngdsub01spid"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}


########### VM #########

data "azurerm_client_config" "current" {}

data "azurerm_subnet" "emersonSubnet" {
  name                 = var.emersonSubnetName
  virtual_network_name = var.lzmanagedSsVnetName
  resource_group_name  = var.lzmanagedSsNetworkingRgName
}

data "azurerm_key_vault_secret" "emersonams01PrivateIpAddress" {
  name         = "emersonams01RestorePrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
