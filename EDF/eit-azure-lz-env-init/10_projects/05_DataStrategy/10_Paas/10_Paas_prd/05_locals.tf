locals {
  #  subId = data.azurerm_key_vault_secret.subscriptionId.value

  ################## Access Policies for Azure AD group and Azure AD ###########
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
  access_policies_Uat = {

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

    "ProdMDW-rsv-diagnostics-hs-CentralAudit" = {
      resource_ids     = module.create-MDWHs-Prd-RSV.recovery_services_vault.id
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
    "ProdMDW-rsv-diagnostics-mgmt-LogWorkSpace" = {
      resource_ids     = module.create-MDWHs-Prd-RSV.recovery_services_vault.id
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
    "UatMDW-rsv-diagnostics-hs-CentralAudit" = {
      resource_ids     = module.create-MDWHs-Uat-RSV.recovery_services_vault.id
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
    "UatMDW-rsv-diagnostics-mgmt-LogWorkSpace" = {
      resource_ids     = module.create-MDWHs-Uat-RSV.recovery_services_vault.id
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
    }
  }

}
locals {
  ## diagnostic settings configuration to Storage account
  sa_diag_settings = {
    "vmdiaguatsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmDiagUatSA.id}/blobServices/default/"
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
    "vmdiaguatsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmDiagUatSA.id}/blobServices/default/"
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
    "vmdiagprdsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmdiagprdsa.id}/blobServices/default/"
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
    "vmdiagprdsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmdiagprdsa.id}/blobServices/default/"
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
    "avmsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsa.id}/blobServices/default/"
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
    "avmsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.avmsa.id}/blobServices/default/"
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
    "auxsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxScriptsSA.id}/blobServices/default/"
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
    "auxsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxScriptsSA.id}/blobServices/default/"
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
    },
    "keyVault-diagnostics-CentralAudit01" = {
      resource_ids     = data.azurerm_key_vault.MDWHsPrdkeyvault.id
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
      resource_ids     = data.azurerm_key_vault.MDWHsPrdkeyvault.id
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
