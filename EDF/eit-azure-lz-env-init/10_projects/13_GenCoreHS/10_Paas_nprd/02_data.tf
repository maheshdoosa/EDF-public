#Secrets
data "azurerm_key_vault" "kvgennpHSSecrets" {
  name                = var.gennpHSKvName
  resource_group_name = var.gennpHSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvgennpHSSecrets.id
}

# data "azurerm_key_vault_secret" "subscriptionId" {
#   name         = "subscriptionId"
#   key_vault_id = data.azurerm_key_vault.kvgennpHSSecrets.id
# }

########### Backup ###########

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvgennpHSSecrets.id
# }

########### KeyVault ###########

data "azurerm_virtual_network" "vnet" {
  name                = var.lzgennpVnetName
  resource_group_name = var.lzgennpNetworkingRgName
}

data "azurerm_subnet" "gencoreHSpesubnet" {
  name                 = var.peSubnetName
  virtual_network_name = var.lzgennpVnetName
  resource_group_name  = var.lzgenNetworkingRgName
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  # depends_on          = [module.createkeyvault]
}

data "azurerm_private_dns_zone" "dnszone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.kv_resource_group_name
  # depends_on                            = [module.azure-private-dns-zone]
}

data "azuread_group" "adgroup" {
  display_name = var.aad_group
}

data "azurerm_client_config" "current" {

}

data "azurerm_storage_account" "vmDiagsa" {
  name                = var.vmDiagSA
  resource_group_name = var.gennpLogsRgName
}
data "azurerm_storage_account" "scriptsSA" {
  name                = var.gennonprodHSauxsa
  resource_group_name = var.gennpscriptsRgName
}

data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.kvgennpHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvgennpHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvgennpHSSecrets.id
}

data "azurerm_storage_account" "avmsa" {
  name                = var.avmsaname
  resource_group_name = var.avmsargname
}