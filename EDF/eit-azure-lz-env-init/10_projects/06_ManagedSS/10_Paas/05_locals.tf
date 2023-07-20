locals {
  subId            = data.azurerm_key_vault_secret.subscriptionId.value
  source_vm_id     = "/subscriptions/${local.subId}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vmName}"
  backup_policy_id = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
}
