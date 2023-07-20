locals {
  f5Vm1mgmtIpAddress      = data.azurerm_key_vault_secret.f5Vm1mgmtIpAddress.value
  f5Vm1internalIpAddress  = data.azurerm_key_vault_secret.f5Vm1internalIpAddress.value
  f5Vm1externalIpAddress1 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress1.value
  f5Vm1externalIpAddress2 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress2.value
  f5Vm1externalIpAddress3 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress3.value
  #f5Vm1externalIpAddress4  = data.azurerm_key_vault_secret.f5Vm1externalIpAddress4.value
  #f5Vm1externalIpAddress5  = data.azurerm_key_vault_secret.f5Vm1externalIpAddress5.value
  #f5Vm1externalIpAddress6  = data.azurerm_key_vault_secret.f5Vm1externalIpAddress6.value
  #f5Vm1externalIpAddress7  = data.azurerm_key_vault_secret.f5Vm1externalIpAddress7.value
  #f5Vm1externalIpAddress8  = data.azurerm_key_vault_secret.f5Vm1externalIpAddress8.value
  #f5Vm1externalIpAddress9  = data.azurerm_key_vault_secret.f5Vm1externalIpAddress9.value
  #f5Vm1externalIpAddress10 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress10.value
  #f5Vm1externalIpAddress11 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress11.value
  #f5Vm1externalIpAddress12 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress12.value
  #f5Vm1externalIpAddress13 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress13.value
  #f5Vm1externalIpAddress14 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress14.value
  #f5Vm1externalIpAddress15 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress15.value
  #f5Vm1externalIpAddress16 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress16.value
  #f5Vm1externalIpAddress17 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress17.value
  #f5Vm1externalIpAddress18 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress18.value
  #f5Vm1externalIpAddress19 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress19.value
  #f5Vm1externalIpAddress20 = data.azurerm_key_vault_secret.f5Vm1externalIpAddress20.value



  f5Vm2mgmtIpAddress      = data.azurerm_key_vault_secret.f5Vm2mgmtIpAddress.value
  f5Vm2internalIpAddress  = data.azurerm_key_vault_secret.f5Vm2internalIpAddress.value
  f5Vm2externalIpAddress1 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress1.value
  f5Vm2externalIpAddress2 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress2.value
  f5Vm2externalIpAddress3 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress3.value
  #f5Vm2externalIpAddress4  = data.azurerm_key_vault_secret.f5Vm2externalIpAddress4.value
  #f5Vm2externalIpAddress5  = data.azurerm_key_vault_secret.f5Vm2externalIpAddress5.value
  #f5Vm2externalIpAddress6  = data.azurerm_key_vault_secret.f5Vm2externalIpAddress6.value
  #f5Vm2externalIpAddress7  = data.azurerm_key_vault_secret.f5Vm2externalIpAddress7.value
  #f5Vm2externalIpAddress8  = data.azurerm_key_vault_secret.f5Vm2externalIpAddress8.value
  #f5Vm2externalIpAddress9  = data.azurerm_key_vault_secret.f5Vm2externalIpAddress9.value
  #f5Vm2externalIpAddress10 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress10.value
  #f5Vm2externalIpAddress11 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress11.value
  #f5Vm2externalIpAddress12 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress12.value
  #f5Vm2externalIpAddress13 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress13.value
  #f5Vm2externalIpAddress14 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress14.value
  #f5Vm2externalIpAddress15 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress15.value
  #f5Vm2externalIpAddress16 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress16.value
  #f5Vm2externalIpAddress17 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress17.value
  #f5Vm2externalIpAddress18 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress18.value
  #f5Vm2externalIpAddress19 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress19.value
  #f5Vm2externalIpAddress20 = data.azurerm_key_vault_secret.f5Vm2externalIpAddress20.value

  f5InternalLbPrivateIpAddress = data.azurerm_key_vault_secret.f5InternalLbPrivateIpAddress.value

}

###################### Enabling F5 VM Backup #################

locals {

  subId = data.azurerm_client_config.current.subscription_id

  vm_source_id = {

    source_vm_id     = "/subscriptions/${local.subId}/resourceGroups/${var.vm_resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vmname_1}"
    source_vm2_id    = "/subscriptions/${local.subId}/resourceGroups/${var.vm_resource_group_name}/providers/Microsoft.Compute/virtualMachines/${var.vmname_2}"
    backup_policy_id = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
  }
}
