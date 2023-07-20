
#vault
data "azurerm_key_vault" "kvmanagedSsSecrets" {
  name                = var.managedSsKvName
  resource_group_name = var.managementSsKvRgName #".security"
}

# Secrets

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sssecgov-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}




####### Secgov data sources #################
data "azurerm_subnet" "SecgovSubnet" {
  name                 = var.SecgovSubnetName
  virtual_network_name = var.lzmanagedSsVnetName
  resource_group_name  = var.lzmanagedSsNetworkingRgName
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "kvmanagedSsKeyVault" {
  name                = var.managedSsAdeKvName
  resource_group_name = var.managedSsAdeKvRgName
}

data "azurerm_key_vault_secret" "ssecgov01EncryptKeyURL" { #needs to be checked
  name         = "ssecgov01-ade-url"                       #"genuksprdams01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "ssecgov02EncryptKeyURL" { #needs to be checked
  name         = "ssecgov02-ade-url"                       #"genuksprdams01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "sssecgov01PrivateIpAddress" { #needs to be checked
  name         = "sssecgov01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "sssecgov02PrivateIpAddress" { #needs to be checked
  name         = "sssecgov02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_client_config" "current" {

}

data "azurerm_storage_account" "bootDiagLogtenableStorageAccountName" {

  name                = var.bootDiagLogtenableStorageAccountName
  resource_group_name = var.bootDiagLogtenableStorageAccountRgName
}

data "azurerm_subnet" "tenableSubnetName" {
  name                 = var.tenableSubnetName
  virtual_network_name = var.lzmanagedSsVnetName
  resource_group_name  = var.lzmanagedSsNetworkingRgName
}

data "azurerm_key_vault_secret" "sssecgov03PrivateIpAddress" { #needs to be checked
  name         = "sssecgov03PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_managed_disk" "Tenable_data_disk-01" {
  name                = var.Tenable_data_disk
  resource_group_name = var.lzmanagedSssecgovtenableRgName
  #depends_on = [module.createdisksForTenable]
}

data "azurerm_virtual_machine" "tenable_vm" {
  name                = var.tenablevmname
  resource_group_name = var.lzmanagedSssecgovtenableRgName
  #depends_on = [module.createSecgovams03Vm]
}
