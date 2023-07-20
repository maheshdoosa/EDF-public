locals {
  subId              = data.azurerm_key_vault_secret.subscriptionId.value
  source_vm_id       = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vmName}"
  source_vm2_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vmName2}"
  source_vm3_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_pki}/providers/Microsoft.Compute/virtualMachines/${var.vmName3}"
  source_vm4_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_pki}/providers/Microsoft.Compute/virtualMachines/${var.vmName4}"
  source_vm5_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_pki}/providers/Microsoft.Compute/virtualMachines/${var.vmName5}"
  source_vm6_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_pki}/providers/Microsoft.Compute/virtualMachines/${var.vmName6}"
  source_vm7_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_pki}/providers/Microsoft.Compute/virtualMachines/${var.vmName7}"
  source_vm8_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_wac}/providers/Microsoft.Compute/virtualMachines/${var.vmName8}"
  source_vm9_id      = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_wac}/providers/Microsoft.Compute/virtualMachines/${var.vmName9}"
  source_vm10_id     = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_wsus}/providers/Microsoft.Compute/virtualMachines/${var.vmName10}"
  source_vm11_id     = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_snow}/providers/Microsoft.Compute/virtualMachines/${var.vmName11}"
  source_vm12_id     = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name_afs}/providers/Microsoft.Compute/virtualMachines/${var.vmName12}"
  backup_policy_id   = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
  backup_policy02_id = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"

  access_policies = {
    mycustom01 = {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = var.aad_user01_01
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
    },
    mycustom02 = {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = var.aad_user01_02
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
    }
  }
}
