################ Resource Group - LA Worksapce, Automation account and update management #############

module "createRgForCenAdutiLaWorksapce" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.cenAuditLaRgName
  resourceLocation  = var.cenAuditLaRgLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Create Log Analytics workspace for SS managment####################

module "createSSLogAnalyticsWorksapce" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-logAnalytics?ref=v1.1.19"

  laWorkspaceName   = var.laWorkspaceName
  resourceLocation  = var.cenAuditLaRgLocation
  resourceGroupName = var.cenAuditLaRgName
  sku               = "PerGB2018" //value is static acoss the environments

  additionalTags = module.cenAuditLaTags.tagsResult

  depends_on = [module.createRgForCenAdutiLaWorksapce]

}

module "SentinelWorkspaceForCenadtSub" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sentinel?ref=v1.1.19"

  laWorkspaceRgName    = var.cenAuditLaRgName
  laWorkspaceLocation  = var.cenAuditLaRgLocation
  laWorkspaceName      = var.laWorkspaceName
  laWorkspaceId        = data.azurerm_log_analytics_workspace.cenAuditLaWorksapce.id
  laWorkspacePublisher = "Microsoft"
  laWorkspaceProduct   = "OMSGallery/SecurityInsights"
  lawSolutionName      = var.cenAuditSentinelSolutionName
  additionalTags       = module.cenAuditLaTags.tagsResult
}


resource "azurerm_monitor_diagnostic_setting" "CentAudit_Diag" {
  name                       = "Diag-Settings"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.cenAuditLaWorksapce.id
  target_resource_id         = data.azurerm_log_analytics_workspace.cenAuditLaWorksapce.id
  storage_account_id         = data.azurerm_storage_account.bootDiagLogStorageAccountName.id

  log {
    category = "Audit"
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
}
