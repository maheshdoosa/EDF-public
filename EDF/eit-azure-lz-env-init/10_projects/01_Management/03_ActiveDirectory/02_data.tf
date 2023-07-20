# #Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = var.managementHsKvRgName
}

data "azurerm_subnet" "adSubnet" {
  name                 = var.addsSubnetName
  virtual_network_name = var.lzmanagementHsVnetName
  resource_group_name  = var.lzmanagementHsNetworkingRgName

}

data "azurerm_key_vault_secret" "ADadminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "ADadminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "rootDc1IpAddress" {
  name         = "lz-ad-dc-ip1"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "rootDc2IpAddress" {
  name         = "lz-ad-dc-ip2"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "hsManagementSubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "spSecret" {
  name         = "hsmgmtContributorSPSecret"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "spApplicationId" {
  name         = "hsmgmtContributorSPAppId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_storage_account" "storage" {
  name                = var.storageAccountName
  resource_group_name = var.managementHsSaRgName

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
