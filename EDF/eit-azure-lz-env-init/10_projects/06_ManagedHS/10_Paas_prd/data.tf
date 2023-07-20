data "azurerm_key_vault" "Secrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}
data "azurerm_subnet" "pesubnet" {
  name                 = var.eitmngdpeSubnetName
  virtual_network_name = var.eitmngdVnetName
  resource_group_name  = var.eitmngdNetworkingRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}
