######### AVD AV ###################

data "azurerm_subnet" "AVDavSubnetName" {
  name                 = var.AVDavSubnetName
  virtual_network_name = var.lzAVDVnetName
  resource_group_name  = var.lzAVDVnetRgName
}

data "azurerm_key_vault" "avd-ade-kvt" {
  name                = var.AVDKvName
  resource_group_name = var.AVDKvRgName
}
data "azurerm_key_vault" "AVDmanagedSsSecrets" {
  name                = var.AVDmanagedSsSecretsKvName
  resource_group_name = var.AVDmanagedSsSecretsKvRgName
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}
data "azurerm_key_vault_secret" "AVDav01PrivateIpAddress" {
  name         = "AVDav01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "AVD02PrivateIpAddress" {
  name         = "AVD02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}


data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "cenadtLaworkspaceId"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "cenadtLaworkspacekey"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "avdav01EncryptKeyURL" {
  name         = "cuksprdavmgmt01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "avdav02EncryptKeyURL" {
  name         = "cuksprdavmgmt02-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}



data "azurerm_client_config" "current" {}

##############################################################################################################
######### AVD SCCM ###############
data "azurerm_subnet" "AVDSccmSubnetName" {
  name                 = var.AVDSccmSubnetName
  virtual_network_name = var.lzAVDVnetName
  resource_group_name  = var.lzAVDVnetRgName
}

data "azurerm_key_vault_secret" "AVDSccm01PrivateIpAddress" {
  name         = "AVDSccm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}
data "azurerm_key_vault_secret" "AVDSccm02PrivateIpAddress" {
  name         = "AVDSccm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "avdSccm01EncryptKeyURL" {
  name         = "cuksprdsccm01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}
data "azurerm_key_vault_secret" "avdSccm02EncryptKeyURL" {
  name         = "cuksprdsccm02-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}


####################### AVD AD ################################


data "azurerm_subnet" "AVDaddsSubnetName" {
  name                 = var.AVDaddsSubnetName
  virtual_network_name = var.lzAVDVnetName
  resource_group_name  = var.lzAVDVnetRgName
}

data "azurerm_key_vault_secret" "AVDadds01PrivateIpAddress" {
  name         = "AVDadds01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}
data "azurerm_key_vault_secret" "AVDadds02PrivateIpAddress" {
  name         = "AVDadds02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}

data "azurerm_key_vault_secret" "avdadds01EncryptKeyURL" {
  name         = "cuksprdadds01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}
data "azurerm_key_vault_secret" "avdadds02EncryptKeyURL" {
  name         = "cuksprdadds02-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedSsSecrets.id
}
