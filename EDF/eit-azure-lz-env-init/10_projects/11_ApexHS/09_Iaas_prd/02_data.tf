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

data "azurerm_key_vault_secret" "ApexHsprdvm01PrivateIpAddress" {
  name         = "ApexHsprdvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "ApexHsprdvm02PrivateIpAddress" {
  name         = "ApexHsprdvm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "ScriptsstorageAccountKey" {
  name         = "ScriptsstorageAccountKey"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_subnet" "ApexHsprdSubnet" {
  name                 = var.ApexHsprdSubnetName
  virtual_network_name = var.ApexHsprdVnetName
  resource_group_name  = var.ApexHsprdNetworkingRgName
}
#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

#Managed disk for VM

data "azurerm_managed_disk" "ApexHsprdmanageddiskvm01" {
  name                = var.ApexHsprdmanageddiskvm01
  resource_group_name = var.ApexHsprdvmRgName
  #depends_on = [azurerm_managed_disk.ApexHsmanaged]
}

data "azurerm_managed_disk" "ApexHsprdmanageddiskvm02" {
  name                = var.ApexHsprdmanageddiskvm02
  resource_group_name = var.ApexHsprdvmRgName
  #depends_on = [azurerm_managed_disk.ApexHsmanaged]
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
########################################## Apex UAT ##########################################

data "azurerm_key_vault_secret" "ApexHsuatvm01PrivateIpAddress" {
  name         = "uatHSPrdVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_key_vault_secret" "ApexHsuatvm02PrivateIpAddress" {
  name         = "uatHSPrdVM02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}

data "azurerm_subnet" "ApexHsuatSubnetName" {
  name                 = var.ApexHsuatSubnetName
  virtual_network_name = var.ApexHsprdVnetName
  resource_group_name  = var.ApexHsprdNetworkingRgName
}

data "azurerm_key_vault_secret" "gukshsuatapex01osdiskid" {
  name         = "gukshsuatapex01osdiskid"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}
data "azurerm_key_vault_secret" "gukshsuatapex01datadiskid" {
  name         = "gukshsuatapex01datadiskid"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}
data "azurerm_key_vault_secret" "gukshsuatapex02osdiskid" {
  name         = "gukshsuatapex02osdiskid"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}
data "azurerm_key_vault_secret" "gukshsuatapex02datadiskid" {
  name         = "gukshsuatapex02datadiskid"
  key_vault_id = data.azurerm_key_vault.apexHsSecrets.id
}
