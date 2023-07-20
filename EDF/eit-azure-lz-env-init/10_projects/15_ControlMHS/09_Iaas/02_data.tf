data "azurerm_key_vault" "controlMHsSecrets" {
  name                = var.controlMHsKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

######## Data for Domain Join ##########
data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username-linux"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #The keyvault secret adAdminuser should be updated as "user@ABC.COM"
}
data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
data "azurerm_key_vault_secret" "nameserverip1" {
  name         = "nameserverip1"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #nameserverip represents the domain controller IP
}
data "azurerm_key_vault_secret" "nameserverip2" {
  name         = "nameserverip2"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #nameserverip represents the domain controller IP
}
data "azurerm_key_vault_secret" "dNSHostName1" {
  name         = "dNSHostName1"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}

data "azurerm_key_vault_secret" "dNSHostName2" {
  name         = "dNSHostName2"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}
data "azurerm_key_vault_secret" "dchostname1" {
  name         = "dchostname1"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #dchostname is (dc01)
}
data "azurerm_key_vault_secret" "dchostname2" {
  name         = "dchostname2"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
  #dchostname is (dc01)
}
data "azurerm_client_config" "current" {

}

data "azurerm_key_vault_secret" "ControlMHsprdvm01PrivateIpAddress" {
  name         = "ControlMHsprdvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

data "azurerm_key_vault_secret" "ControlMHsprdvm02PrivateIpAddress" {
  name         = "ControlMHsprdvm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

data "azurerm_key_vault_secret" "ScriptsstorageAccountKey" {
  name         = "ScriptsstorageAccountKey"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

data "azurerm_subnet" "ControlMHsprdSubnet" {
  name                 = var.ControlMHsprdSubnetName
  virtual_network_name = var.ControlMHsprdVnetName
  resource_group_name  = var.ControlMHsprdNetworkingRgName
}
#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
######## golden image ########
data "azurerm_key_vault_secret" "ImageSubIds" {
  name         = "hsmgmtsubscriptionId"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
######### Disk Encryption #######
data "azurerm_key_vault" "HsAdeKeyVault" {
  name                = var.ctrlmHsAdeKvName
  resource_group_name = var.ctrlmHsAdeKvRgName
}
data "azurerm_key_vault_secret" "ctrlmvm01EncryptKeyURL" {
  name         = "eitukhsprdctrlagt01-ade-url"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
data "azurerm_key_vault_secret" "ctrlmvm02EncryptKeyURL" {
  name         = "eitukhsprdctrlagt02-ade-url"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}

###### Data Disks ##########
data "azurerm_managed_disk" "ctrlmpecvm01_data_disk" {
  name                = var.ctrlmpecvm01_data_disk
  resource_group_name = var.ControlMHsprdvmRgName
  #  depends_on 			= [module.createdisksForctrlmvm01] // need to comment
}
data "azurerm_managed_disk" "ctrlmpecvm02_data_disk" {
  name                = var.ctrlmpecvm02_data_disk
  resource_group_name = var.ControlMHsprdvmRgName
  # depends_on 			= [module.createdisksForctrlmvm01] // need to comment
}

data "azurerm_virtual_machine" "ctrlmpec_vm01" {
  name                = var.ControlMHsprdvm01Name
  resource_group_name = var.ControlMHsprdvmRgName
  #  depends_on      = [module.createControlMHsprdvm01]  // need to comment
}
data "azurerm_virtual_machine" "ctrlmpec_vm02" {
  name                = var.ControlMHsprdvm02Name
  resource_group_name = var.ControlMHsprdvmRgName
  #  depends_on      = [module.createControlMHsprdvm02]  // need to comment
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}


############## Testing ####################
data "azurerm_key_vault_secret" "ControlMHsprdTestVMPrivateIpAddress" {
  name         = "ControlMHsprdTestVMPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
data "azurerm_key_vault_secret" "ctrlmTestVMEncryptKeyURL" {
  name         = "eitukhssanctest-ade-url"
  key_vault_id = data.azurerm_key_vault.controlMHsSecrets.id
}
