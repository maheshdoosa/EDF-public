######### AVD AV ###################

data "azurerm_subnet" "dtgwSubnetName" {
  name                 = var.dtgwSubnetName
  virtual_network_name = var.dtgwvnetName
  resource_group_name  = var.dtgwVnetRgName
}

data "azurerm_key_vault" "avd-ade-kvt" {
  name                = var.ADEKvName
  resource_group_name = var.ADEKvRgName
}

data "azurerm_key_vault" "managedHsSecrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}
data "azurerm_key_vault_secret" "dtgwvm01PrivateIpAddress" {
  name         = "dtgwvm01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_secret" "dtgwvm02PrivateIpAddress" {
  name         = "dtgwvm02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}


data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_key" "gukshsdevdtgw01-ade-url" {
  name         = "gukshsdevdtgw01-ade-url"
  key_vault_id = data.azurerm_key_vault.avd-ade-kvt.id
}

data "azurerm_key_vault_key" "gukshsdevdtgw02-ade-url" {
  name         = "gukshsdevdtgw02-ade-url"
  key_vault_id = data.azurerm_key_vault.avd-ade-kvt.id
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.managedHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
