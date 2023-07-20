################# Resource Group - Gen Prd Comsy SQL PaaS  #############
module "createTargetRgForComsySQLPaaS" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.comsySQLPaaSRgName
  resourceLocation  = var.ComsyHSResourceLocation
  additionalTags    = module.Sql-Rg-Tags.tagsResult
}

################ Azure SQL server and DB for COMSY application ##########################
module "CreateGenPrdManagedTSTSqlPaaSServer" {
  source                                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sql-paas?ref=v1.1.19"
  sqlServerName                         = var.comsySQLServerName
  sqlServerResoruceGroupName            = module.createTargetRgForComsySQLPaaS.rgName
  sqlServerPrimaryLocation              = var.ComsyHSResourceLocation
  azureSqlServerVersion                 = var.comsySqlServerVersion
  sqlServerAdministratorAccountName     = data.azurerm_key_vault_secret.SqlAdminAccountName.value
  sqlServerAdministratorAccountPassword = data.azurerm_key_vault_secret.SqlAdminAccountPassword.value
  privateEndpointConnectionEnabled      = var.comsySqlPrivateEndpointDecision
  minimumTLSVersion                     = "1.2"
  assignManagedSystemIdentity           = "true"
  databaseNames                         = var.comsySqlDBNames #["tsttstqljbdb"]
  maxDbSizeInGB                         = var.comsySqlDBMaxSize
  sqlDbSkuName                          = var.comsySqlDBSkuName #"GP_Gen5_2"
  sqlDbZoneRedundant                    = var.comsySqlDBZoneRedundantDecision
  elasticPoolId                         = "null"
  createMode                            = "Default"
  enableFailoverServer                  = var.comsySqlDBFailoverDecision
  failoverLocation                      = var.comsySqlDBFailoverLocation
  readWriteEndpointFailoverPolicyMode   = var.endpointFailoverPolicyModeDecision
  azuread_authentication_only           = var.azuread_authentication_only
  sqldbazureadgroup                     = var.sqldbazureadgroup
  sqldbazureadgroup_object_id           = data.azuread_group.sqladgroup.object_id
  tenant_id                             = data.azurerm_client_config.current.tenant_id
  depends_on                            = [module.createTargetRgForComsySQLPaaS]
}

############# Private Endpoint for Azure SQL COMSY ###############################
module "PrivateEndPointComsySQL" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint?ref=v1.1.19"
  endPointName                = var.comsySQLEndPointName
  endPointLocation            = var.ComsyHSResourceLocation
  resourceGroupName           = var.privateEndpointVNETRgName
  subnetId                    = data.azurerm_subnet.PEPsubnet.id
  azMonitorPrivateLinkScopeId = local.comsySQLLinkScopeId
  subResourceName             = var.privateEndpointSubResourceName #sqlServer
  privateServiceConnName      = var.comsySQLServiceConnName
  depends_on                  = [module.CreateGenPrdManagedTSTSqlPaaSServer]
}

########### Enabling SQL Server and Data Base level Auditing Logs ###########
/*resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "AzureSQLAuditing"
  target_resource_id         = data.azurerm_mssql_database.comsysqldb.id
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId.value
  log {
    category = "SQLSecurityAuditEvents"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = false
    }
  }
  lifecycle {
    ignore_changes = [log, metric]
  }
}*/
resource "azurerm_mssql_database_extended_auditing_policy" "example" {
  database_id            = data.azurerm_mssql_database.comsysqldb.id
  log_monitoring_enabled = true
}
resource "azurerm_mssql_server_extended_auditing_policy" "example1" {
  server_id              = data.azurerm_mssql_server.comsysqlserver.id
  log_monitoring_enabled = true
}

module "diagsettings_paas" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings_sql
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.CreateGenPrdManagedTSTSqlPaaSServer]
}
