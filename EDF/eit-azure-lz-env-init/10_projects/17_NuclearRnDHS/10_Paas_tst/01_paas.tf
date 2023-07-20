module "createTargetRgForhpbdvdbdev" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.hpbdvdbdevRgName
  resourceLocation  = var.hpbdvdbdevResourceLocation
  additionalTags    = module.hpbdvdbdevresourceGroupTags.tagsResult
}


module "azurepostgreSqlPaasForhpbdvdbdev" {
  source                                       = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-postgresql-paas?ref=v1.1.11"
  postgresqlServerName                         = var.hpbdvdbdevServerName
  postgresqlServerLocation                     = var.hpbdvdbdevResourceLocation
  postgresqlServerResoruceGroupName            = var.hpbdvdbdevRgName
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
  postgresqlDbResoruceGroupName                = var.hpbdvdbdevRgName
  charset                                      = var.charset
  collation                                    = var.collation
  depends_on                                   = [module.createTargetRgForhpbdvdbdev]
}


############# Private Endpoint for Azure SQL hpbdvd ###############################
module "PrivateEndPointForhpbdvdbdevSQL" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint?ref=v1.1.19"
  endPointName                = var.hpbdvdSQLEndPointName
  endPointLocation            = var.hpbdvdbdevResourceLocation
  resourceGroupName           = var.privateEndpointVNETRgName
  subnetId                    = data.azurerm_subnet.hpbdvdbdevSQLsubnet.id
  azMonitorPrivateLinkScopeId = local.hpbdvdSQLLinkScopeId
  subResourceName             = var.privateEndpointSubResourceName #
  privateServiceConnName      = var.hpbdvdSQLServiceConnName
  depends_on                  = [module.azurepostgreSqlPaasForhpbdvdbdev]
}

module "sqlpaas-diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.azurepostgreSqlPaasForhpbdvdbdev]
}
