data "azurerm_automation_account" "automationAccount" {
  name                = var.automationAccountName
  resource_group_name = var.updateManagmentRgName

  depends_on = [module.createM365UpdateManagementAutomationAccount]
}
