# # #Secrets
# data "azurerm_key_vault" "mgmtssSecrets" {
#   name                = var.mgmtssKvName
#   resource_group_name = var.mgmtssKvRgName
# }

# #####################################################################
# data "azurerm_key_vault_secret" "mgmtss-udr-nexthop" {
#   for_each     = var.UDR
#   name         = each.value.kv_secret_nexthopIP
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id
# }

# data "azurerm_key_vault_secret" "mgmtss-udr-prefixes" {
#   for_each     = var.UDR
#   name         = each.value.kv_secret_udrprefixes
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id
# }

# data "azurerm_key_vault_secret" "vnet_secrets" {
#   count        = length(local.vnet_secret_names)
#   name         = local.vnet_secret_names[count.index]
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id
# }
# ######################## Peering Secrets ###################################################

# data "azurerm_key_vault_secret" "tenantId" {
#   name         = var.tenantIdSecretKey
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id

# }

# data "azurerm_key_vault_secret" "spokeSubscriptionId" {
#   name         = var.spokeSubscriptionIdSecretKey
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id
# }

# data "azurerm_key_vault_secret" "hubSubscriptionId" {
#   name         = var.hubSubscriptionIdSecretKey
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id
# }

# data "azurerm_virtual_network" "hubVNet" {
#   count               = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
#   name                = var.vnet_peering["peer-hub-spoke"]["vnet1name"]
#   resource_group_name = var.vnet_peering["peer-hub-spoke"]["vnet1rg"]
#   provider            = azurerm.hub
# }

# /*data "azurerm_virtual_network" "spokeVNet" {
#   count               = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
#   name                = var.vnet_peering["peer-hub-spoke"]["vnet2name"]
#   resource_group_name = var.vnet_peering["peer-hub-spoke"]["vnet2rg"]
#   provider            = azurerm.spoke
# }*/


# #################################
# #NSGs
# ################################
# # Fetch secrets for NSG Rules

# data "azurerm_key_vault_secret" "nsgrule_secrets" {
#   count        = length(local.nsgrules_kvsecretnames)
#   name         = local.nsgrules_kvsecretnames[count.index]
#   key_vault_id = data.azurerm_key_vault.mgmtssSecrets.id
# }


# # Fetch Application Security Group Ids

# data "azurerm_application_security_group" "asg" {
#   count               = length(local.nsgrules_asg)
#   name                = local.nsgrules_asg[count.index]
#   resource_group_name = var.asg_rg[local.nsgrules_asg[count.index]]
# }

# ################ Private endpoint ##################
# data "azurerm_subnet" "PEPsubnet" {
#   name                 = "eit-alz-ss-audit-snet-01"
#   virtual_network_name = "eit-uks-alz-ss-mgmt-vnet-01"
#   resource_group_name  = "eit-uks-alz-ss-mgmt-vnet-rg"
# }
