data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "MDWHSSecrets" {
  name                = var.prjKvName
  resource_group_name = var.prjKvRgName
}

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
# }

# data "azurerm_key_vault_secret" "subscriptionId" {
#   name         = "subscriptionId"
#   key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
# }

# data "azurerm_key_vault_secret" "ADOVnetId" {
#   name         = "ADOVnetId"
#   key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
# }


data "azurerm_subnet" "MDWHsTstsubnet" {
  name                 = var.MDWHsTstSubnetName
  virtual_network_name = var.MDWHsTstVnetName
  resource_group_name  = var.MDWHsTstNetworkingRgName
}

data "azurerm_virtual_network" "MDWHsTstVnet" {
  name                = var.MDWHsTstVnetName
  resource_group_name = var.MDWHsTstNetworkingRgName
}

data "azurerm_key_vault" "MDWHsTstkeyvault" {
  name                = var.MDWHsTstkvName
  resource_group_name = var.MDWHsTstkvRgName
  # depends_on          = [module.create-keyvault-MDWHs-Tst]
}


data "azurerm_private_dns_zone" "MDWHsDnszone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.MDWHsPrivateDNSRgName
  # depends_on          = [module.azure-private-dns-zone-MDWHs]
}

### will be enabled post pep subnet added

/*  data "azurerm_subnet" "pepsubnet" {
  name                 = var.datapeSubnetName
  virtual_network_name = var.datapeVnetName
  resource_group_name  = var.datapepNetworkingRgName
}
data "azurerm_storage_account" "vmDiagsa" {
  name                = var.vmDiagTstSA
  resource_group_name = var.MDWHsTstVmLogsRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_storage_account" "auxsa" {
  name                = var.auxScriptsSA
  resource_group_name = var.MDWHsTstAuxRgName
}
*/
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_storage_account" "vmDiagTstSA" {
  name                = var.vmDiagTstSA
  resource_group_name = var.MDWHsTstVmLogsRgName
}
data "azurerm_storage_account" "auxScriptsSA" {
  name                = var.auxScriptsSA
  resource_group_name = var.MDWHsTstAuxRgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_subnet" "pesubnet" {
  name                 = var.datadevpeSubnetName
  virtual_network_name = var.datadevVnetName
  resource_group_name  = var.datadevNetworkingRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
