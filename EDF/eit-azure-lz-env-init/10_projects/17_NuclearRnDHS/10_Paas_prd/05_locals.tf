locals {
  hpbdvdSQLLinkScopeId = "/subscriptions/${local.subId}/resourceGroups/${var.hpbdvdbprodRgName}/providers/Microsoft.DBforPostgreSQL/servers/${var.hpbdvdbprodServerName}"
  subId                = data.azurerm_key_vault_secret.hpbdvdbprodSQLSubscriptionID.value
  diag_settings = {

    "hpbdvdbprodSQL-diagnostics-hs-CentralAudit" = {
      resource_ids     = data.azurerm_postgresql_server.hpbdvdbSqlDBserver.id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category3
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category4 #"AllMetrics"
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
      }]
    },
    "hpbdvdbprodSQL-diagnostics-mgmt-LogWorkSpace" = {
      resource_ids     = data.azurerm_postgresql_server.hpbdvdbSqlDBserver.id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.categoryenabledfalse
        retention_policy = {
          enabled = var.retention_policy_enabled_false
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category3
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category4 #"AllMetrics"
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
      }]
    }
  }
}
