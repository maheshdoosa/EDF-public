############## Secrets ################
data "azurerm_key_vault" "kvGenTstSSManagedSecrets" {
  name                = var.managedGenHSKvName
  resource_group_name = var.managedGenHSKvRgName
}

data "azurerm_key_vault_secret" "SqlAdminAccountName" {
  name         = "ComsySqlAdminAccountname"
  key_vault_id = data.azurerm_key_vault.kvGenTstSSManagedSecrets.id
}

data "azurerm_key_vault_secret" "SqlAdminAccountPassword" {
  name         = "ComsySqlAdminAccountPassword"
  key_vault_id = data.azurerm_key_vault.kvGenTstSSManagedSecrets.id
}

data "azurerm_key_vault_secret" "comsySQLSubscriptionID" {
  name         = "comsySubscriptionID"
  key_vault_id = data.azurerm_key_vault.kvGenTstSSManagedSecrets.id
}

################ Private endpoint ##################
data "azurerm_subnet" "PEPsubnet" {
  name                 = var.privateEndpointSubnetName
  virtual_network_name = var.privateEndpointVNETName
  resource_group_name  = var.privateEndpointVNETRgName
}

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvGenTstSSManagedSecrets.id
# }

data "azurerm_mssql_server" "comsysqlserver" {
  name                = var.comsySQLServerName
  resource_group_name = module.createTargetRgForComsySQLPaaS.rgName
}

data "azurerm_mssql_database" "comsysqldb" {
  name      = var.comsySqldbname
  server_id = data.azurerm_mssql_server.comsysqlserver.id
}

data "azurerm_client_config" "current" {}

data "azuread_group" "sqladgroup" {
  display_name     = var.sqldbazureadgroup
  security_enabled = true
}

################ Diag setting for SQL database ##################

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvGenTstSSManagedSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "ssmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvGenTstSSManagedSecrets.id
}
