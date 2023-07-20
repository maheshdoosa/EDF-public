#Secrets
data "azurerm_key_vault" "EamciSecrets" {
  name                = var.eamciKvName
  resource_group_name = var.eamciKvRgName
}

data "azurerm_subnet" "pesubnet" {
  name                 = var.eamcipeSubnetName
  virtual_network_name = var.eamciVnetName
  resource_group_name  = var.eamciNetworkingRgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.EamciSecrets.id
}
data "azurerm_storage_account" "lawsa" {
  name                = var.lawsa
  resource_group_name = var.lawsaRgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.EamciSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.EamciSecrets.id
}
