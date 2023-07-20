data "azurerm_key_vault" "kvTransitSecrets" {
  name                = var.transitKvName
  resource_group_name = var.transitKvRgName
}

data "azurerm_key_vault_secret" "contributorSpName" {
  name         = "az-lz-transit-contributor-sp-name"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpSecret" {
  name         = "az-lz-transit-contributor-sp-secret"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "az-lz-transit-tenant-id"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "az-lz-transit-subscription-id"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "transitVnetAddressSpace" {
  name         = "transit-vnet-address-space"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "hsManageVnetAddressSpace" {
  name         = "hsmanage-vnet-address-space"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "t1fw-ilb-ip" {
  name         = var.t1fwIlbIp
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "t2fw-ilb-ip" {
  name         = var.t2fwIlbIp
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_subnet" "t1intfwTransitSubnetName" {
  name                 = var.t1intfwTransitSubnetName
  virtual_network_name = var.lzTransitVnetName
  resource_group_name  = var.lzTransitNetworkingRgName
}
data "azurerm_subnet" "t1extfwTransitSubnetName" {
  name                 = var.t1extfwTransitSubnetName
  virtual_network_name = var.lzTransitVnetName
  resource_group_name  = var.lzTransitNetworkingRgName
}
data "azurerm_subnet" "t1mgmtfwTransitSubnetName" {
  name                 = var.t1mgmtfwTransitSubnetName
  virtual_network_name = var.lzTransitVnetName
  resource_group_name  = var.lzTransitNetworkingRgName
}
data "azurerm_subnet" "t2intfwTransitSubnetName" {
  name                 = var.t2intfwTransitSubnetName
  virtual_network_name = var.lzTransitVnetName
  resource_group_name  = var.lzTransitNetworkingRgName
}
data "azurerm_subnet" "t2mgmtfwTransitSubnetName" {
  name                 = var.t2mgmtfwTransitSubnetName
  virtual_network_name = var.lzTransitVnetName
  resource_group_name  = var.lzTransitNetworkingRgName
}
data "azurerm_subnet" "t1fwHaSyncTransitSubnetName" {
  name                 = var.t1HaSyncfwTransitSubnetName
  virtual_network_name = var.lzTransitVnetName
  resource_group_name  = var.lzTransitNetworkingRgName
}
