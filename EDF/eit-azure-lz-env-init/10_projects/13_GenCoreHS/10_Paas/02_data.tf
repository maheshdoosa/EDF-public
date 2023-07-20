#Secrets
data "azurerm_key_vault" "kvgenprdHSSecrets" {
  name                = var.genprdHSKvName
  resource_group_name = var.genprdHSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
}

# data "azurerm_key_vault_secret" "subscriptionId" {
#   name         = "subscriptionId"
#   key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
# }

########### Backup ###########

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
# }

########### KeyVault ###########

# data "azurerm_virtual_network" "vnet" {
#   name                = var.lzgenprdVnetName
#   resource_group_name = var.lzgenprdNetworkingRgName
# }

data "azurerm_subnet" "subnet" {
  name                 = var.peSubnetName
  virtual_network_name = var.lzgenprdVnetName
  resource_group_name  = var.lzgenprdNetworkingRgName
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  # depends_on          = [module.createkeyvault]
}

# data "azurerm_private_dns_zone" "dnszone" {
#   name                = var.private_dns_zone_name
#   resource_group_name = var.kv_resource_group_name
#   # depends_on                            = [module.azure-private-dns-zone]
# }

data "azuread_group" "adgroup" {
  display_name = var.aad_group
}

data "azurerm_client_config" "current" {

}

########## Storage Account Private Endpoint ###################

data "azurerm_private_dns_zone" "sadnszone" {
  name                = var.sa_private_dns_zone_name
  resource_group_name = var.sa_private_dns_zone_rg_name
}

data "azurerm_storage_account" "genprodHSauxsa" {
  name                = var.vmprepscriptsSA
  resource_group_name = var.genprdscriptsRgName
}
# data "azurerm_key_vault_secret" "HScentraldnszoneid" {
#   name         = "HScentraldnszoneid"
#   key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
# }
data "azurerm_storage_account" "genprodHSvmDiagsa" {
  name                = var.vmDiagSA
  resource_group_name = var.genprdvmLogsRgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
}
data "azurerm_key_vault_secret" "dnszoneid" {
  name         = "dnszoneid"
  key_vault_id = data.azurerm_key_vault.kvgenprdHSSecrets.id
}
