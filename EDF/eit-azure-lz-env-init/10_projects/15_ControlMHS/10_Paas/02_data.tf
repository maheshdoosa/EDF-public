#Secrets
data "azurerm_key_vault" "kvcontrolmHSSecrets" {
  name                = var.controlmHSKvName
  resource_group_name = var.controlmHSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
}

# data "azurerm_key_vault_secret" "subscriptionId" {
#   name         = "subscriptionId"
#   key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
# }

########### Backup ###########
# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
# }

# data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
#   resource_id = module.az-recoveryservicevault.recovery_services_vault.id
# }

########### KeyVault ###########
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

data "azurerm_key_vault_secret" "dnszoneid" {
  name         = "dnszoneid"
  key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
}

data "azuread_group" "adgroup" {
  display_name = var.aad_group
}

data "azuread_user" "aduser" {
  user_principal_name = var.aad_user #["kat@hashicorp.com", "byte@hashicorp.com"]
}

data "azurerm_client_config" "current" {}

#### SA with PE ############
data "azurerm_subnet" "cntrlmHSpesubnet" {
  name                 = var.cntrlmHSpesubnetName
  virtual_network_name = var.cntrlmHSVnetName
  resource_group_name  = var.cntrlmHSNetworkingRgName
}
data "azurerm_storage_account" "cntrlmHSauxsa" {
  name                = var.cntrlmHSsa
  resource_group_name = var.cntrlmHSsaRgName
  # depends_on          = [module.mgmtaddsStorageAccount] //added
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
}
data "azurerm_storage_account" "cntrlmHSvmDiagsa" {
  name                = var.vmDiagSA
  resource_group_name = var.controlmHSVmLogsRgName
  # depends_on          = [module.vmDiag-StorageAccount]
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvcontrolmHSSecrets.id
}
