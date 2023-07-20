data "azurerm_key_vault" "Secrets" {
  name                = var.gendiamondhsKvName
  resource_group_name = var.gendiamondhsKvRgName
}
data "azurerm_subnet" "pesubnet" {
  name                 = var.genlwrpeSubnetName
  virtual_network_name = var.genlwrVnetName
  resource_group_name  = var.genlwrdNetworkingRgName
}

data "azurerm_storage_account" "avmsa" {
  name                = var.genlwrSA
  resource_group_name = var.genlwrSARgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}