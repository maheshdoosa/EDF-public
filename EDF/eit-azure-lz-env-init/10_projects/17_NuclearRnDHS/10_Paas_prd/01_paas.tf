module "createTargetRgForhpbdvdbprod" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.hpbdvdbprodRgName
  resourceLocation  = var.hpbdvdbprodResourceLocation
  additionalTags    = module.hpbdvdbprodresourceGroupTags.tagsResult
}


module "azurepostgreSqlPaasForhpbdvdbprod" {
  source                                       = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-postgresql-paas?ref=v1.1.11"
  postgresqlServerName                         = var.hpbdvdbprodServerName
  postgresqlServerLocation                     = var.hpbdvdbprodResourceLocation
  postgresqlServerResoruceGroupName            = var.hpbdvdbprodRgName
  skuName                                      = var.postgreSqlsku
  storageMb                                    = var.postgreSqlstorageMb
  backupRetensionDays                          = var.backupRetensionDays
  georedundantBackupEnabled                    = var.georedundantBackupEnabled
  autoGrowEnabled                              = var.autoGrowEnabled
  postgresqlServerAdministratorAccountName     = data.azurerm_key_vault_secret.postgresqlServerAdmin.value
  postgresqlServerAdministratorAccountPassword = data.azurerm_key_vault_secret.postgresqlServerAdminpass.value
  postgreSqlServerVersion                      = var.postgreSqlServerVersion
  sslEnforcementEnabled                        = var.sslEnforcementEnabled
  databaseNames                                = var.databaseNames
  postgresqlDbResoruceGroupName                = var.hpbdvdbprodRgName
  charset                                      = var.charset
  collation                                    = var.collation
  depends_on                                   = [module.createTargetRgForhpbdvdbprod]
}


############# Private Endpoint for Azure SQL hpbdvd ###############################
module "PrivateEndPointForhpbdvdbprodSQL" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint?ref=v1.1.19"
  endPointName                = var.hpbdvdSQLEndPointName
  endPointLocation            = var.hpbdvdbprodResourceLocation
  resourceGroupName           = var.privateEndpointVNETRgName
  subnetId                    = data.azurerm_subnet.hpbdvdbprodSQLsubnet.id
  azMonitorPrivateLinkScopeId = local.hpbdvdSQLLinkScopeId
  subResourceName             = var.privateEndpointSubResourceName #
  privateServiceConnName      = var.hpbdvdSQLServiceConnName
  depends_on                  = [module.azurepostgreSqlPaasForhpbdvdbprod]
}

module "sqlpaas-diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.azurepostgreSqlPaasForhpbdvdbprod]
}
