
#vault
data "azurerm_key_vault" "kvmanagedHsSecrets" {
  name                = var.managedHsKvName
  resource_group_name = var.managementHsKvRgName #".security"
}

# Secrets

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-hssecgov-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

####### Secgov data sources #################
data "azurerm_subnet" "SecgovSubnet" {
  name                 = var.SecgovSubnetName
  virtual_network_name = var.lzmanagedHsVnetName
  resource_group_name  = var.lzmanagedHsNetworkingRgName
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "kvmanagedHsKeyVault" {
  name                = var.managedHsAdeKvName
  resource_group_name = var.managedHsAdeKvRgName
}

data "azurerm_key_vault_secret" "hsecgov01EncryptKeyURL" { #needs to be checked
  name         = "hssecgov01-ade-url"                      #"genuksprdams01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "hsecgov02EncryptKeyURL" { #needs to be checked
  name         = "hssecgov02-ade-url"                      #"genuksprdams01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "hssecgov01PrivateIpAddress" { #needs to be checked
  name         = "hssecgov01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "hssecgov02PrivateIpAddress" { #needs to be checked
  name         = "hssecgov02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_client_config" "current" {

}


data "azurerm_storage_account" "bootDiagLogtenableStorageAccountName" {

  name                = var.bootDiagLogtenableStorageAccountName
  resource_group_name = var.bootDiagLogtenableStorageAccountRgName
}

data "azurerm_subnet" "tenableSubnetName" {
  name                 = var.tenableSubnetName
  virtual_network_name = var.lzmanagedHsVnetName
  resource_group_name  = var.lzmanagedHsNetworkingRgName
}

data "azurerm_key_vault_secret" "sssecgov03PrivateIpAddress" { #needs to be checked
  name         = "sssecgov03PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}

data "azurerm_managed_disk" "Tenable_data_disk-01" {
  name                = var.Tenable_data_disk
  resource_group_name = var.lzmanagedHssecgovtenableRgName
  #depends_on          = [module.createdisksForTenable]
}

data "azurerm_virtual_machine" "tenable_vm" {
  name                = var.tenablevmname
  resource_group_name = var.lzmanagedHssecgovtenableRgName
  #depends_on          = [module.createSecgovams03Vm]
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvmanagedHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
