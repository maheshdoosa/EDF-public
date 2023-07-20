data "azurerm_key_vault" "kv" {
  name                = var.kvname
  resource_group_name = var.kvrg
}

data "azurerm_key_vault_secret" "azlzstagingSPIdSecret" {
  name         = "azlzstagingSPIdSecret"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "azlzstagingSPKeySecret" {
  name         = "azlzstagingSPKeySecret"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "azlzstagingSpnTenantIdSecret" {
  name         = "azlzstagingSpnTenantIdSecret"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "subscriptionOwnerObjectId" {
  name         = "subscriptionOwnerObjectId"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "eaAccountUserName" {
  name         = "eaAccountUserName"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "eaAccountUserPassword" {
  name         = "eaAccountUserPassword"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azuredevops_project" "adoBootStrapProject" {
  project_name = var.adoBootStrapProjectName
}
