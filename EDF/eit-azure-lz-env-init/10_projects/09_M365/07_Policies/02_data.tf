########## Custom role Data Sources ####################

data "azurerm_key_vault" "m365Secrets" {
  name                = var.m365KvName
  resource_group_name = var.m365KvRgName
}

data "azurerm_key_vault_secret" "SubscriptionId" {
  name         = "subscriptionId"
  key_vault_id = data.azurerm_key_vault.m365Secrets.id
}
