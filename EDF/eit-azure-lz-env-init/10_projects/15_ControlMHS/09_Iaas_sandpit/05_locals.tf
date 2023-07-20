locals {
  ControlMHssandvm01PrivateIpAddress = data.azurerm_key_vault_secret.ControlMHssandvm01PrivateIpAddress.value

  storageAccountKey = data.azurerm_key_vault_secret.ScriptsstorageAccountKey.value
  workspaceId       = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey      = data.azurerm_key_vault_secret.laWorkspaceKey.value
  subId             = data.azurerm_client_config.current.subscription_id

  KeyVaultURL                  = data.azurerm_key_vault.HsAdeKeyVault.vault_uri
  KeyVaultResourceId           = data.azurerm_key_vault.HsAdeKeyVault.id
  KekVaultResourceId           = data.azurerm_key_vault.HsAdeKeyVault.id
  KeyEncryptionKeyURLctrlmvm01 = data.azurerm_key_vault_secret.ctrlmvm01EncryptKeyURL.value

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

  PrepLinuxVMsettings = <<SETTINGS
   {
       "fileUris": ["${var.DomainJoinFilePath}"]
   }
   SETTINGS

  PrepLinuxVMprotected_settings = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh updated_domainjoin_rhel.sh  ${local.domain} ${local.user} ${local.password} ${local.nameserveripvm1} ${local.nameserveripvm2} ${local.dNSHostNamevm1} ${local.dNSHostNamevm2} ${local.dchostnamevm1} ${local.dchostnamevm2} ${var.adAdminGroup} ${var.adAdminGroup2} ${var.hostname}",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey" : "${local.storageAccountKey}"
  }
PROTECTED_SETTINGS

  EncryptVMsettingsctrlmsandvm01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLctrlmvm01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS

  domain          = data.azurerm_key_vault_secret.adDomainName.value
  user            = data.azurerm_key_vault_secret.adAdminUser.value
  password        = data.azurerm_key_vault_secret.adAdminPassword.value
  nameserveripvm1 = data.azurerm_key_vault_secret.nameserverip1.value
  nameserveripvm2 = data.azurerm_key_vault_secret.nameserverip2.value
  dNSHostNamevm1  = data.azurerm_key_vault_secret.dNSHostName1.value
  dNSHostNamevm2  = data.azurerm_key_vault_secret.dNSHostName2.value
  dchostnamevm1   = data.azurerm_key_vault_secret.dchostname1.value
  dchostnamevm2   = data.azurerm_key_vault_secret.dchostname2.value

  vm_source_id = {
    source_vm01_id      = "/subscriptions/${local.subId}/resourceGroups/${var.ControlMHssandvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.ControlMHssandvm01Name}"
    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
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
