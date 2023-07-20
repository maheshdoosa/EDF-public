# #Secrets
data "azurerm_key_vault" "kvDataSecrets" {
  name                = var.prjKvName
  resource_group_name = var.prjKvRgName
}

data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvDataSecrets.id
}

data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvDataSecrets.id
}

data "azurerm_virtual_network" "datastrgyprdhs_vnet01" {
  name                = var.diag_vnet_name01
  resource_group_name = var.diag_vnet_rg01
}

data "azurerm_virtual_network" "datastrgyprdhs_vnet02" {
  name                = var.diag_vnet_name02
  resource_group_name = var.diag_vnet_rg02
}
