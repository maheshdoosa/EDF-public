locals {
  ApexHsprdvm01PrivateIpAddress = data.azurerm_key_vault_secret.ApexHsprdvm01PrivateIpAddress.value
  ApexHsprdvm02PrivateIpAddress = data.azurerm_key_vault_secret.ApexHsprdvm02PrivateIpAddress.value

  storageAccountKey = data.azurerm_key_vault_secret.ScriptsstorageAccountKey.value
  workspaceId       = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey      = data.azurerm_key_vault_secret.laWorkspaceKey.value

  subId = data.azurerm_client_config.current.subscription_id

  LAsettings           = <<SETTINGS
  {
    "workspaceId": "${local.workspaceId}"
  }
  SETTINGS
  LAprotected_settings = <<PROTECTED_SETTINGS
  {
    "workspaceKey": "${local.workspaceKey}"
  }
  PROTECTED_SETTINGS

  PrepLinuxVMprotected_settings = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh domainjoin.sh ${local.domain} ouPath='${var.ouPath}' ${local.user} ${local.password} ${var.adAdminGroup} ${local.nameserverip} ${local.dNSHostName} ${local.dchostname}",
    "storageAccountName": "${var.scriptsstorageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS
  PrepLinuxVMsettings           = <<SETTINGS
   {
       "fileUris": ["${var.DomainJoinFilePath}"]
   }
   SETTINGS

  domain       = data.azurerm_key_vault_secret.adDomainName.value
  user         = data.azurerm_key_vault_secret.adAdminUser.value
  password     = data.azurerm_key_vault_secret.adAdminPassword.value
  nameserverip = data.azurerm_key_vault_secret.nameserverip.value
  dNSHostName  = data.azurerm_key_vault_secret.dNSHostName.value
  dchostname   = data.azurerm_key_vault_secret.dchostname.value

  vm_source_id = {
    source_vm01_id      = "/subscriptions/${local.subId}/resourceGroups/${var.ApexHsprdvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.ApexHsprdvm01Name}"
    source_vm02_id      = "/subscriptions/${local.subId}/resourceGroups/${var.ApexHsprdvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.ApexHsprdvm02Name}"
    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_01}"
    backup_policy_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
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
