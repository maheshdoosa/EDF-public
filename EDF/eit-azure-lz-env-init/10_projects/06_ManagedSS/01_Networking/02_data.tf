# #Secrets
data "azurerm_key_vault" "mngdssSecrets" {
  name                = var.mngdssKvName
  resource_group_name = var.mngdssKvRgName
}

#####################################################################
data "azurerm_key_vault_secret" "mngdss-udr-nexthop" {
  for_each     = var.UDR
  name         = each.value.kv_secret_nexthopIP
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id
}

data "azurerm_key_vault_secret" "mngdss-udr-prefixes" {
  for_each     = var.UDR
  name         = each.value.kv_secret_udrprefixes
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id
}

data "azurerm_key_vault_secret" "vnet_secrets" {
  count        = length(local.vnet_secret_names)
  name         = local.vnet_secret_names[count.index]
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id
}
######################## Peering Secrets ###################################################

data "azurerm_key_vault_secret" "tenantId" {
  name         = var.tenantId
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id

}

data "azurerm_key_vault_secret" "spokeSubscriptionId" {
  name         = var.spokeSubscriptionId
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id
}

data "azurerm_key_vault_secret" "hubSubscriptionId" {
  name         = var.hubSubscriptionId
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id
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


#################################
#NSGs
################################
# Fetch secrets for NSG Rules

data "azurerm_key_vault_secret" "nsgrule_secrets" {
  count        = length(local.nsgrules_kvsecretnames)
  name         = local.nsgrules_kvsecretnames[count.index]
  key_vault_id = data.azurerm_key_vault.mngdssSecrets.id
}


# Fetch Application Security Group Ids

data "azurerm_application_security_group" "asg" {
  count               = length(local.nsgrules_asg)
  name                = local.nsgrules_asg[count.index]
  resource_group_name = var.asg_rg[local.nsgrules_asg[count.index]]
}
