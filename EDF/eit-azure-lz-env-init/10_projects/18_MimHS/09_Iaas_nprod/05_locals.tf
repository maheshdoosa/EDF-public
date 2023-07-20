locals {
  mimhsnpdbvm01PrivateIpAddress = data.azurerm_key_vault_secret.mimhsnpdbvm01PrivateIpAddress.value

  mimhsnpappvm01PrivateIpAddress = data.azurerm_key_vault_secret.mimhsnpappvm01PrivateIpAddress.value

  mimhsnpappvm02PrivateIpAddress = data.azurerm_key_vault_secret.mimhsnpappvm02PrivateIpAddress.value

  storageAccountKey = data.azurerm_key_vault_secret.ScriptsstorageAccountKey.value
  workspaceId       = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey      = data.azurerm_key_vault_secret.laWorkspaceKey.value
  subId             = data.azurerm_client_config.current.subscription_id
  ImageSubIds       = data.azurerm_key_vault_secret.ImageSubIds.value

  KeyVaultURL                   = data.azurerm_key_vault.eitHsmngdAdeKeyVault.vault_uri
  KeyVaultResourceId            = data.azurerm_key_vault.eitHsmngdAdeKeyVault.id
  KekVaultResourceId            = data.azurerm_key_vault.eitHsmngdAdeKeyVault.id
  KeyEncryptionKeyURLMimdbvm01  = data.azurerm_key_vault_secret.mimdbmvm01EncryptKeyURL.value
  KeyEncryptionKeyURLMimappvm01 = data.azurerm_key_vault_secret.mimappmvm01EncryptKeyURL.value
  KeyEncryptionKeyURLMimappvm02 = data.azurerm_key_vault_secret.mimappmvm02EncryptKeyURL.value


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
    "storageAccountName": "${var.scriptsstorageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
    PROTECTED_SETTINGS
  PrepVMsettings           = <<SETTINGS
  {
    "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
    SETTINGS

  IaaSAntiMalware = <<SETTINGS
    {
        "AntimalwareEnabled": true,
        "RealtimeProtectionEnabled": "true",
        "ScheduledScanSettings": {
        "isEnabled": "false",
        "day": "1",
        "time": "180",
        "scanType": "Full"
        },
        "Exclusions": {
        "Extensions": "",
        "Paths": "%allusersprofile%\\NTUser.pol;%systemroot%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb",
        "Processes": ""
        }
      }
    SETTINGS

  EncryptVMsettingsMIMdbvm01 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLMimdbvm01}",
           "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
           "VolumeType": "${var.VolumeType}"
       }
           SETTINGS

  EncryptVMsettingsMIMappvm01 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLMimappvm01}",
           "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
           "VolumeType": "${var.VolumeType}"
       }
           SETTINGS

  EncryptVMsettingsMIMappvm02 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLMimappvm02}",
           "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
           "VolumeType": "${var.VolumeType}"
       }
           SETTINGS
}

########### MIM VM's Backup ########################
locals {
  #subId = data.azurerm_client_config.current.subscription_id

  vm_source_id = {
    source_vm_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.mimdbvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.mimdbvm01name}"
    source_vm_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.mimappvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.mimappvm01name}"
    source_vm_id_03 = "/subscriptions/${local.subId}/resourceGroups/${var.mimappvmRgName}/providers/Microsoft.Compute/virtualMachines/${var.mimappvm02name}"

    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.recovery_services_vault_rgname}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_services_vault_name}/backupPolicies/${var.infraVM_backup_policy_01}"
    backup_policy_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.recovery_services_vault_rgname}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_services_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
  }
}
