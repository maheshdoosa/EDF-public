# #Secrets
data "azurerm_key_vault" "kvmanagementSsSecrets" {
  name                = var.managementSsKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "pkiEaRootPrivateIpAddress" {
  name         = "pkiCaRootPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "pkiCA01PrivateIpAddress" {
  name         = "pkiCA01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "pkiCA02PrivateIpAddress" {
  name         = "pkiCA02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "webpki01PrivateIpAddress" {
  name         = "webpki01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "webpki02PrivateIpAddress" {
  name         = "webpki02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "intLbPrivateIpAddress" {
  name         = "intLbPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adopattoken" {
  name         = "adopattoken"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

# Subnets
data "azurerm_subnet" "pkiSubnet" {
  name                 = var.pkiSubnetName
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsNetworkingRgName
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

#######Wac data sources#################
data "azurerm_key_vault_secret" "wac01PrivateIpAddress" {
  name         = "wac01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "wac02PrivateIpAddress" {
  name         = "wac02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "wacLbPrivateIpAddress" {
  name         = "wacLbPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_subnet" "wacSubnet" {
  name                 = var.wacSubnetName
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsNetworkingRgName
}

###### WARP data sources#################
data "azurerm_key_vault_secret" "warpsmid01PrivateIpAddress" {
  name         = "warpsmid01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_subnet" "warpSubnet" {
  name                 = var.warpSubnetName
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsNetworkingRgName
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "kvmanagementSsKeyVault" {
  name                = var.managementSsAdeKvName
  resource_group_name = var.managementSsAdeKvRgName
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "mgmtss-SubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "scaweb01EncryptKeyURL" {
  name         = "eitukssscaweb01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "scaweb02EncryptKeyURL" {
  name         = "eitukssscaweb02-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "sica01EncryptKeyURL" {
  name         = "eituksssica01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "sica02EncryptKeyURL" {
  name         = "eituksssica02-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "srca01EncryptKeyURL" {
  name         = "eituksssrca01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "swac01EncryptKeyURL" {
  name         = "eitukssswac01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "swac02EncryptKeyURL" {
  name         = "eitukssswac02-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "smid01EncryptKeyURL" {
  name         = "eituksalzsmid01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "afs01EncryptKeyURL" {
  name         = "eituksssafs01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_subnet" "AFSSubnetName" {
  name                 = var.AFSSubnetName
  virtual_network_name = var.lzmanagementSsAFSVnetName
  resource_group_name  = var.lzmanagementSsAFSRgName
}

data "azurerm_key_vault_secret" "AFS01PrivateIpAddress" {
  name         = "AFS01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}
##################### Extensions #######################

data "azurerm_log_analytics_workspace" "laWorksapce" {
  name                = var.laWorkspacename
  resource_group_name = var.updateManagmentRgName
}

################### ADO Data Source ###################

data "azurerm_key_vault_secret" "vmssadminuser" {
  name         = "vmssadminuser"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "vmssadminPassword" {
  name         = "vmssadminpassword"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_subnet" "ssvmssadosubnet" {
  name                 = var.vmsssubnetname
  virtual_network_name = var.vmssvnetname
  resource_group_name  = var.vmssvnetrg
}

################# ADDS Resources ##################

data "azurerm_client_config" "current" {
}

data "azurerm_subnet" "dcSubnet" {
  name                 = var.lzmanagementSsdcsubnet
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsNetworkingRgName
}

data "azurerm_application_security_group" "asgdc" {
  name                = var.lzmanagementSsaddsasg
  resource_group_name = var.lzmanagementSsaddsasgrg
}


data "azurerm_key_vault_secret" "dc03PrivateIpAddress" {
  name         = "dc03PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "dc04PrivateIpAddress" {
  name         = "dc04PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "dc03EncryptKeyURL" {
  name         = "eituksalzssdc03-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "dc04EncryptKeyURL" {
  name         = "eituksalzssdc04-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "rootDcIpAddress" {
  name         = "rootDcIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "AzureDnsForwarder" {
  name         = "AzureDnsForwarder"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "new-domain-join-user" {
  name         = "new-domain-join-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "new-domain-join-pass" {
  name         = "new-domain-join-pass"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_storage_account" "scriptsstorage" {
  name                = var.scriptsstorage
  resource_group_name = var.scriptsstoragerg

}

data "azurerm_storage_account_sas" "Blobsas" {
  connection_string = data.azurerm_storage_account.scriptsstorage.primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = true
    table = true
    file  = true
  }

  start  = timestamp()
  expiry = timeadd(timestamp(), "2h")

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = true
    add     = true
    create  = true
    update  = true
    process = true
  }
}
