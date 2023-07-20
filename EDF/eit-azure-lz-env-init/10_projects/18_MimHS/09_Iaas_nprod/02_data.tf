data "azurerm_key_vault" "MIMHsSecrets" {
  name                = var.eitmngdHssecretsKvName
  resource_group_name = ".security"
}

data "azurerm_subnet" "MIMHsdbSubnet" {
  name                 = var.MIMDBSubnetName
  virtual_network_name = var.eitmngdHsVnetName
  resource_group_name  = var.eitmngdHsNetworkingRgName
}

data "azurerm_subnet" "MIMHsappSubnet" {
  name                 = var.MIMAPPSubnetName
  virtual_network_name = var.eitmngdHsVnetName
  resource_group_name  = var.eitmngdHsNetworkingRgName
}

data "azurerm_key_vault_secret" "mimhsnpdbvm01PrivateIpAddress" {
  name         = "mimhsnpdbvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

data "azurerm_key_vault_secret" "mimhsnpappvm01PrivateIpAddress" {
  name         = "mimhsnpappvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

data "azurerm_key_vault_secret" "mimhsnpappvm02PrivateIpAddress" {
  name         = "mimhsnpappvm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

######## golden image ########
data "azurerm_key_vault_secret" "ImageSubIds" {
  name         = "hsmgmtsubscriptionId"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}
###########
data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}
data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}
#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorageAccountName" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

######## Data for Domain Join ##########
data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}
data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
  #The keyvault secret adAdminuser should be updated as "user@ABC.COM"
}
data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

data "azurerm_client_config" "current" {

}
data "azurerm_key_vault_secret" "ScriptsstorageAccountKey" {
  name         = "ScriptsstorageAccountKey"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

######### Disk Encryption #######
data "azurerm_key_vault" "eitHsmngdAdeKeyVault" {
  name                = var.eitHsmngdAdeKvName
  resource_group_name = var.eitHsmngdAdeKvRgName
}
data "azurerm_key_vault_secret" "mimdbmvm01EncryptKeyURL" {
  name         = "mimdbmvm01EncryptKeyURL"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

data "azurerm_key_vault_secret" "mimappmvm01EncryptKeyURL" {
  name         = "mimappmvm01EncryptKeyURL"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}

data "azurerm_key_vault_secret" "mimappmvm02EncryptKeyURL" {
  name         = "mimappmvm02EncryptKeyURL"
  key_vault_id = data.azurerm_key_vault.MIMHsSecrets.id
}
