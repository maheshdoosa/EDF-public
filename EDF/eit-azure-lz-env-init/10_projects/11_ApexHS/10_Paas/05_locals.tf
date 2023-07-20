locals {
  #  subId = data.azurerm_key_vault_secret.subscriptionId.value
  ################## Access Policies for Azure AD group and Azure AD ###########
  access_policies = {

    mycustom01 = {

      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
    },
    mycustom02 = {

      tenant_id               = data.azurerm_key_vault_secret.tenantId.value
      object_id               = data.azuread_group.adgroup.object_id
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = []
      storage_permissions     = []
    }
    mycustom03 = {

      tenant_id               = data.azurerm_key_vault_secret.tenantId.value
      object_id               = data.azuread_user.aduser.object_id
      key_permissions         = []
      secret_permissions      = []
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = []
    }

  }

  diag_settings = {

    "UatApex-rsv-diagnostics-hs-CentralAudit" = {
      resource_ids     = module.az-recoveryservicevault.recovery_services_vault.id
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
    "UatApex-rsv-diagnostics-mgmt-LogWorkSpace" = {
      resource_ids     = module.az-recoveryservicevault.recovery_services_vault.id
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
    "Tst-rsv-diagnostics-hs-CentralAudit" = {
      resource_ids     = module.az-recoveryservicevaulttst.recovery_services_vault.id
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
    "Tst-rsv-diagnostics-mgmt-LogWorkSpace" = {
      resource_ids     = module.az-recoveryservicevaulttst.recovery_services_vault.id
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
      resource_ids     = data.azurerm_key_vault.keyvaulttst.id
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
      resource_ids     = data.azurerm_key_vault.keyvaulttst.id
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
    },
    "keyVault-diagnostics-CentralAudit02" = {
      resource_ids     = data.azurerm_key_vault.keyvault.id
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
    "keyVault-diagnostics-LogWorkSpace02" = {
      resource_ids     = data.azurerm_key_vault.keyvault.id
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
    "vmDiagDevsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmDiagDevsa.id}/blobServices/default/"
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
    "vmDiagDevsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmDiagDevsa.id}/blobServices/default/"
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
    "vmDiagtstsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmDiagtstsa.id}/blobServices/default/"
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
    "vmDiagtstsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.vmDiagtstsa.id}/blobServices/default/"
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
    "auxdevsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxdevsa.id}/blobServices/default/"
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
    "auxdevsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxdevsa.id}/blobServices/default/"
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
    "auxtstsa-hs-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxtstsa.id}/blobServices/default/"
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
    "auxtstsa-cent-law" = {
      resource_ids     = "${data.azurerm_storage_account.auxtstsa.id}/blobServices/default/"
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
