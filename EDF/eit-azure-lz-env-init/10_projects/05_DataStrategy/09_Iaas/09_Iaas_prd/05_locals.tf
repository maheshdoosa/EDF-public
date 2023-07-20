locals {
  MDWHsPrdWebVM01PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsPrdWebVM01PrivateIpAddress.value
  MDWHsPrdAppVM01PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsPrdAppVM01PrivateIpAddress.value
  MDWHsPrdAppVM02PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsPrdAppVM02PrivateIpAddress.value

  MDWHsUatWebVM01PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsUatWebVM01PrivateIpAddress.value
  MDWHsUatAppVM01PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsUatAppVM01PrivateIpAddress.value
  MDWHsUatAppVM02PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsUatAppVM02PrivateIpAddress.value

  auxScriptsSAAccountKey = data.azurerm_key_vault_secret.auxScriptsSAAccountKey.value
  workspaceId            = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey           = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL            = data.azurerm_key_vault.MDWHsprdkv.vault_uri

  KeyVaultURL_Uat    = data.azurerm_key_vault.MDWHsUatkv.vault_uri
  KeyVaultResourceId = data.azurerm_key_vault.MDWHsprdkv.id

  KeyVaultResourceId_Uat = data.azurerm_key_vault.MDWHsUatkv.id
  KekVaultResourceId     = data.azurerm_key_vault.MDWHsprdkv.id

  KekVaultResourceId_Uat = data.azurerm_key_vault.MDWHsUatkv.id

  MDWHsPrdWebVM01EncryptKeyURL = data.azurerm_key_vault_secret.MDWHsPrdWebVM01EncryptKeyURL.value
  MDWHsPrdAppVM01EncryptKeyURL = data.azurerm_key_vault_secret.MDWHsPrdAppVM01EncryptKeyURL.value
  MDWHsPrdAppVM02EncryptKeyURL = data.azurerm_key_vault_secret.MDWHsPrdAppVM02EncryptKeyURL.value

  MDWHsUatWebVM01EncryptKeyURL = data.azurerm_key_vault_secret.MDWHsUatWebVM01EncryptKeyURL.value
  MDWHsUatAppVM01EncryptKeyURL = data.azurerm_key_vault_secret.MDWHsUatAppVM01EncryptKeyURL.value
  MDWHsUatAppVM02EncryptKeyURL = data.azurerm_key_vault_secret.MDWHsUatAppVM02EncryptKeyURL.value
}

##########################  Excryption #########################
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
    "storageAccountName": "${var.auxScriptsSA}",
    "storageAccountKey": "${local.auxScriptsSAAccountKey}"
  }
  PROTECTED_SETTINGS
  PrepVMsettings           = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
  SETTINGS

  EncryptVMsettingsgenuksstgbosw01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsPrdWebVM01EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsguksprdhmdboa01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsPrdAppVM01EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsguksprdhmdboa02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsPrdAppVM02EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  ########### UAT ################

  EncryptVMsettingsguksuathmdbow01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL_Uat}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId_Uat}",
        "KekVaultResourceId": "${local.KekVaultResourceId_Uat}",
        "KeyEncryptionKeyURL": "${local.MDWHsUatWebVM01EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsguksuathmdboa01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL_Uat}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId_Uat}",
        "KekVaultResourceId": "${local.KekVaultResourceId_Uat}",
        "KeyEncryptionKeyURL": "${local.MDWHsUatAppVM01EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsguksuathmdboa02 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL_Uat}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId_Uat}",
        "KekVaultResourceId": "${local.KekVaultResourceId_Uat}",
        "KeyEncryptionKeyURL": "${local.MDWHsUatAppVM02EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
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



  subId = data.azurerm_client_config.current.subscription_id
  vm_source_id = {
    source_vm_id_01         = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsPrdVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsPrdWebVM01}"
    source_vm_id_02         = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsPrdVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsPrdAppVM01}"
    source_vm_id_03         = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsPrdVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsPrdAppVM02}"
    source_vm_id_04         = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsUatVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsUatWebVM01}"
    source_vm_id_05         = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsUatVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsUatAppVM01}"
    source_vm_id_06         = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsUatVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsUatAppVM02}"
    backup_policy_id_01     = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsPrdRSVRgName}/providers/Microsoft.RecoveryServices/vaults/${var.MDWHsPrdRSVName}/backupPolicies/${var.MDWHs_infraVM_backup_policy_01}"
    backup_policy_id_Uat_01 = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsUatRSVRgName}/providers/Microsoft.RecoveryServices/vaults/${var.MDWHsUatRSVName}/backupPolicies/${var.MDWHs_infraVM_backup_policy_01}"
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

############ Importing MDW Dev VM ###########

locals {
  MDWHsUatVM04PrivateIpAddress      = data.azurerm_key_vault_secret.MDWHsUatVM04PrivateIpAddress.value
  MDWHsPrdVM04PrivateIpAddress      = data.azurerm_key_vault_secret.MDWHsPrdVM04PrivateIpAddress.value
  MDWHsUatPrdVM04KeyVaultURL        = data.azurerm_key_vault.MDWHsUatPrdVM04kv.vault_uri
  MDWHsUatPrdVM04KeyVaultResourceId = data.azurerm_key_vault.MDWHsUatPrdVM04kv.id
  MDWHsUatPrdVM04KekVaultResourceId = data.azurerm_key_vault.MDWHsUatPrdVM04kv.id


  MDWHsUatVM04EncryptKeyURL = data.azurerm_key_vault_secret.guksuthmdwirt01-ade-url.value
  MDWHsPrdVM04EncryptKeyURL = data.azurerm_key_vault_secret.guksprhmdwirt01-ade-url.value
}

##########################  Excryption #########################
locals {


  MDWHsUatPrdVM04_PrepVMprotected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM-01.ps1",
    "storageAccountName": "${var.auxScriptsSA}",
    "storageAccountKey": "${local.auxScriptsSAAccountKey}"
  }
  PROTECTED_SETTINGS
  MDWHsUatPrdVM04_PrepVMsettings           = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVm01Ps1FilePath}"]
  }
  SETTINGS

  EncryptVMsettingsguksuthmdwirt01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.MDWHsUatPrdVM04KeyVaultURL}",
        "KeyVaultResourceId": "${local.MDWHsUatPrdVM04KeyVaultResourceId}",
        "KekVaultResourceId": "${local.MDWHsUatPrdVM04KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsUatVM04EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS


  EncryptVMsettingsguksprhmdwirt01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.MDWHsUatPrdVM04KeyVaultURL}",
        "KeyVaultResourceId": "${local.MDWHsUatPrdVM04KeyVaultResourceId}",
        "KekVaultResourceId": "${local.MDWHsUatPrdVM04KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsPrdVM04EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS
}
