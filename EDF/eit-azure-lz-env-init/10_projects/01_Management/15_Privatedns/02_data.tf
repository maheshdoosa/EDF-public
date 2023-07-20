# ########## Custom role Data Sources ####################

# data "azurerm_key_vault" "HSmgmtSecrets" {
#    name                = var.HSmgmtKvName
#    resource_group_name = var.HSmgmtKvRgName
# }

# data "azurerm_key_vault_secret" "SubscriptionId" {
#   name         = "hsManagementSubscriptionId"
#   key_vault_id = data.azurerm_key_vault.HSmgmtSecrets.id
# }

########## data sources the vnet id #########################

data "azurerm_virtual_network" "Vnet" {
  name                = local.Vnetid
  resource_group_name = "eit-uks-alz-hs-mgmt-vnet-rg"
}

########### a records ##########
data "azurerm_key_vault" "Secrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}

data "azurerm_key_vault_secret" "recordsecret" {
  count        = length(local._pvtdnszoneArecords1)
  name         = local._pvtdnszoneArecords1[count.index]
  key_vault_id = data.azurerm_key_vault.Secrets.id
}
