################ Resource Group - LA Worksapce, Automation account and update management #############
module "createRgForHSLAworksapceandAutomationAccount" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.updateManagmentRgName
  resourceLocation  = var.updateManagmentRgLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Create Log Analytics workspace for HS managment####################
module "createHSLogAnalyticsWorksapce" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-log-analytics-workspace-latest?ref=v1.0.6"
  laWorkspaceName         = var.laWorkspacename
  resourceLocation        = var.updateManagmentRgLocation
  resourceGroupName       = var.updateManagmentRgName
  logAnalyticworkspaceSku = "PerGB2018" //value is static acoss the environments
  additionalTags          = module.lawTags.tagsResult
  depends_on              = [module.createRgForHSLAworksapceandAutomationAccount]
}

################# diagnostic log configuration #######################################

module "diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.createHSLogAnalyticsWorksapce]
}

######################## Create Automation Account for Update managment###################
module "createHSUpdateManagementAutomationAccount" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-automation-account-latest?ref=v1.1.3"
  resourceGroupName         = var.updateManagmentRgName
  automationAccountLocation = var.updateManagmentRgLocation
  automationAccountName     = var.automationAccountName
  automationAccountSku      = var.automationAccountSku //"basic"
  identityType              = var.identityType
  depends_on                = [module.createRgForHSLAworksapceandAutomationAccount]
}
################# AAC diagnostic settings configuration #######################################
module "diagsettingsaac" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.aacdiag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.createHSUpdateManagementAutomationAccount]
}
############### Link automation account to a Log Analytics Workspace ###########
module "createHSLawLinkService" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-law-linked-service?ref=v1.1.3"
  laWorkspaceRgName = var.updateManagmentRgName
  # logAnalyticsWorkspaceName = var.laWorkspacename
  logAnalyticsWorkspaceId = data.azurerm_log_analytics_workspace.laWorksapce.id
  automationAccountId     = data.azurerm_automation_account.automationAccount.id
  depends_on              = [module.createRgForHSLAworksapceandAutomationAccount, module.createHSLogAnalyticsWorksapce]
}

############ Add Updates workspace solution to Log analytics#######################
module "CreateLaWorkapceSolutionForUdpateManagement" {
  source                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-law-solutions-latest?ref=v1.1.19"
  laWorkspaceRgName      = var.updateManagmentRgName
  laWorkspaceLocation    = var.updateManagmentRgLocation
  laWorkspaceName        = var.laWorkspacename
  lawSolutionName        = var.lawSolutionName
  laWorkspaceId          = data.azurerm_log_analytics_workspace.laWorksapce.id
  automationAccountId    = data.azurerm_automation_account.automationAccount.id
  enableUpdateManagement = "true"               //value is static acoss the environments
  enableChangeTracking   = "false"              //value is static acoss the environments
  laWorkspacePublisher   = "Microsoft"          //value is static acoss the environments
  laWorkspaceProduct     = "OMSGallery/Updates" //value is static acoss the environments
}
module "AzureMonitorPrivateLinkScope" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-private-linkscope-hcl?ref=v1.1.19"
  amplsname         = var.amplsName
  resourceGroupName = var.updateManagmentRgName
  depends_on        = [module.createRgForHSLAworksapceandAutomationAccount]
}

################ LAW Private endpoint ##################
module "PrivateEndPointLA" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint?ref=v1.1.19"
  endPointName                = var.laEndPointName
  endPointLocation            = var.updateManagmentRgLocation
  resourceGroupName           = var.updateManagmentRgName
  subnetId                    = data.azurerm_subnet.PEPsubnet.id
  azMonitorPrivateLinkScopeId = local.laAzMonitorPrivateLinkScopeId
  subResourceName             = var.laSubResourceName
  privateServiceConnName      = var.laEndPointName
  # privateServiceConnName      = var.laPrivateServiceConnName
  # depends_on = [module.createHSLogAnalyticsWorksapce, module.AzureMonitorPrivateLinkScope]
}

# ################### AAC Private Endpoint ###############
# module "PrivateEndPointAac" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint"
#   endPointName                = var.aacEndPointName
#   endPointLocation            = var.updateManagmentRgLocation
#   resourceGroupName           = var.updateManagmentRgName
#   subnetId                    = data.azurerm_subnet.PEPsubnet.id
#   azMonitorPrivateLinkScopeId = local.aacAzMonitorPrivateLinkScopeId
#   subResourceName             = var.aacSubResourceName
#   privateServiceConnName      = var.aacEndPointName
#   # privateServiceConnName      = var.aacPrivateServiceConnName
#   # depends_on = [module.createHSUpdateManagementAutomationAccount]
# }
########### private End Point integrating with DNS Zone ##############
module "PrivateEndPointAac" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.updateManagmentRgName
  endpoint_name                  = var.aacEndPointName
  resource_Location              = var.updateManagmentRgLocation
  subnet_id                      = data.azurerm_subnet.PEPsubnet.id
  endpoint_SC                    = var.endpoint_SC
  private_connection_resource_id = data.azurerm_automation_account.automationAccount.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [local.dnszoneid]
  additionalTags                 = module.resourceGroupTags.tagsResult
  depends_on                     = [module.createRgForHSLAworksapceandAutomationAccount, module.createHSUpdateManagementAutomationAccount]
}
