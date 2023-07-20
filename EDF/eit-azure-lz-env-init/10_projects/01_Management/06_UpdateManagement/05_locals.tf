locals {
  dnszoneid                     = data.azurerm_key_vault_secret.dnszoneid.value
  privateStaticIpAddress        = data.azurerm_key_vault_secret.wsusPrivateStaticIpAddress.value
  subId                         = data.azurerm_key_vault_secret.spokeSubscriptionId.value
  laAzMonitorPrivateLinkScopeId = "/subscriptions/${local.subId}/resourceGroups/${var.updateManagmentRgName}/providers/microsoft.insights/privateLinkScopes/${var.laPrivateServiceConnName}"
  #  aacAzMonitorPrivateLinkScopeId = "/subscriptions/${local.subId}/resourceGroups/${var.updateManagmentRgName}/providers/Microsoft.Automation/automationAccounts/${var.aacPrivateServiceConnName}"
  storageAccountKey        = data.azurerm_key_vault_secret.storageAccountKey.value
  PrepVMprotected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS

  PrepVMsettings = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
  SETTINGS
  ## diagnostic log configurations to LAW

  diag_settings = {
    "hs-law" = {
      resource_ids     = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "Audit"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
        }
      ]
      diagnostic_metrics = [
        {
          category = "AllMetrics"
          enabled  = true
          retention_policy = {
            enabled = true
            days    = 90
          }
      }]
    }
    "cent-law" = {
      resource_ids     = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "Audit"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 90
        }
        }
      ]
      diagnostic_metrics = [
        {
          category = "AllMetrics"
          enabled  = false
          retention_policy = {
            enabled = false
            days    = 0
          }
      }]
    }
  }
  ## diagnostic log configurations to AAC

  aacdiag_settings = {
    "aac-hs-law" = {
      resource_ids     = data.azurerm_automation_account.automationAccount.id
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [
        {
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
        },
        {
          category = var.category4
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [{
        category = var.category5
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "aac-cent-law" = {
      resource_ids     = data.azurerm_automation_account.automationAccount.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [
        {
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
        },
        {
          category = var.category4
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category5
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
      }]
    }
  }
  nic_fetch = { for nic in var.diagsettingnic : nic.nicname => nic.rg }
  _nic_id   = [for nic in data.azurerm_network_interface.nicid : nic.id]
  nic_id    = { for id in local._nic_id : id => id }
  diag_settings_nic = {
    Diag-Setting-Mgmt-HS-law = {
      resource_ids     = local.nic_id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log   = []
      diagnostic_metrics = [
        {
          category = "AllMetrics"
          enabled  = true
          retention_policy = {
            enabled = true
            days    = 90
          }
      }]
    }
  }
}
