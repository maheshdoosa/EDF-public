data "azurerm_key_vault" "Secrets" {
  name                = var.gendiamondhsKvName
  resource_group_name = var.gendiamondhsKvRgName
}
data "azurerm_subnet" "pesubnet" {
  name                 = var.genuprpeSubnetName
  virtual_network_name = var.genuprVnetName
  resource_group_name  = var.genuprdNetworkingRgName
}

data "azurerm_storage_account" "avmsa" {
  name                = var.genuprSA
  resource_group_name = var.genuprSARgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}