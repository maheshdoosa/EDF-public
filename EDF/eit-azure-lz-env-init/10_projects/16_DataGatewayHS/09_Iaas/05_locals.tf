
locals {
  dtgwvm01PrivateIpAddress = data.azurerm_key_vault_secret.dtgwvm01PrivateIpAddress.value
  dtgwvm02PrivateIpAddress = data.azurerm_key_vault_secret.dtgwvm02PrivateIpAddress.value

  storageAccountKey           = data.azurerm_key_vault_secret.storageAccountKey.value
  workspaceId                 = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                 = data.azurerm_key_vault.avd-ade-kvt.vault_uri
  KeyVaultResourceId          = data.azurerm_key_vault.avd-ade-kvt.id
  KekVaultResourceId          = data.azurerm_key_vault.avd-ade-kvt.id
  KeyEncryptionKeyURLsavdav01 = data.azurerm_key_vault_key.gukshsdevdtgw01-ade-url.id
  KeyEncryptionKeyURLsavdav02 = data.azurerm_key_vault_key.gukshsdevdtgw02-ade-url.id
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
    "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
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
}

############# backup ######################


locals {

  subId = data.azurerm_client_config.current.subscription_id

  vm_source_id = {
    source_av_id01 = "/subscriptions/${local.subId}/resourceGroups/${var.dtgwVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.dtgw01Vm}"
    source_av_id02 = "/subscriptions/${local.subId}/resourceGroups/${var.dtgwVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.dtgw02Vm}"

    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
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
