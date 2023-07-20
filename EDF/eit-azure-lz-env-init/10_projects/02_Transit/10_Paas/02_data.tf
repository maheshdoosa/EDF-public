#Secrets
data "azurerm_key_vault" "kvtransitSecrets" {
  name                = var.transitKvName
  resource_group_name = var.transitKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "az-lz-transit-tenant-id"
  key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "az-lz-transit-subscription-id"
  key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpId" {
  name         = "az-lz-transit-contributor-sp-id"
  key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpSecret" {
  name         = "az-lz-transit-contributor-sp-secret"
  key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
}

########### Backup ###########

#data "azurerm_client_config" "current" {}


# data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
#   resource_id = module.az-recoveryservicevault.recovery_services_vault.id
# }

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
# }
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
}

data "azurerm_key_vault" "expressroutekv" {
  name                = var.keyvault_name02
  resource_group_name = var.kv_resource_group_name02
}
# data "azurerm_key_vault" "kvtransitSecrets" {
#   name                = var.expressroutekv
#   resource_group_name = var.kv_resource_group_name02
# }

##### AVM SA PE #########
# data "azurerm_subnet" "pesubnet" {
#   name                 = var.transitSubnetName
#   virtual_network_name = var.transitVnetName
#   resource_group_name  = var.transitNetworkingRgName
# }
# data "azurerm_key_vault_secret" "HScentraldnszoneid" {
#   name         = "HScentraldnszoneid"
#   key_vault_id = data.azurerm_key_vault.kvtransitSecrets.id
# }
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
