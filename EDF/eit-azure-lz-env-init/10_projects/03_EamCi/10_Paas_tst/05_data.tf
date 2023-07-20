#Secrets
data "azurerm_key_vault" "EamtstciSecrets" {
  name                = var.eamtstciKvName
  resource_group_name = var.eamciKvRgName
}

data "azurerm_subnet" "pesubnet" {
  name                 = var.eamtstcipeSubnetName
  virtual_network_name = var.eamtstciVnetName
  resource_group_name  = var.eamtstciNetworkingRgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.EamtstciSecrets.id
}
data "azurerm_storage_account" "lawsa" {
  name                = var.lawsa
  resource_group_name = var.lawsaRgName
}
data "azurerm_storage_account" "jboxsa" {
  name                = var.jboxsa
  resource_group_name = var.jboxsaRgName
}
data "azurerm_storage_account" "devwssa" {
  name                = var.devwssa
  resource_group_name = var.devwssaRgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.EamtstciSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.EamtstciSecrets.id
}
