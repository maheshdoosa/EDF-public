########### KeyVault ###########

#Secrets
data "azurerm_key_vault" "kvSecrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}

data "azurerm_virtual_network" "vnet" {
  name                = var.VnetName
  resource_group_name = var.NetworkingRgName
}

data "azurerm_subnet" "subnet" {
  name                 = var.peSubnetName
  virtual_network_name = var.VnetName
  resource_group_name  = var.NetworkingRgName
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  depends_on          = [module.createkeyvault]
}

data "azurerm_private_dns_zone" "dnszone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.kv_resource_group_name
  depends_on          = [module.azure-private-dns-zone]
}

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvSecrets.id
# }

# data "azuread_group" "adgroup" {
#   display_name = var.aad_group
# }

# data "azuread_user" "aduser" {
#   user_principal_name = var.aad_user #["kat@hashicorp.com", "byte@hashicorp.com"]
# }

data "azurerm_client_config" "current" {
}

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvSecrets.id
}
