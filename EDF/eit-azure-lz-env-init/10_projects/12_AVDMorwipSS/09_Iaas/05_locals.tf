
locals {
  AVDav01PrivateIpAddress = data.azurerm_key_vault_secret.AVDav01PrivateIpAddress.value
  AVD02PrivateIpAddress   = data.azurerm_key_vault_secret.AVD02PrivateIpAddress.value

  AVDSccm01PrivateIpAddress = data.azurerm_key_vault_secret.AVDSccm01PrivateIpAddress.value
  AVDSccm02PrivateIpAddress = data.azurerm_key_vault_secret.AVDSccm02PrivateIpAddress.value

  AVDadds01PrivateIpAddress = data.azurerm_key_vault_secret.AVDadds01PrivateIpAddress.value
  AVDadds02PrivateIpAddress = data.azurerm_key_vault_secret.AVDadds02PrivateIpAddress.value

  storageAccountKey           = data.azurerm_key_vault_secret.storageAccountKey.value
  workspaceId                 = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                 = data.azurerm_key_vault.avd-ade-kvt.vault_uri
  KeyVaultResourceId          = data.azurerm_key_vault.avd-ade-kvt.id
  KekVaultResourceId          = data.azurerm_key_vault.avd-ade-kvt.id
  KeyEncryptionKeyURLsavdav01 = data.azurerm_key_vault_secret.avdav01EncryptKeyURL.value
  KeyEncryptionKeyURLsavdav02 = data.azurerm_key_vault_secret.avdav02EncryptKeyURL.value

  KeyEncryptionKeyURLsavdSccm01 = data.azurerm_key_vault_secret.avdSccm01EncryptKeyURL.value
  KeyEncryptionKeyURLsavdSccm02 = data.azurerm_key_vault_secret.avdSccm02EncryptKeyURL.value

  KeyEncryptionKeyURLsavdadds01 = data.azurerm_key_vault_secret.avdadds01EncryptKeyURL.value
  KeyEncryptionKeyURLsavdadds02 = data.azurerm_key_vault_secret.avdadds02EncryptKeyURL.value

}

########################## AVD VM LA and Excryption #########################
locals {

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

  PrepVMprotected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS
  PrepVMsettings           = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}"]
  }
  SETTINGS

  EncryptVMsettingsAVDav01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsavdav01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsAVDav02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsavdav02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsAVDSccm01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsavdSccm01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsAVDSccm02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsavdSccm02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsAVDadds01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsavdadds01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsAVDadds02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsavdadds02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS
}

############# backup ######################


locals {

  subId = data.azurerm_client_config.current.subscription_id

  vm_source_id = {
    source_av_id01   = "/subscriptions/${local.subId}/resourceGroups/${var.lzAVDavVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.lzAVDav01Vm}"
    source_av_id02   = "/subscriptions/${local.subId}/resourceGroups/${var.lzAVDavVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.lzAVDav02Vm}"
    source_sccm_id01 = "/subscriptions/${local.subId}/resourceGroups/${var.lzAVDSccmVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.lzAVDSccm01Vm}"
    source_sccm_id02 = "/subscriptions/${local.subId}/resourceGroups/${var.lzAVDSccmVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.lzAVDSccm02Vm}"
    source_adds_id01 = "/subscriptions/${local.subId}/resourceGroups/${var.lzAVDaddsVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.lzAVDadds01Vm}"
    source_adds_id02 = "/subscriptions/${local.subId}/resourceGroups/${var.lzAVDaddsVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.lzAVDadds02Vm}"

    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
    backup_policy_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
  }

}

#######################################################
