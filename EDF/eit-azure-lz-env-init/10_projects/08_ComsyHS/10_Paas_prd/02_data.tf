########### Comsy HS Resources #############

data "azurerm_client_config" "current" {}

#Secrets
data "azurerm_key_vault" "ComsyHsprdSecrets" {
  name                = var.managedGenHSKvName
  resource_group_name = var.managedGenHSKvRgName
}

# data "azurerm_key_vault_secret" "laworkspaceResourceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
# }

# data "azurerm_virtual_network" "ComsyHsPrdVnet" {
#   name                = var.ComsyHsPrdVnetName
#   resource_group_name = var.ComsyHsPrdNetworkingRgName
# }


data "azurerm_subnet" "ComsyHsPrdsubnet" {
  name                 = var.ComsyHsPrdSubnetName
  virtual_network_name = var.ComsyHsPrdVnetName
  resource_group_name  = var.ComsyHsPrdNetworkingRgName
}

data "azurerm_key_vault" "ComsyHsPrdkeyvault" {
  name                = var.ComsyHS_keyvault_name
  resource_group_name = var.ComsyHS_kv_resourceGroupName
  #depends_on          = [module.create-keyvault-for-ComsyHs]
}

#data "azurerm_private_dns_zone" "ComsyHsDnszone" {
#  name                = var.private_dns_zone_name
#  resource_group_name = var.ComsyHSPrivateDNSRgName
#}
data "azurerm_key_vault_secret" "dnszone" {
  name         = "dnszoneId"
  key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
}

################### SQL DB #############
data "azurerm_key_vault_secret" "SqlAdminAccountName" {
  name         = "ComsySqlAdminAccountname"
  key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
}
data "azurerm_key_vault_secret" "SqlAdminAccountPassword" {
  name         = "ComsySqlAdminAccountPassword"
  key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
}
data "azuread_group" "sqladgroup" {
  display_name     = var.sqldbazureadgroup
  security_enabled = true
}
##########
data "azurerm_mssql_database" "comsysqldb" {
  name      = var.comsySqldbname
  server_id = data.azurerm_mssql_server.comsysqlserver.id
}
data "azurerm_mssql_server" "comsysqlserver" {
  name                = var.comsySQLServerName
  resource_group_name = module.createTargetRgForComsySQLPaaS.rgName
}
# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
# }
data "azurerm_key_vault_secret" "comsySQLSubscriptionID" {
  name         = "comsySubscriptionID"
  key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
}
################ Private endpoint ##################
data "azurerm_subnet" "PEPsubnet" {
  name                 = var.privateEndpointSubnetName
  virtual_network_name = var.privateEndpointVNETName
  resource_group_name  = var.privateEndpointVNETRgName
}

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.ComsyHsprdSecrets.id
}
