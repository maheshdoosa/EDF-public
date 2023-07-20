locals {
  pkiEaRootPrivateIpAddress   = data.azurerm_key_vault_secret.pkiEaRootPrivateIpAddress.value
  pkiCa01PrivateIpAddress     = data.azurerm_key_vault_secret.pkiCA01PrivateIpAddress.value
  pkiCa02PrivateIpAddress     = data.azurerm_key_vault_secret.pkiCA02PrivateIpAddress.value
  pkiWebPki01PrivateIpAddress = data.azurerm_key_vault_secret.webpki01PrivateIpAddress.value
  pkiWebPki02PrivateIpAddress = data.azurerm_key_vault_secret.webpki02PrivateIpAddress.value
  pkiintLbPrivateIpAddress    = data.azurerm_key_vault_secret.intLbPrivateIpAddress.value
  AFS01PrivateIpAddress       = data.azurerm_key_vault_secret.AFS01PrivateIpAddress.value
  dc03PrivateIpAddress        = data.azurerm_key_vault_secret.dc03PrivateIpAddress.value
  dc04PrivateIpAddress        = data.azurerm_key_vault_secret.dc04PrivateIpAddress.value
  storageAccountKey           = data.azurerm_key_vault_secret.storageAccountKey.value
  wac01PrivateIpAddress       = data.azurerm_key_vault_secret.wac01PrivateIpAddress.value
  wac02PrivateIpAddress       = data.azurerm_key_vault_secret.wac02PrivateIpAddress.value
  wacintLbPrivateIpAddress    = data.azurerm_key_vault_secret.wacLbPrivateIpAddress.value
  warpsmid01PrivateIpAddress  = data.azurerm_key_vault_secret.warpsmid01PrivateIpAddress.value
  KeyVaultURL                 = data.azurerm_key_vault.kvmanagementSsKeyVault.vault_uri
  KeyVaultResourceId          = data.azurerm_key_vault.kvmanagementSsKeyVault.id
  KekVaultResourceId          = data.azurerm_key_vault.kvmanagementSsKeyVault.id
  KeyEncryptionKeyURLscaweb01 = data.azurerm_key_vault_secret.scaweb01EncryptKeyURL.value
  KeyEncryptionKeyURLscaweb02 = data.azurerm_key_vault_secret.scaweb02EncryptKeyURL.value
  KeyEncryptionKeyURLsica01   = data.azurerm_key_vault_secret.sica01EncryptKeyURL.value
  KeyEncryptionKeyURLsica02   = data.azurerm_key_vault_secret.sica02EncryptKeyURL.value
  KeyEncryptionKeyURLsrca01   = data.azurerm_key_vault_secret.srca01EncryptKeyURL.value
  KeyEncryptionKeyURLswac01   = data.azurerm_key_vault_secret.swac01EncryptKeyURL.value
  KeyEncryptionKeyURLswac02   = data.azurerm_key_vault_secret.swac02EncryptKeyURL.value
  KeyEncryptionKeyURLsmid01   = data.azurerm_key_vault_secret.smid01EncryptKeyURL.value
  KeyEncryptionKeyURLsafs01   = data.azurerm_key_vault_secret.afs01EncryptKeyURL.value

  KeyEncryptionKeyURLdc03 = data.azurerm_key_vault_secret.dc03EncryptKeyURL.value

  KeyEncryptionKeyURLdc04 = data.azurerm_key_vault_secret.dc04EncryptKeyURL.value
  workspaceId             = data.azurerm_log_analytics_workspace.laWorksapce.workspace_id
  workspaceKey            = data.azurerm_log_analytics_workspace.laWorksapce.primary_shared_key

  LAsettings                = <<SETTINGS
        {
          "workspaceId": "${local.workspaceId}"
        }
  SETTINGS
  LAprotected_settings      = <<PROTECTED_SETTINGS
        {
          "workspaceKey": "${local.workspaceKey}"
        }
  PROTECTED_SETTINGS
  EncryptVMsettingsscaweb01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLscaweb01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingsscaweb02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLscaweb02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingssica01   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsica01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingssica02   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsica02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingssrca01   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsrca01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingsswac01   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLswac01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingsswac02   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLswac02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingssmid01   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsmid01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingsafs01    = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsafs01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  PrepVMprotected_settings  = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS

  PrepVMsettings = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
  SETTINGS


  #####################ADDS Resources##########################

  IaaSAntiMalwareDC = <<SETTINGS
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
        "Paths": "%allusersprofile%\\NTUser.pol;%windir%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb;F:\\ntds\\ntds.dit;F:\\ntds\\EDB*.log;F:\\ntds\\Edbres*.jrs;F:\\ntds\\EDB.chk;F:\\ntds\\TEMP.edb;F:\\ntds\\*.pat;F:\\SYSVOL\\staging;F:\\SYSVOL\\staging areas;F:\\SYSVOL\\sysvol;%windir%\\System32\\Dns\\*.log;%windir%\\System32\\Dns\\*.dns;%windir%\\System32\\Dns\\boot",
        "Processes": "%windir%\\System32\\ntfrs.exe;%windir%\\System32\\dfsr.exe;%windir%\\System32\\dfsrs.exe"
        }
      }
  SETTINGS

  EncryptVMsettingsdc03 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLdc03}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS


  EncryptVMsettingsdc04 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLdc04}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS

  PrepVMprotected_settingsforAD = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepVMForAD.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS

  PrepVMsettingsforAD = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePathforAD}"]
  }
  SETTINGS

  subId = data.azurerm_client_config.current.subscription_id

  additionaladvmIdDc03 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementss_adds_resource_group}/providers/Microsoft.Compute/virtualMachines/${var.dc03vmName}"
  additionaladvmIdDc04 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementss_adds_resource_group}/providers/Microsoft.Compute/virtualMachines/${var.dc04vmName}"

  vm_source_id = {
    source_vm_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementss_adds_resource_group}/providers/Microsoft.Compute/virtualMachines/${var.dc03vmName}"
    source_vm_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementss_adds_resource_group}/providers/Microsoft.Compute/virtualMachines/${var.dc04vmName}"

    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.recovery_services_vault_rgname}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_services_vault_name}/backupPolicies/${var.infraVM_backup_policy_01}"
    backup_policy_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.recovery_services_vault_rgname}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_services_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
  }


}
