locals {
  access_policies = {

    mycustom01 = {

      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      key_permissions         = ["get", "list"]
      secret_permissions      = ["get", "list"]
      certificate_permissions = []
      storage_permissions     = []
    }
  }

  diag_settings = {

    "Dev-rsv-diagnostics-hs-CentralAudit" = {
      resource_ids     = module.ApexHS_recovery_vault.recovery_services_vault.id
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
        } },
        {
          category = var.category3
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category4
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category5
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category6
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          } }, {
          category = var.category7
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category8
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category9
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category10
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          } }, {
          category = var.category11
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category12
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category13
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } },
        {
          category = var.category14
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } }

      ]
      diagnostic_metrics = [
        {
          category = var.category15 #"AllMetrics"
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
      }]
    },
    "Dev-rsv-diagnostics-mgmt-LogWorkSpace" = {
      resource_ids     = module.ApexHS_recovery_vault.recovery_services_vault.id
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
        } },
        {
          category = var.category3
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category4
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category5
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category6
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          } }, {
          category = var.category7
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category8
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category9
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category10
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          } }, {
          category = var.category11
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category12
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category13
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } },
        {
          category = var.category14
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } }

      ]
      diagnostic_metrics = [
        {
          category = var.category15 #"AllMetrics"
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
      }]
    },
    "keyVault-diagnostics-CentralAudit01" = {
      resource_ids     = data.azurerm_key_vault.ApexHsPrdkeyvault.id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log = [{
        category = var.category20
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        } },
        {
          category = var.category21
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
        } }

      ]
      diagnostic_metrics = [
        {
          category = var.category22 #"AllMetrics"
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
      }]
    },
    "keyVault-diagnostics-LogWorkSpace01" = {
      resource_ids     = data.azurerm_key_vault.ApexHsPrdkeyvault.id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log = [{
        category = var.category20
        enabled  = var.categoryenabledfalse
        retention_policy = {
          enabled = var.retention_policy_enabled_false
          days    = var.retention_policydays
        } },
        {
          category = var.category21
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
        } }

      ]
      diagnostic_metrics = [
        {
          category = var.category22 #"AllMetrics"
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
      }]
    }
  }
}

locals {
  ## diagnostic settings configuration to Storage account
  sa_diag_settings = {
    "auxScriptssa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxScriptssa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [{
        category = var.category19
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "auxScriptssa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxScriptssa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category19
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
    "vmlogssa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmlogssa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [{
        category = var.category19
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "vmlogssa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmlogssa.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category19
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
    "avmsatst-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsatst.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [{
        category = var.category19
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "avmsatst-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsatst.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category19
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
    }
    "avmsanp-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsanp.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledfalse
          retention_policy = {
            enabled = var.retention_policy_enabled_false
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [{
        category = var.category19
        enabled  = var.categoryenabledtrue
        retention_policy = {
          enabled = var.retention_policy_enabled_true
          days    = var.retention_policydays
        }
        }
      ]
    }
    "avmsanp-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsanp.id}/blobServices/default/"
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log = [
        {
          category = var.category16
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category17
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        },
        {
          category = var.category18
          enabled  = var.categoryenabledtrue
          retention_policy = {
            enabled = var.retention_policy_enabled_true
            days    = var.retention_policydays
          }
        }
      ]
      diagnostic_metrics = [
        {
          category = var.category19
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
