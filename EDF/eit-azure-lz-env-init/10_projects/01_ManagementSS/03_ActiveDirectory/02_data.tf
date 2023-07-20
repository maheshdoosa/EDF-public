# #Secrets
data "azurerm_key_vault" "kvmanagementSsSecrets" {
  name                = var.managementSsKvName
  resource_group_name = var.managementSsKvRgName
}

data "azurerm_subnet" "adSubnet" {
  name                 = var.addsSubnetName
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsNetworkingRgName
}

data "azurerm_key_vault_secret" "ADadminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "ADadminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "rootDc1IpAddress" {
  name         = "lz-ad-dc-ip1"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "rootDc2IpAddress" {
  name         = "lz-ad-dc-ip2"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_storage_account" "storage" {
  name                = var.storageAccountName
  resource_group_name = var.managementSsSaRgName
}
data "azurerm_storage_account_sas" "Blobsas" {
  connection_string = data.azurerm_storage_account.storage.primary_connection_string
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

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {
  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
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

data "azurerm_key_vault_secret" "ssdc01EncryptKeyURL" {
  name         = "eituksalzssdc01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "ssdc02EncryptKeyURL" {
  name         = "eituksalzssdc02-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

##################### Extensions #######################

data "azurerm_log_analytics_workspace" "laWorksapce" {
  name                = var.laWorkspacename
  resource_group_name = var.updateManagmentRgName
}
