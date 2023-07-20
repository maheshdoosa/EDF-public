data "azurerm_key_vault" "Secrets" {
  name                = var.gendiamondhsKvName
  resource_group_name = var.gendiamondhsKvRgName
}
data "azurerm_subnet" "pesubnet" {
  name                 = var.genstgpeSubnetName
  virtual_network_name = var.genstgVnetName
  resource_group_name  = var.genstgdNetworkingRgName
}

data "azurerm_storage_account" "avmsa" {
  name                = var.genstgSA
  resource_group_name = var.genstgSARgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}