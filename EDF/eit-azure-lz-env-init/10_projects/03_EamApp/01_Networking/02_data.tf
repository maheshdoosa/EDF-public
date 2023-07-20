# #Secrets
data "azurerm_key_vault" "kvEamAppSecrets" {
  name                = var.eamAppKvName
  resource_group_name = var.eamAppKvRgName
}


# #Peering Secrets

data "azurerm_key_vault_secret" "tenantId" {
  name         = var.tenantId
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id

}

data "azurerm_key_vault_secret" "spokeSubscriptionId" {
  name         = var.spokeSubscriptionId
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_key_vault_secret" "ciSubscriptionId" {
  name         = var.ciSubscriptionId
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_key_vault_secret" "hubSubscriptionId" {
  name         = var.hubSubscriptionId
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}


data "azurerm_virtual_network" "hubVNet" {
  count               = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
  name                = var.vnet_peering["peer-hub-spoke"]["vnet1name"]
  resource_group_name = var.vnet_peering["peer-hub-spoke"]["vnet1rg"]
  provider            = azurerm.hub
}

data "azurerm_virtual_network" "ciVNet" {
  count               = var.vnet_peering["peer-ci-spoke"]["enable"] == true ? 1 : 0
  name                = var.vnet_peering["peer-ci-spoke"]["vnet1name"]
  resource_group_name = var.vnet_peering["peer-ci-spoke"]["vnet1rg"]
  provider            = azurerm.ci
}

#####################################################################
data "azurerm_key_vault_secret" "eam-udr-nexthop" {
  for_each     = var.UDR
  name         = each.value.kv_secret_nexthopIP
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_key_vault_secret" "eam-udr-prefixes" {
  for_each     = var.UDR
  name         = each.value.kv_secret_udrprefixes
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_key_vault_secret" "vnet_secrets" {
  count        = length(local.vnet_secret_names)
  name         = local.vnet_secret_names[count.index]
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvEamAppSecrets.id
}

data "azurerm_virtual_network" "eamapp_vnet" {
  name                = var.diag_vnet_name
  resource_group_name = var.diag_vnet_rg
}
