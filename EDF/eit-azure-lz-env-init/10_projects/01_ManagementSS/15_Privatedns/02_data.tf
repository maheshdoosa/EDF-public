########## Custom role Data Sources ####################

# data "azurerm_key_vault" "SSmgmtSecrets" {
#    name                = var.SSmgmtKvName
#    resource_group_name = var.SSmgmtKvRgName
# }

# data "azurerm_key_vault_secret" "SubscriptionId" {
#   name         = "mgmtss-SubscriptionId"
#   key_vault_id = data.azurerm_key_vault.SSmgmtSecrets.id
# }
