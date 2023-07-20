locals {
  ComsyHSPrdVM01PrivateIpAddress = data.azurerm_key_vault_secret.ComsyHSPrdVM01PrivateIpAddress.value
  auxScriptsSAAccountKey         = data.azurerm_key_vault_secret.ScriptsstorageAccountKey.value
  workspaceId                    = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                   = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                    = data.azurerm_key_vault.ComsyHSprdkv.vault_uri
  KeyVaultResourceId             = data.azurerm_key_vault.ComsyHSprdkv.id
  KekVaultResourceId             = data.azurerm_key_vault.ComsyHSprdkv.id

  ComsyHSPrdVM01EncryptKeyURL = data.azurerm_key_vault_secret.ComsyHSPrdVM01EncryptKeyURL.value
}

##########################  Encryption #########################
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
    "storageAccountName": "${var.ComsyHSPrdAuxScriptsSA}",
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
        "KeyEncryptionKeyURL": "${local.ComsyHSPrdVM01EncryptKeyURL}",
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
    source_vm_id_01     = "/subscriptions/${local.subId}/resourceGroups/${var.ComsyHSPrdVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.ComsyHSPrdVM01}"
    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.ComsyHSPrdRSVRgName}/providers/Microsoft.RecoveryServices/vaults/${var.ComsyHSPrdRSVName}/backupPolicies/${var.ComsyHS_infraVM_backup_policy_01}"

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
