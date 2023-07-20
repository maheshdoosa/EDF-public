locals {
  businessUnit  = "Generation"
  majorFunction = "Data Strategy"
  costCentre    = "2-E292-A0-MA-01-AAE"
  projectCode   = "2-E292"
  category      = "Infrastructure"
  serviceLevel  = "Bronze"
  owner         = "gordon.steven@edf-energy.com"
  support       = "CloudServices@edfenergy.com"
}

########## Diag SettingS ###############
locals {
  diag_settings = {
    "dev-vnet-diag-setting_logs" = {
      resource_ids     = data.azurerm_virtual_network.datastrgyhs_vnet01.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category2
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
    },
    "dev-vnet-diag-setting_metrics" = {
      resource_ids     = data.azurerm_virtual_network.datastrgyhs_vnet01.id
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category2
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
    },
    "tst-vnet-diag-setting_logs" = {
      resource_ids     = data.azurerm_virtual_network.datastrgyhs_vnet02.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category2
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
    },
    "tst-vnet-diag-setting_metrics" = {
      resource_ids     = data.azurerm_virtual_network.datastrgyhs_vnet02.id
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category2
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
    }
  }
}
