# #Secrets
data "azurerm_key_vault" "mngdhsSecrets" {
  name                = var.mngdhsKvName
  resource_group_name = var.mngdhsKvRgName
}

data "azurerm_key_vault_secret" "postgresqlServerAdmin" {
  name         = "hpbdvdbdevpostgresqlAdmin"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

data "azurerm_key_vault_secret" "postgresqlServerAdminpass" {
  name         = "hpbdvdbdevpostgresqlpassword"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

data "azurerm_key_vault_secret" "hpbdvdbdevSQLSubscriptionID" {
  name         = "hpbdvdbdevDevSubscriptionID"
  key_vault_id = data.azurerm_key_vault.mngdhsSecrets.id
}

################ Private endpoint ##################
data "azurerm_subnet" "hpbdvdbdevSQLsubnet" {
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
  name                = var.hpbdvdbdevServerName
  resource_group_name = var.hpbdvdbdevRgName
}
