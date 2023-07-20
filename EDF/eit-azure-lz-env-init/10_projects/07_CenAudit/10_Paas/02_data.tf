#Secrets
data "azurerm_key_vault" "cenadtSecrets" {
  name                = var.cenadtKvName
  resource_group_name = var.cenadtKvRgName
}

# data "azurerm_key_vault_secret" "tenantId" {
#   name         = var.tenantId
#   key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
# }

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = var.SubscriptionId
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpId" {
  name         = var.cenadtContributorSPAppId
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpSecret" {
  name         = var.cenadtContributorSPSecret
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
########### Backup ###########
# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
# }
data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
########## KV PE ##########
data "azurerm_subnet" "subnet" {
  name                 = var.peSubnetName
  virtual_network_name = var.lzpepVnetName
  resource_group_name  = var.lzpepNetworkingRgName
}
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  #  depends_on          = [module.createkeyvault]
}
data "azurerm_key_vault_secret" "dnszoneid" {
  name         = "dnszoneid"
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
data "azuread_group" "adgroup" {
  display_name = var.aad_group
}
data "azuread_user" "aduser" {
  user_principal_name = var.aad_user #["kat@hashicorp.com", "byte@hashicorp.com"]
}
data "azurerm_client_config" "current" {
}
######### SA PE #########
data "azurerm_storage_account" "sapep" {
  name                = var.vmDiagSAname
  resource_group_name = var.lzcenadtHSbootdiagsaRgName
}
data "azurerm_storage_account" "subLogsSA" {
  name                = var.subLogsSA
  resource_group_name = var.subLogsSARgName
}
data "azurerm_storage_account" "avmsa" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_key_vault_secret" "sadnszoneid" {
  name         = "sadnszoneid"
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.cenadtSecrets.id
}
