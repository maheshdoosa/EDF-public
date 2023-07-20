################ Resource Group - LA Worksapce, Automation account and update management #############

module "createRgForSSLAworksapceandAutomationAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.updateManagmentRgName
  resourceLocation  = var.updateManagmentRgLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Create Log Analytics workspace for SS managment####################

module "createSSLogAnalyticsWorksapce" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-log-analytics-workspace-latest"

  laWorkspaceName         = var.laWorkspacename
  resourceLocation        = var.updateManagmentRgLocation
  resourceGroupName       = var.updateManagmentRgName
  logAnalyticworkspaceSku = "PerGB2018" //value is static acoss the environments

  depends_on = [module.createRgForSSLAworksapceandAutomationAccount]
}

######################## Create Automation Account for Update managment###################

module "createSSUpdateManagementAutomationAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-automation-account-latest"

  resourceGroupName         = var.updateManagmentRgName
  automationAccountLocation = var.updateManagmentRgLocation
  automationAccountName     = var.automationAccountName
  automationAccountSku      = var.automationAccountSku //"basic"

  depends_on = [module.createRgForSSLAworksapceandAutomationAccount]
}

############### Link automation account to a Log Analytics Workspace ###########

module "createSSLawLinkService" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-law-linked-service"

  laWorkspaceRgName         = var.updateManagmentRgName
  logAnalyticsWorkspaceName = var.laWorkspacename
  automationAccountId       = data.azurerm_automation_account.automationAccount.id

  depends_on = [module.createRgForSSLAworksapceandAutomationAccount, module.createSSLogAnalyticsWorksapce]

}

############ Add Updates workspace solution to Log analytics#######################

module "CreateLaWorkapceSolutionForUdpateManagement" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-law-solutions-latest"

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

module "ssMgmtAzureMonitorPrivateLinkScope" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-private-linkscope"

  spSecret          = data.azurerm_key_vault_secret.spSecret.value
  tenantId          = data.azurerm_key_vault_secret.tenantId.value
  spApplicationId   = data.azurerm_key_vault_secret.spApplicationId.value
  name              = var.amplsName
  resourceGroupName = var.updateManagmentRgName

  depends_on = [module.createRgForSSLAworksapceandAutomationAccount]
}

module "ssMgmtAzureUpdateSchedule" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-update-schedule"

  logFilePath           = "${path.module}/scripts/"
  automationAccountName = var.automationAccountName
  resourceGroupName     = var.updateManagmentRgName
  spSecret              = data.azurerm_key_vault_secret.spSecret.value
  spApplicationId       = data.azurerm_key_vault_secret.spApplicationId.value
  tenantId              = data.azurerm_key_vault_secret.tenantId.value
  arrayFilePath         = "${path.module}/scripts/array.csv"

  depends_on = [module.createRgForSSLAworksapceandAutomationAccount]
}
