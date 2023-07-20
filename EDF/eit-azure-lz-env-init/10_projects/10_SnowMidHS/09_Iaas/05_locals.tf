
locals {
  secgovams01PrivateIpAddress  = data.azurerm_key_vault_secret.hssecgov01PrivateIpAddress.value
  secgovams02PrivateIpAddress  = data.azurerm_key_vault_secret.hssecgov02PrivateIpAddress.value
  secgovams03PrivateIpAddress  = data.azurerm_key_vault_secret.sssecgov03PrivateIpAddress.value
  storageAccountKey            = data.azurerm_key_vault_secret.storageAccountKey.value
  workspaceId                  = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                 = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                  = data.azurerm_key_vault.kvmanagedHsKeyVault.vault_uri
  KeyVaultResourceId           = data.azurerm_key_vault.kvmanagedHsKeyVault.id
  KekVaultResourceId           = data.azurerm_key_vault.kvmanagedHsKeyVault.id
  KeyEncryptionKeyURLhsecgov01 = data.azurerm_key_vault_secret.hsecgov01EncryptKeyURL.value
  KeyEncryptionKeyURLhsecgov02 = data.azurerm_key_vault_secret.hsecgov02EncryptKeyURL.value
  # Enabled vm backup
  subId = data.azurerm_client_config.current.subscription_id
  vm_source_id = {
    source_vm_id        = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagedHssecgovRgName}/providers/Microsoft.Compute/virtualMachines/${var.eamvmName}"
    source_vm2_id       = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagedHssecgovRgName}/providers/Microsoft.Compute/virtualMachines/${var.eamvmName02}"
    source_vm3_id       = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagedHssecgovtenableRgName}/providers/Microsoft.Compute/virtualMachines/${var.tenablevmname}"
    backup_policy_id    = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
    backup_policy_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
  }
  LAsettings             = <<SETTINGS
  {
    "workspaceId": "${local.workspaceId}"
  }
  SETTINGS
  LAprotected_settings   = <<PROTECTED_SETTINGS
  {
    "workspaceKey": "${local.workspaceKey}"
  }
  PROTECTED_SETTINGS
  EncryptVMsettingsams01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLhsecgov01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingsams02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLhsecgov02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS

  PrepVMprotected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS
  # PrepVMsettings           = <<SETTINGS
  # {
  #     "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}"]
  # }
  # SETTINGS
  PrepVMsettings = <<SETTINGS
  {
    "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
  SETTINGS
  nic_fetch      = { for nic in var.diagsettingnic : nic.nicname => nic.rg }
  _nic_id        = [for nic in data.azurerm_network_interface.nicid : nic.id]
  nic_id         = { for id in local._nic_id : id => id }
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
