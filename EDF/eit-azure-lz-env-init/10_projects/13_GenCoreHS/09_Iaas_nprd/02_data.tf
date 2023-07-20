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
data "azurerm_key_vault" "AVDmanagedHsSecrets" {
  name                = var.AVDmanagedHsSecretsKvName
  resource_group_name = var.AVDmanagedHsSecretsKvRgName
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "AVDav01PrivateIpAddress" {
  name         = "AVDav01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "AVDav02PrivateIpAddress" {
  name         = "AVDav02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "AVDadds03PrivateIpAddress" {
  name         = "AVDadds03PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "AVDadds04PrivateIpAddress" {
  name         = "AVDadds04PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}


data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "cenadtLaworkspaceId"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "cenadtLaworkspacekey"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "avdav01EncryptKeyURL" {
  name         = "guksnpavmgmt01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "avdav02EncryptKeyURL" {
  name         = "guksnpavmgmt02-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_client_config" "current" {}

######### AVD SCCM ###############
data "azurerm_subnet" "AVDSccmSubnetName" {
  name                 = var.AVDSccmSubnetName
  virtual_network_name = var.lzAVDVnetName
  resource_group_name  = var.lzAVDVnetRgName
}

data "azurerm_key_vault_secret" "AVDSccm01PrivateIpAddress" {
  name         = "AVDSccm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "AVDSccm02PrivateIpAddress" {
  name         = "AVDSccm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "avdSccm01EncryptKeyURL" {
  name         = "guksnpsccm01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "avdSccm02EncryptKeyURL" {
  name         = "guksnpsccm02-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

####################### AVD AD ################################

data "azurerm_subnet" "AVDaddsSubnetName" {
  name                 = var.AVDaddsSubnetName
  virtual_network_name = var.lzAVDVnetName
  resource_group_name  = var.lzAVDVnetRgName
}

# data "azurerm_key_vault_secret" "AVDadds01PrivateIpAddress" {
#   name         = "AVDadds01PrivateIpAddress"
#   key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
# }
# data "azurerm_key_vault_secret" "AVDadds02PrivateIpAddress" {
#   name         = "AVDadds02PrivateIpAddress"
#   key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
# }

data "azurerm_key_vault_secret" "avdadds01EncryptKeyURL" {
  name         = "guksnpadds01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "avdadds02EncryptKeyURL" {
  name         = "guksnpadds02-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "avdadds03EncryptKeyURL" {
  name         = "guksnpadds03-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_key_vault_secret" "avdadds04EncryptKeyURL" {
  name         = "guksnpadds04-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

####################### AVD WSUS ################################

data "azurerm_subnet" "AVDwsusSubnetName" {
  name                 = var.AVDwsusSubnetName
  virtual_network_name = var.lzAVDVnetName
  resource_group_name  = var.lzAVDVnetRgName
}

data "azurerm_key_vault_secret" "AVDwsus01PrivateIpAddress" {
  name         = "AVDwsus01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

data "azurerm_key_vault_secret" "avdwsus01EncryptKeyURL" {
  name         = "guksnpwsus01-ade-url"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}

############# asg association ############
data "azurerm_application_security_group" "asgav" {
  name                = "gen-uks-np-hs-av-asg-01"
  resource_group_name = "gen-uks-np-hs-mgmt-asgs-rg-01"
}

data "azurerm_application_security_group" "asgsccm" {
  name                = "gen-uks-np-hs-sccm-asg-01"
  resource_group_name = "gen-uks-np-hs-mgmt-asgs-rg-01"
}

data "azurerm_application_security_group" "asgadds" {
  name                = "gen-uks-np-hs-adds-asg-01"
  resource_group_name = "gen-uks-np-hs-mgmt-asgs-rg-01"
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.AVDmanagedHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
