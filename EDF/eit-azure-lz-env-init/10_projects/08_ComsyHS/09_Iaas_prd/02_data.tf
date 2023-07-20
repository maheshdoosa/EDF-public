data "azurerm_client_config" "current" {
}
data "azurerm_key_vault" "ComsyHSSecrets" {
  name                = var.ComsyHSKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault" "ComsyHSprdkv" {
  name                = var.ComsyHSprdkv
  resource_group_name = var.ComsyHSprdkvrg
}


data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

######## Data for Domain Join##########

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
  #The keyvault secret adAdminuser should be updated as "user@ABC.COM"
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

data "azurerm_key_vault_secret" "ComsyHSPrdVM01PrivateIpAddress" {
  name         = "ComsyHSPrdVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

data "azurerm_key_vault_secret" "ScriptsstorageAccountKey" {
  name         = "ScriptsstorageAccountKey"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}

data "azurerm_subnet" "ComsyHSPrdVmSubnet" {
  name                 = var.ComsyHSprdSubnetName
  virtual_network_name = var.ComsyHSprdVnetName
  resource_group_name  = var.ComsyHSprdNetworkingRgName
}
#Storage for boot Diagnostic
data "azurerm_storage_account" "ComsyHSprdbootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}


data "azurerm_key_vault_secret" "ComsyHSPrdVM01EncryptKeyURL" { #needs to be checked
  name         = "gukshsprdcmsl01-ade-url"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.ComsyHSSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
