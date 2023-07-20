data "azurerm_log_analytics_workspace" "cenAuditLaWorksapce" {
  name                = var.laWorkspaceName
  resource_group_name = var.cenAuditLaRgName

  depends_on = [module.createSSLogAnalyticsWorksapce]
}

data "azurerm_storage_account" "bootDiagLogStorageAccountName" {
  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
