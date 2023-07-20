locals {
  ## diagnostic settings configuration to Storage account
  sa_diag_settings = {
    "avmsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
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
        }
      ]
      diagnostic_metrics = [{
        category = var.category4
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "avmsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
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
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category4
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
    "lawsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.lawsa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
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
        }
      ]
      diagnostic_metrics = [{
        category = var.category4
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "lawsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.lawsa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
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
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category4
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
    "jboxsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.jboxsa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
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
        }
      ]
      diagnostic_metrics = [{
        category = var.category4
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "jboxsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.jboxsa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
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
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category4
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
    "devwssa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.devwssa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
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
        }
      ]
      diagnostic_metrics = [{
        category = var.category4
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "devwssa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.devwssa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
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
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category4
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
  }
}
