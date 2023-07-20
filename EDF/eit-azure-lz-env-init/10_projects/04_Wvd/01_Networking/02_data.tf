# #Secrets
data "azurerm_key_vault" "wvdSecrets" {
  name                = var.wvdKvName
  resource_group_name = var.wvdKvRgName
}

#####################################################################
data "azurerm_key_vault_secret" "wvd-udr-nexthop" {
  for_each     = var.UDR
  name         = each.value.kv_secret_nexthopIP
  key_vault_id = data.azurerm_key_vault.wvdSecrets.id
}

data "azurerm_key_vault_secret" "wvd-udr-prefixes" {
  for_each     = var.UDR
  name         = each.value.kv_secret_udrprefixes
  key_vault_id = data.azurerm_key_vault.wvdSecrets.id
}

data "azurerm_key_vault_secret" "vnet_secrets" {
  count        = length(local.vnet_secret_names)
  name         = local.vnet_secret_names[count.index]
  key_vault_id = data.azurerm_key_vault.wvdSecrets.id
}
######################## Peering Secrets ###################################################

data "azurerm_key_vault_secret" "tenantId" {
  name         = var.tenantId
  key_vault_id = data.azurerm_key_vault.wvdSecrets.id

}

data "azurerm_key_vault_secret" "spokeSubscriptionId" {
  name         = var.spokeSubscriptionId
  key_vault_id = data.azurerm_key_vault.wvdSecrets.id
}

data "azurerm_key_vault_secret" "hubSubscriptionId" {
  name         = var.hubSubscriptionId
  key_vault_id = data.azurerm_key_vault.wvdSecrets.id
}

data "azurerm_virtual_network" "hubVNet" {
  count               = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
  name                = var.vnet_peering["peer-hub-spoke"]["vnet1name"]
  resource_group_name = var.vnet_peering["peer-hub-spoke"]["vnet1rg"]
  provider            = azurerm.hub
}

/*data "azurerm_virtual_network" "spokeVNet" {
  count               = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
  name                = var.vnet_peering["peer-hub-spoke"]["vnet2name"]
  resource_group_name = var.vnet_peering["peer-hub-spoke"]["vnet2rg"]
  provider            = azurerm.spoke
}*/
