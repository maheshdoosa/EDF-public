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

data "azurerm_virtual_network" "MDWHsPrdVnet" {
  name                = var.MDWHsPrdVnetName
  resource_group_name = var.MDWHsPrdNetworkingRgName
}


data "azurerm_subnet" "MDWHsPrdsubnet" {
  name                 = var.MDWHsPrdSubnetName
  virtual_network_name = var.MDWHsPrdVnetName
  resource_group_name  = var.MDWHsPrdNetworkingRgName
}

data "azurerm_subnet" "MDWHsUatsubnet" {
  name                 = var.MDWHsUatSubnetName
  virtual_network_name = var.MDWHsUatVnetName
  resource_group_name  = var.MDWHsUatNetworkingRgName
}


data "azurerm_key_vault" "MDWHsPrdkeyvault" {
  name                = var.MDWHsPrdkvName
  resource_group_name = var.MDWHsPrdkvRgName
  # depends_on          = [module.create-keyvault-MDWHs-Prd]
}

data "azurerm_key_vault" "MDWHsUatkeyvault" {
  name                = var.MDWHsUatkvName
  resource_group_name = var.MDWHsUatkvRgName
  # depends_on          = [module.create-keyvault-MDWHs-Uat]
}

#data "azurerm_private_dns_zone" "MDWHsDnszone" {
#  name                = var.private_dns_zone_name
#  resource_group_name = var.MDWHsPrivateDNSRgName
# depends_on          = [module.azure-private-dns-zone-MDWHs]
#}
data "azurerm_key_vault_secret" "dnszone" {
  name         = "dnszoneId"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_storage_account" "vmdiagprdsa" {
  name                = var.vmDiagPrdSA
  resource_group_name = var.MDWHsPrdVmLogsRgName
}
data "azurerm_storage_account" "auxScriptsSA" {
  name                = var.auxScriptsSA
  resource_group_name = var.MDWHsPrdAuxRgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_storage_account" "vmDiagUatSA" {
  name                = var.vmDiagUatSA
  resource_group_name = var.MDWHsUatVmLogsRgName
}
##### AVM SA PE #########
data "azurerm_subnet" "pesubnet" {
  name                 = var.dataprdSubnetName
  virtual_network_name = var.dataprdVnetName
  resource_group_name  = var.dataprdNetworkingRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
