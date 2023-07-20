#Secrets
data "azurerm_key_vault" "kvsnowmidSSecrets" {
  name                = var.snowmidSSKvName
  resource_group_name = var.snowmidSSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvsnowmidSSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "subscriptionId"
  key_vault_id = data.azurerm_key_vault.kvsnowmidSSecrets.id
}

########### Backup ###########

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvsnowmidSSecrets.id
}

data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
  resource_id = module.az-recoveryservicevault.recovery_services_vault.id
}

########### KeyVault ###########

# data "azurerm_virtual_network" "vnet" {
#   name                 = var.lzsandpitVnetName
#   resource_group_name  = var.lzsandpitNetworkingRgName
# }

data "azurerm_subnet" "subnet" {
  name                 = var.peSubnetName
  virtual_network_name = var.lzsandpitVnetName
  resource_group_name  = var.lzsandpitNetworkingRgName
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  # depends_on          = [module.createkeyvault]
}

# data "azurerm_private_dns_zone" "dnszone" {
#   name                                  = var.private_dns_zone_name
#   resource_group_name                   = var.kv_resource_group_name
#   depends_on                            = [module.azure-private-dns-zone]
# }

data "azurerm_key_vault_secret" "blobdnszoneid" {
  name         = "blobdnszoneid"
  key_vault_id = data.azurerm_key_vault.kvsnowmidSSecrets.id
}

data "azurerm_key_vault_secret" "dnszoneid" {
  name         = "dnszoneid"
  key_vault_id = data.azurerm_key_vault.kvsnowmidSSecrets.id
}

data "azuread_group" "adgroup" {
  display_name = var.aad_group
}

data "azuread_user" "aduser" {
  user_principal_name = var.aad_user #["kat@hashicorp.com", "byte@hashicorp.com"]
}

data "azurerm_client_config" "current" {

}

data "azurerm_storage_account" "secgovauxsa" {
  name                = var.secgovauxsa
  resource_group_name = var.secgovauxsaRgName
}
data "azurerm_subnet" "secgovpesubnet" {
  name                 = var.secgovpesubnetName
  virtual_network_name = var.secgovVnetName
  resource_group_name  = var.secgovNetworkingRgName
}
data "azurerm_storage_account" "secgovvmDiagsa" {
  name                = var.vmDiagSA
  resource_group_name = var.snowmidSSVmLogsRgName
}
