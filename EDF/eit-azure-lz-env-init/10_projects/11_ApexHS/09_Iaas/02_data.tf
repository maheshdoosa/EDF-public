# Generic Secrets for both Dev and Tst

data "azurerm_key_vault" "apexHsSecrets" {
  name                = var.apexHsKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

######## Data for Domain Join##########

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
  #The keyvault secret adAdminuser should be updated as "user@ABC.COM"
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "nameserverip" {
  name         = "nameserverip"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
  #nameserverip represents the domain controller IP
}

data "azurerm_key_vault_secret" "dNSHostName" {
  name         = "dNSHostName"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}

data "azurerm_key_vault_secret" "dchostname" {
  name         = "dchostname"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
  #dchostname is (dc01)
}
data "azurerm_client_config" "current" {

}

#################################Apex Dev values############################################################
data "azurerm_key_vault_secret" "apexVm0101PrivateIpAddress" {
  name         = "apexVm0101PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "apexVm02PrivateIpAddress" {
  name         = "apexVm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "storageAccountKey"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_subnet" "apexSubnet" {
  name                 = var.apexSubnetName
  virtual_network_name = var.apexHsVnetName
  resource_group_name  = var.apexHsNetworkingRgName
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "kvapexHsKeyVault" {
  name                = var.apexHsAdeKvName
  resource_group_name = var.apexHsAdeKvRgName
}

################### Tst Azure Disk Encryption ###################

data "azurerm_key_vault" "kvapexHsTstKeyVault" {
  name                = var.apexHsAdeTstKvName
  resource_group_name = var.apexHsAdeTstKvRgName
}

data "azurerm_key_vault_secret" "prdams01EncryptKeyURL" {
  name         = "gukshsdevapex01-ade-url"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "prdams02EncryptKeyURL" {
  name         = "gukshsdevapex02-ade-url"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

#Managed disk for VM

data "azurerm_managed_disk" "mdiskdev01" {
  name                = var.vmstorageDiskNameDev01
  resource_group_name = var.apexHsRgName
  #depends_on = [azurerm_managed_disk.mddev]
}
data "azurerm_managed_disk" "mdiskdev02" {
  name                = var.vmstorageDiskNameDev02
  resource_group_name = var.apexHsRgName
  #depends_on = [azurerm_managed_disk.mddev]
}

##########################Apex Tst Values###############################
data "azurerm_key_vault_secret" "apexTstVm01PrivateIpAddress" {
  name         = "apexTstVm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "apexTstVm02PrivateIpAddress" {
  name         = "apexTstVm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKeytst" {
  name         = "storageAccountKeytst"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}


data "azurerm_subnet" "apexTstSubnet" {
  name                 = var.apexTstSubnetName
  virtual_network_name = var.apexHsTstVnetName
  resource_group_name  = var.apexHsTstNetworkingRgName
}

data "azurerm_key_vault_secret" "prdams03EncryptKeyURL" {
  name         = "gukshststapex01-ade-url"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "prdams04EncryptKeyURL" {
  name         = "gukshststapex02-ade-url"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStoragetst" {

  name                = var.bootDiagLogStorageAccountNametst
  resource_group_name = var.bootDiagLogStorageAccountRgNametst
}

#Managed disk for Tst VM

data "azurerm_managed_disk" "mdisktst01" {
  name                = var.vmstorageDiskNameTst01
  resource_group_name = var.apexHsRgName_tst
  #depends_on = [azurerm_managed_disk.mdtst]
}
data "azurerm_managed_disk" "mdisktst02" {
  name                = var.vmstorageDiskNameTst02
  resource_group_name = var.apexHsRgName_tst
  #depends_on = [azurerm_managed_disk.mdtst]
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
