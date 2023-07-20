locals {
  emersonams01PrivateIpAddress = data.azurerm_key_vault_secret.emersonams01PrivateIpAddress.value

  EponaVM01PrivateIpAddress = data.azurerm_key_vault_secret.EponaVM01PrivateIpAddress.value

  CominodVM01PrivateIpAddress = data.azurerm_key_vault_secret.CominodVM01PrivateIpAddress.value
  storageAccountKey           = data.azurerm_key_vault_secret.storageAccountKey.value
  workspaceId                 = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                 = data.azurerm_key_vault.kvmanagedSsKeyVault.vault_uri
  KeyVaultResourceId          = data.azurerm_key_vault.kvmanagedSsKeyVault.id
  KekVaultResourceId          = data.azurerm_key_vault.kvmanagedSsKeyVault.id
  KeyEncryptionKeyURLprdams01 = data.azurerm_key_vault_secret.prdams01EncryptKeyURL.value

  KeyEncryptionKeyURLEponaVM01 = data.azurerm_key_vault_secret.EponaVM01EncryptKeyURL.value

  KeyEncryptionKeyURLCominodVM01 = data.azurerm_key_vault_secret.CominodVM01EncryptKeyURL.value


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
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLprdams01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS

  EncryptVMsettingsEponaVM01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLEponaVM01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS

  EncryptVMsettingsCominodVM01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLCominodVM01}",
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

  subId = data.azurerm_client_config.current.subscription_id
  vm_source_id = {
    source_vm_id     = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagedSsEponaRgName}/providers/Microsoft.Compute/virtualMachines/${var.EponaVM01Name}"
    source_vm_id_01  = "/subscriptions/${local.subId}/resourceGroups/${var.CominodvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.CominodVM01Name}"
    backup_policy_id = "/subscriptions/${local.subId}/resourceGroups/${var.RSVRgName}/providers/Microsoft.RecoveryServices/vaults/${var.RSVName}/backupPolicies/${var.infraVM_backup_policy}"
  }
}
