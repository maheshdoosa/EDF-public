locals {
  #  subId = data.azurerm_key_vault_secret.subscriptionId.value
  ################## Access Policies for Azure AD group and Azure AD ###########
  access_policies = {
    mycustom01 = {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = var.aad_user15_01
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
    },
    mycustom02 = {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = var.aad_user15_02
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
    }
  }
  #### Diagnostic setting configuration to AVM using imported AKV

  ## diagnostic log configurations to LAW

  _kv_id = data.azurerm_key_vault.hs-mgmt-kvs[*].id
  kv_id  = { for id in local._kv_id : id => id }

  _kv_id_15 = data.azurerm_key_vault.hs-mgmt-kvs15[*].id
  kv_id_15  = { for id in local._kv_id_15 : id => id }

  _kv_id_17 = data.azurerm_key_vault.hs-mgmt-kvs17[*].id
  kv_id_17  = { for id in local._kv_id_17 : id => id }

  _kv_id_18 = data.azurerm_key_vault.hs-mgmt-kvs18[*].id
  kv_id_18  = { for id in local._kv_id_18 : id => id }

  _kv_id_19 = data.azurerm_key_vault.hs-mgmt-kvs19[*].id
  kv_id_19  = { for id in local._kv_id_19 : id => id }

  diag_settings = {
    akv-hs-law = {
      resource_ids     = local.kv_id
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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
    akv-cent-law = {
      resource_ids     = local.kv_id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 90
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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

  diag_settings15 = {
    akv-hs-law = {
      resource_ids     = local.kv_id_15
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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
    akv-cent-law = {
      resource_ids     = local.kv_id_15
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 90
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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

  diag_settings17 = {
    akv-hs-law = {
      resource_ids     = local.kv_id_17
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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
    akv-cent-law = {
      resource_ids     = local.kv_id_17
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 90
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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

  diag_settings18 = {
    akv-hs-law = {
      resource_ids     = local.kv_id_18
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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
    akv-cent-law = {
      resource_ids     = local.kv_id_18
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 90
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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

  diag_settings19 = {
    akv-hs-law = {
      resource_ids     = local.kv_id_19
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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
    akv-cent-law = {
      resource_ids     = local.kv_id_19
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 90
        }
        },
        {
          category = "AzurePolicyEvaluationDetails"
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

}
