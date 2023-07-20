
locals {
  secgovams01PrivateIpAddress  = data.azurerm_key_vault_secret.sssecgov01PrivateIpAddress.value
  secgovams02PrivateIpAddress  = data.azurerm_key_vault_secret.sssecgov02PrivateIpAddress.value
  secgovams03PrivateIpAddress  = data.azurerm_key_vault_secret.sssecgov03PrivateIpAddress.value
  storageAccountKey            = data.azurerm_key_vault_secret.storageAccountKey.value
  workspaceId                  = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                 = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                  = data.azurerm_key_vault.kvmanagedSsKeyVault.vault_uri
  KeyVaultResourceId           = data.azurerm_key_vault.kvmanagedSsKeyVault.id
  KekVaultResourceId           = data.azurerm_key_vault.kvmanagedSsKeyVault.id
  KeyEncryptionKeyURLssecgov01 = data.azurerm_key_vault_secret.ssecgov01EncryptKeyURL.value
  KeyEncryptionKeyURLssecgov02 = data.azurerm_key_vault_secret.ssecgov02EncryptKeyURL.value
  # Enabled vm backup
  subId = data.azurerm_client_config.current.subscription_id
  vm_source_id = {
    source_vm_id        = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagedSssecgovRgName}/providers/Microsoft.Compute/virtualMachines/${var.eamvmName}"
    source_vm2_id       = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagedSssecgovRgName}/providers/Microsoft.Compute/virtualMachines/${var.eamvmName02}"
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
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLssecgov01}",
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
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLssecgov02}",
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
  PrepVMsettings           = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
  SETTINGS

  #diskattach01  = {
  #       manged_disk_id = data.azurerm_managed_disk.Tenable_data_disk-01.id
  #       lun_number     = var.disk_lun_01
  #       vm_id          = data.azurerm_virtual_machine.tenable_vm.id
  #   }

}
