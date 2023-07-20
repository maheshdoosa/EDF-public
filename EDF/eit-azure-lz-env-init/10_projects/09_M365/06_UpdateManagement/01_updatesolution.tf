################ Resource Group - LA Worksapce, Automation account #############

module "createRgForM365LAworksapceandAutomationAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.updateManagmentRgName
  resourceLocation  = var.updateManagmentRgLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Create Log Analytics workspace for M365 ####################

#### We have removed below resource from terraform code and Azure portal as part of user story(AZT-3228) implemetation

/*module "createM365LogAnalyticsWorksapce" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-log-analytics-workspace-latest"

  laWorkspaceName         = var.laWorkspacename
  resourceLocation        = var.updateManagmentRgLocation
  resourceGroupName       = var.updateManagmentRgName
  logAnalyticworkspaceSku = "PerGB2018" //value is static acoss the environments

  depends_on = [module.createRgForM365LAworksapceandAutomationAccount]
}*/

######################## Create Automation Account for Update managment###################

module "createM365UpdateManagementAutomationAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-automation-account-latest?ref=v1.1.19"

  resourceGroupName         = var.updateManagmentRgName
  automationAccountLocation = var.updateManagmentRgLocation
  automationAccountName     = var.automationAccountName
  automationAccountSku      = var.automationAccountSku //"basic"

  depends_on = [module.createRgForM365LAworksapceandAutomationAccount]
}

############### Link automation account to a Log Analytics Workspace ###########

# We have removed below resource from terraform code and Azure portal as part of user story(AZT-3228) implemetation

/*module "createM365LawLinkService" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-law-linked-service"

  laWorkspaceRgName         = var.updateManagmentRgName
  logAnalyticsWorkspaceName = var.laWorkspacename
  automationAccountId       = data.azurerm_automation_account.automationAccount.id

  depends_on = [module.createRgForM365LAworksapceandAutomationAccount, module.createM365LogAnalyticsWorksapce]

}*/
