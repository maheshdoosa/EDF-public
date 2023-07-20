########## Custom role Data Sources ####################
data "azurerm_subscription" "current" {
}

##############

data "azurerm_key_vault" "HSmgmtSecrets" {
  name                = var.HSmgmtKvName
  resource_group_name = var.HSmgmtKvRgName
}

data "azurerm_client_config" "current" {
}

data "azurerm_key_vault_secret" "aacprincipalid" {
  name         = "aacprincipalid"
  key_vault_id = data.azurerm_key_vault.HSmgmtSecrets.id
}

## data sourcing the all SS Subscriptions

data "azurerm_subscriptions" "HSsubscriptions" {
  display_name_contains = "-hs-"
}

data "azurerm_key_vault_secret" "eitdevopsprincipalid" {
  name         = "eitdevopsprincipalid"
  key_vault_id = data.azurerm_key_vault.HSmgmtSecrets.id
}
