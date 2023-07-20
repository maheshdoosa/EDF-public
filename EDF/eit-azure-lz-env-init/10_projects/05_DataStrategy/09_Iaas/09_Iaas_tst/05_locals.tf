locals {
  MDWHsTstAppVM01PrivateIpAddress = data.azurerm_key_vault_secret.MDWHsTstAppVM01PrivateIpAddress.value
  auxScriptsSAAccountKey          = data.azurerm_key_vault_secret.auxScriptsSAAccountKey.value
  workspaceId                     = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                    = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                     = data.azurerm_key_vault.MDWHsTstkv.vault_uri
  KeyVaultResourceId              = data.azurerm_key_vault.MDWHsTstkv.id
  KekVaultResourceId              = data.azurerm_key_vault.MDWHsTstkv.id
  MDWHsTstAppVM01EncryptKeyURL    = data.azurerm_key_vault_secret.MDWHsTstAppVM01EncryptKeyURL.value

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

  EncryptVMsettingsgukststhmdboa01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsTstAppVM01EncryptKeyURL}",
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
    source_vm_id_01     = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsTstVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.MDWHsTstAppVM01}"
    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.MDWHsTstRSVRgName}/providers/Microsoft.RecoveryServices/vaults/${var.MDWHsTstRSVName}/backupPolicies/${var.MDWHs_infraVM_backup_policy_01}"

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
  MDWHsDevVM01PrivateIpAddress   = data.azurerm_key_vault_secret.MDWHsDevVM01PrivateIpAddress.value
  MDWHsDevVM02PrivateIpAddress   = data.azurerm_key_vault_secret.MDWHsDevVM02PrivateIpAddress.value
  MDWHsTstVM02PrivateIpAddress   = data.azurerm_key_vault_secret.MDWHsTstVM02PrivateIpAddress.value
  MDWHsDevVM01KeyVaultURL        = data.azurerm_key_vault.MDWHsDevkv.vault_uri
  MDWHsDevVM01KeyVaultResourceId = data.azurerm_key_vault.MDWHsDevkv.id
  MDWHsDevVM01KekVaultResourceId = data.azurerm_key_vault.MDWHsDevkv.id
  MDWHsDevVM01EncryptKeyURL      = data.azurerm_key_vault_secret.guksdvhmdwboa01-ade-url.value
  MDWHsDevVM02EncryptKeyURL      = data.azurerm_key_vault_secret.guksdvhmdwirt01-ade-url.value
  MDWHsTstVM02EncryptKeyURL      = data.azurerm_key_vault_secret.gukstshmdwirt01-ade-url.value

}

##########################  Excryption #########################
locals {


  MDWHsDevVM_PrepVMprotected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM-01.ps1",
    "storageAccountName": "${var.auxScriptsSA}",
    "storageAccountKey": "${local.auxScriptsSAAccountKey}"
  }
  PROTECTED_SETTINGS
  MDWHsDevVM_PrepVMsettings           = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVm01Ps1FilePath}"]
  }
  SETTINGS

  EncryptVMsettingsguksdvhmdwboa01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.MDWHsDevVM01KeyVaultURL}",
        "KeyVaultResourceId": "${local.MDWHsDevVM01KeyVaultResourceId}",
        "KekVaultResourceId": "${local.MDWHsDevVM01KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsDevVM01EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS


  EncryptVMsettingsguksdvhmdwirt01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.MDWHsDevVM01KeyVaultURL}",
        "KeyVaultResourceId": "${local.MDWHsDevVM01KeyVaultResourceId}",
        "KekVaultResourceId": "${local.MDWHsDevVM01KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsDevVM02EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS

  EncryptVMsettingsgukstshmdwirt01 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.MDWHsDevVM01KeyVaultURL}",
        "KeyVaultResourceId": "${local.MDWHsDevVM01KeyVaultResourceId}",
        "KekVaultResourceId": "${local.MDWHsDevVM01KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.MDWHsTstVM02EncryptKeyURL}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
  SETTINGS
}
