#Secrets
data "azurerm_key_vault" "kvSecrets" {
  name                = var.avdSSKvName
  resource_group_name = var.avdSSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "subscriptionId"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}
########### Backup ###########

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}

data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
  resource_id = module.az-recoveryservicevault.recovery_services_vault.id
}

data "azurerm_client_config" "current" {

}


########### KeyVault ###########


data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  # depends_on          = [module.createkeyvault]
}

data "azuread_user" "aduser" {
  user_principal_name = var.aad_user
}

data "azuread_user" "aduser1" {
  user_principal_name = var.aad_user1
}


########### PE for SA #############

data "azurerm_storage_account" "cusauxsa" {
  name                = var.cusauxsa
  resource_group_name = var.cusauxsaRgName
}
data "azurerm_subnet" "cuspesubnet" {
  name                 = var.cuspesubnetName
  virtual_network_name = var.cusVnetName
  resource_group_name  = var.cusNetworkingRgName
}
data "azurerm_storage_account" "cusvmDiagsa" {
  name                = var.vmDiagSA
  resource_group_name = var.AVDVmLogsRgName
}

data "azurerm_key_vault_secret" "dnszoneid" {
  name         = "dnszoneid"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}

data "azurerm_key_vault_secret" "blobdnszoneid" {
  name         = "blobdnszoneid"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}
