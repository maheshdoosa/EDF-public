# #Secrets
data "azurerm_key_vault" "mngdhsSecrets" {
  name                = var.mngdhsKvName
  resource_group_name = var.mngdhsKvRgName
}

data "azurerm_key_vault_secret" "postgresqlServerAdmin" {
  name         = "hpbdvdbprodpostgresqlAdmin"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

data "azurerm_key_vault_secret" "postgresqlServerAdminpass" {
  name         = "hpbdvdbprodpostgresqlpassword"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

data "azurerm_key_vault_secret" "hpbdvdbprodSQLSubscriptionID" {
  name         = "hpbdvdbprodDevSubscriptionID"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

################ Private endpoint ##################
data "azurerm_subnet" "hpbdvdbprodSQLsubnet" {
  name                 = var.privateEndpointSubnetName
  virtual_network_name = var.privateEndpointVNETName
  resource_group_name  = var.privateEndpointVNETRgName
}


data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

data "azurerm_postgresql_server" "hpbdvdbSqlDBserver" {
  name                = var.hpbdvdbprodServerName
  resource_group_name = var.hpbdvdbprodRgName
}
