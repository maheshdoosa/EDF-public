# #Secrets
data "azurerm_key_vault" "kvEamCISecrets" {
  name                = var.eamCIKvName
  resource_group_name = var.eamCIKvRgName
}

# #Peering Secrets

data "azurerm_key_vault_secret" "tenantId" {
  name         = var.tenantId
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id

}

data "azurerm_key_vault_secret" "spokeSubscriptionId" {
  name         = var.spokeSubscriptionId
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}

data "azurerm_key_vault_secret" "hubSubscriptionId" {
  name         = var.hubSubscriptionId
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}

data "azurerm_virtual_network" "hubVNet" {
  count               = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
  name                = var.vnet_peering["peer-hub-spoke"]["vnet1name"]
  resource_group_name = var.vnet_peering["peer-hub-spoke"]["vnet1rg"]
  provider            = azurerm.hub
}

#####################################################################
data "azurerm_key_vault_secret" "eam-udr-nexthop" {
  for_each     = var.UDR
  name         = each.value.kv_secret_nexthopIP
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}

data "azurerm_key_vault_secret" "eam-udr-prefixes" {
  for_each     = var.UDR
  name         = each.value.kv_secret_udrprefixes
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}

data "azurerm_key_vault_secret" "vnet_secrets" {
  count        = length(local.vnet_secret_names)
  name         = local.vnet_secret_names[count.index]
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}
# ############# NSG ############
# data "azurerm_key_vault_secret" "nsgrule_secrets" {
#   count        = length(local.nsgrules_kvsecretnames)
#   name         = local.nsgrules_kvsecretnames[count.index]
#   key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
# }
# # Fetch Application Security Group Ids
# data "azurerm_application_security_group" "asg" {
#   count               = length(local.nsgrules_asg)
#   name                = local.nsgrules_asg[count.index]
#   resource_group_name = var.asg_rg[local.nsgrules_asg[count.index]]
# }

data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}

data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}

data "azurerm_virtual_network" "eamci_vnet" {
  name                = var.diag_vnet_name
  resource_group_name = var.diag_vnet_rg
}

data "azurerm_key_vault_secret" "eam-dmzvnet" {
  name         = "eam-dmzvnet"
  key_vault_id = data.azurerm_key_vault.kvEamCISecrets.id
}
