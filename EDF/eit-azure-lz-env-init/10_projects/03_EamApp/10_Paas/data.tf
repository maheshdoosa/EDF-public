# Secrets
data "azurerm_key_vault" "kvEamAppSecrets" {
  name                = var.eamAppKvName
  resource_group_name = var.eamAppKvRgName
}
############# Storage diag settings ######
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_subnet" "pesubnet" {
  name                 = var.eamapppeSubnetName
  virtual_network_name = var.eamappVnetName
  resource_group_name  = var.eamappNetworkingRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}
