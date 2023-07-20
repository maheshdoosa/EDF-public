data "azurerm_monitor_diagnostic_categories" "categories" {
  resource_id = var.target_resource_id
}
resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = "/subscriptions/${var.log_analytics_workspace_subscription_id}/resourceGroups/${var.log_analytics_workspace_resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${var.log_analytics_workspace_name}"
  dynamic "log" {
    iterator = log_category
    for_each = data.azurerm_monitor_diagnostic_categories.categories.logs
    content {
      category = log_category.value
      retention_policy {
        enabled = true
        days    = 0
      }
    }
  }
  dynamic "metric" {
    iterator = metric_category
    for_each = data.azurerm_monitor_diagnostic_categories.categories.metrics
    content {
      category = metric_category.value
      retention_policy {
        enabled = true
        days    = 0
      }
    }
  }
}