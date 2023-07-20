data "azurerm_key_vault" "NuclearRnDHSSecrets" {
  name                = var.NuclearRnDHSKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

######## Data for Domain Join ##########
data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}
data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "new-domain-join-user"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #The keyvault secret adAdminuser should be updated as "user@ABC.COM"
}
data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "new-domain-join-pass"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}
data "azurerm_key_vault_secret" "nameserverip1" {
  name         = "nameserverip1"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #nameserverip represents the domain controller IP
}
data "azurerm_key_vault_secret" "nameserverip2" {
  name         = "nameserverip2"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #nameserverip represents the domain controller IP
}
data "azurerm_key_vault_secret" "dNSHostName1" {
  name         = "dNSHostName1"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}

data "azurerm_key_vault_secret" "dNSHostName2" {
  name         = "dNSHostName2"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}
data "azurerm_key_vault_secret" "dchostname1" {
  name         = "dchostname1"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #dchostname is (dc01)
}
data "azurerm_key_vault_secret" "dchostname2" {
  name         = "dchostname2"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
  #dchostname is (dc01)
}
data "azurerm_client_config" "current" {

}

data "azurerm_key_vault_secret" "PrivateIpAddressweb" {
  name         = "PrivateIpAddressweb"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

data "azurerm_key_vault_secret" "PrivateIpAddressapp" {
  name         = "PrivateIpAddressapp"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

data "azurerm_key_vault_secret" "ScriptsstorageAccountKey" {
  name         = "ScriptsstorageAccountKey"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

data "azurerm_subnet" "NuclearRnDHSdevSubnet" {
  name                 = var.NuclearRnDHSdevSubnetName
  virtual_network_name = var.NuclearRnDHSdevVnetName
  resource_group_name  = var.NuclearRnDHSdevNetworkingRgName
}

data "azurerm_subnet" "NuclearRnDHSdevSubnetapp" {
  name                 = var.NuclearRnDHSdevSubnetNameapp
  virtual_network_name = var.NuclearRnDHSdevVnetName
  resource_group_name  = var.NuclearRnDHSdevNetworkingRgName
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
######## golden image ########
data "azurerm_key_vault_secret" "ImageSubIds" {
  name         = "HSmgmtsubscriptionId"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}
######### Disk Encryption #######
data "azurerm_key_vault" "SsAdeKeyVault" {
  name                = var.NuclearSsAdeKvName
  resource_group_name = var.NuclearSsAdeKvRgName
}
data "azurerm_key_vault_secret" "Nuclearvm01EncryptKeyURL" {
  name         = "gukststhshdw01-ade-url"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}
data "azurerm_key_vault_secret" "Nuclearvm02EncryptKeyURL" {
  name         = "gukststhshdw01-ade-url"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}

###### Data Disks ##########
data "azurerm_managed_disk" "Nuclearpecvm01_data_disk" {
  name                = var.Nuclearpecvm01_data_disk
  resource_group_name = var.NuclearRnDHSdevvmRgName
  depends_on          = [module.createdisksForNuclearvm01] // need to comment
}
data "azurerm_managed_disk" "Nuclearpecvm02_data_disk" {
  name                = var.Nuclearpecvm02_data_disk
  resource_group_name = var.NuclearRnDHSdevvmappRgName
  depends_on          = [module.createdisksForNuclearvm02] // need to comment
}

data "azurerm_virtual_machine" "Nuclearpec_vm01" {
  name                = var.NuclearRnDHSdevvm01Name
  resource_group_name = var.NuclearRnDHSdevvmRgName
  depends_on          = [module.createNuclearRnDHSdevvm01] // need to comment
}

data "azurerm_virtual_machine" "Nuclearpec_vm02" {
  name                = var.NuclearRnDHSdevvm02Name
  resource_group_name = var.NuclearRnDHSdevvmappRgName
  depends_on          = [module.createNuclearRnDHSdevvm02] // need to comment
}

# ################## data source the NIC id #################################

data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}

data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.NuclearRnDHSSecrets.id
}
