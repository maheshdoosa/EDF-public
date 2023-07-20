# Secrets
data "azurerm_key_vault_secret" "emersonams01PrivateIpAddress" {
  name         = "emersonams01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}
data "azurerm_key_vault" "kvmanagedSsSecrets" {
  name                = var.managedSsKvName
  resource_group_name = ".security"
}

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

data "azurerm_key_vault_secret" "newadAdminUser" {
  name         = "new-domain-join-user"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "newadAdminPassword" {
  name         = "new-domain-join-pass"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}


data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

####### EMERSON data sources #################
data "azurerm_subnet" "emersonSubnet" {
  name                 = var.emersonSubnetName
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

data "azurerm_key_vault_secret" "prdams01EncryptKeyURL" {
  name         = "genuksprdams01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

############ EPONA ###############

data "azurerm_client_config" "current" {
}

data "azurerm_key_vault_secret" "EponaVM01PrivateIpAddress" {
  name         = "EponaVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}


data "azurerm_subnet" "EponaSubnet" {
  name                 = var.EponaSubnetName
  virtual_network_name = var.lzmanagedSsVnetName
  resource_group_name  = var.lzmanagedSsNetworkingRgName
}

data "azurerm_key_vault_secret" "EponaVM01EncryptKeyURL" {
  name         = "gukseponavm01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}

############ Cominod ###############

data "azurerm_key_vault_secret" "CominodVM01PrivateIpAddress" {
  name         = "CominodVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}


data "azurerm_subnet" "CominodSubnet" {
  name                 = var.CominodSubnetName
  virtual_network_name = var.lzmanagedSsVnetName
  resource_group_name  = var.lzmanagedSsNetworkingRgName
}

data "azurerm_key_vault_secret" "CominodVM01EncryptKeyURL" {
  name         = "gukscominodvm01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagedSsSecrets.id
}
