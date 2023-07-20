locals {
  workspaceId  = data.azurerm_log_analytics_workspace.laWorksapce.workspace_id
  workspaceKey = data.azurerm_log_analytics_workspace.laWorksapce.primary_shared_key

  LAsettings           = <<SETTINGS
        {
          "workspaceId": "${local.workspaceId}"
        }
  SETTINGS
  LAprotected_settings = <<PROTECTED_SETTINGS
        {
          "workspaceKey": "${local.workspaceKey}"
        }
  PROTECTED_SETTINGS
}
