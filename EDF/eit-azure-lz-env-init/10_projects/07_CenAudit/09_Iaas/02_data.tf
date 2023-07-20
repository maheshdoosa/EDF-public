data "azurerm_key_vault" "cenadtHsSecrets" {
  name                = var.cenadtKvName
  resource_group_name = var.cenadtKvRgName #".security"
}
data "azurerm_subnet" "cenadtSubnetName" {
  name                 = var.cenadtSubnetName
  virtual_network_name = var.cenadtVnetName
  resource_group_name  = var.cenadtNetworkingRgName
}
data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_key_vault_secret" "ImageSubId" {
  name         = "ImageSubIds"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_storage_account" "bootDiagLogStorageAccountName" {
  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
##################### Extensions LAW #######################
data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_key_vault_secret" "cenadtvm01PrivateIpAddress" { #needs to be checked
  name         = "cenadtvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_key_vault_secret" "cenadtvm02PrivateIpAddress" { #needs to be checked
  name         = "cenadtvm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
####### Data Disks ##########
# data "azurerm_managed_disk" "cenadvm01_data_disk" {
#   name                = var.cenadvm01_data_disk
#   resource_group_name = var.lzcenadtRgName
#   # depends_on = [
#   #    module.createdisksForcenadtvm01
#   #  ]
# }
data "azurerm_managed_disk" "cenadvm02_data_disk" {
  name                = var.cenadvm02_data_disk
  resource_group_name = var.lzcenadtRgName
  #  depends_on = [
  #   module.createdisksForcenadtvm02
  # ]
}
# data "azurerm_virtual_machine" "cenadt_vm01" {
#   name                = var.cenadtvm01name
#   resource_group_name = var.lzcenadtRgName
#     #  depends_on = [
#     #   module.createCenadtVm01
#     # ]
# }
data "azurerm_virtual_machine" "cenadt_vm02" {
  name                = var.cenadtvm02name
  resource_group_name = var.lzcenadtRgName
  #   depends_on = [
  #    module.createCenadtVm002
  #  ]
}
data "azurerm_client_config" "current" {
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "kvadeHsKeyVault" {
  name                = var.HsAdeKvName
  resource_group_name = var.HsAdeKvRgName
}

data "azurerm_key_vault_secret" "cenadvm01EncryptKeyURL" {
  name         = "eitukshscef01-ade-01-url"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

data "azurerm_key_vault_secret" "cenadvm02EncryptKeyURL" {
  name         = "eitukshscef02-ade-01-url"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

######## Data for Domain Join##########

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #The keyvault secret adAdminuser should be updated as "user@ABC.COM"
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

data "azurerm_key_vault_secret" "nameserverip1" {
  name         = "nameserverip"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #nameserverip represents the domain controller IP
}
data "azurerm_key_vault_secret" "nameserverip2" {
  name         = "nameserverip2"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #nameserverip represents the domain controller IP
}

data "azurerm_key_vault_secret" "dNSHostName1" {
  name         = "dcinfoName1"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}

data "azurerm_key_vault_secret" "dNSHostName2" {
  name         = "dcinfoName2"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}
data "azurerm_key_vault_secret" "dchostname1" {
  name         = "dchostname"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #dchostname is (dc01)
}

data "azurerm_key_vault_secret" "dchostname2" {
  name         = "dchostname2"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
  #dchostname is (dc02)
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "storageAccountKey"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

################# Event Collector ##############

data "azurerm_subnet" "cenadtpecSubnetName" {
  name                 = var.cenadtpecSubnetName
  virtual_network_name = var.cenadtVnetName
  resource_group_name  = var.cenadtNetworkingRgName
}

data "azurerm_key_vault_secret" "cenadtecvm01PrivateIpAddress" {
  name         = "cenadtecvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_key_vault_secret" "cenadtecvm02PrivateIpAddress" {
  name         = "cenadtecvm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

data "azurerm_key_vault_secret" "cenadedvm01EncryptKeyURL" {
  name         = "eitukshspslc01-ade-01-url"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

data "azurerm_key_vault_secret" "cenadecvm02EncryptKeyURL" {
  name         = "eitukshspwec01-ade-01-url"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}

####### Data Disks ##########
data "azurerm_managed_disk" "cenadpecvm01_data_disk" {
  name                = var.cenadpecvm01_data_disk
  resource_group_name = var.lzcenadtpecRgName
  #depends_on 			= [module.createdisksForcenadpectvm01]
}

data "azurerm_virtual_machine" "cenadtpec_vm01" {
  name                = var.cenadtpecvm01name
  resource_group_name = var.lzcenadtpecRgName
  #depends_on      = [module.createCenadtpecVm01]
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.cenadtHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
