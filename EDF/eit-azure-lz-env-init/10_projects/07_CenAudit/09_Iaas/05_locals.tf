locals {
  cenadtvm01PrivateIpAddress   = data.azurerm_key_vault_secret.cenadtvm01PrivateIpAddress.value
  cenadtvm02PrivateIpAddress   = data.azurerm_key_vault_secret.cenadtvm02PrivateIpAddress.value
  cenadtecvm01PrivateIpAddress = data.azurerm_key_vault_secret.cenadtecvm01PrivateIpAddress.value
  cenadtecvm02PrivateIpAddress = data.azurerm_key_vault_secret.cenadtecvm02PrivateIpAddress.value

  storageAccountKey              = data.azurerm_key_vault_secret.storageAccountKey.value
  workspaceId                    = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                   = data.azurerm_key_vault_secret.laWorkspaceKey.value
  ImageSubIds                    = data.azurerm_key_vault_secret.ImageSubId.value
  KeyVaultURL                    = data.azurerm_key_vault.kvadeHsKeyVault.vault_uri
  KeyVaultResourceId             = data.azurerm_key_vault.kvadeHsKeyVault.id
  KekVaultResourceId             = data.azurerm_key_vault.kvadeHsKeyVault.id
  KeyEncryptionKeyURLcenadvm01   = data.azurerm_key_vault_secret.cenadvm01EncryptKeyURL.value
  KeyEncryptionKeyURLcenadvm02   = data.azurerm_key_vault_secret.cenadvm02EncryptKeyURL.value
  KeyEncryptionKeyURLcenadecvm01 = data.azurerm_key_vault_secret.cenadedvm01EncryptKeyURL.value
  KeyEncryptionKeyURLcenadecvm02 = data.azurerm_key_vault_secret.cenadecvm02EncryptKeyURL.value

  domain          = data.azurerm_key_vault_secret.adDomainName.value
  user            = data.azurerm_key_vault_secret.adAdminUser.value
  password        = data.azurerm_key_vault_secret.adAdminPassword.value
  nameserveripvm1 = data.azurerm_key_vault_secret.nameserverip1.value
  nameserveripvm2 = data.azurerm_key_vault_secret.nameserverip2.value
  dNSHostNamevm1  = data.azurerm_key_vault_secret.dNSHostName1.value
  dNSHostNamevm2  = data.azurerm_key_vault_secret.dNSHostName2.value
  dchostnamevm1   = data.azurerm_key_vault_secret.dchostname1.value
  dchostnamevm2   = data.azurerm_key_vault_secret.dchostname2.value

  PrepLinuxVMsettings = <<SETTINGS
   {
       "fileUris": ["${var.DomainJoinFilePath}"]
   }
   SETTINGS


  PrepLinuxVMprotected_settings = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh ubuntu_domainjoin_updated.sh ${local.domain} ${local.user} ${local.password} ${local.nameserveripvm1} ${local.nameserveripvm2} ${local.dNSHostNamevm1} ${local.dNSHostNamevm2} ${local.dchostnamevm1} ${local.dchostnamevm2} ${var.adAdminGroup} ${var.adAdminGroup2} ${var.hostname}",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
PROTECTED_SETTINGS

  PrepLinuxVMprotected_settings_epcvm01 = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh ubuntu_domainjoin_updated.sh ${local.domain} ${local.user} ${local.password} ${local.nameserveripvm1} ${local.nameserveripvm2} ${local.dNSHostNamevm1} ${local.dNSHostNamevm2} ${local.dchostnamevm1} ${local.dchostnamevm2} ${var.adAdminGroup} ${var.adAdminGroup2} ${var.hostname_epcvm01}",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
PROTECTED_SETTINGS


  LAsettings            = <<SETTINGS
  {
    "workspaceId": "${local.workspaceId}"
  }
  SETTINGS
  LAprotected_settings  = <<PROTECTED_SETTINGS
  {
    "workspaceKey": "${local.workspaceKey}"
  }
  PROTECTED_SETTINGS
  EncryptVMsettingsvm01 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLcenadvm01}",
           "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
           "VolumeType": "${var.VolumeType}"
       }
           SETTINGS
  EncryptVMsettingsvm02 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLcenadvm02}",
           "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
           "VolumeType": "${var.VolumeType}"
       }
           SETTINGS

  EncryptVMsettingspecvm01 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLcenadecvm01}",
           "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
           "VolumeType": "${var.VolumeType}"
       }
           SETTINGS

  EncryptVMsettingspecvm02 = <<SETTINGS
       {
           "EncryptionOperation": "${var.EncryptionOperation}",
           "KeyVaultURL": "${local.KeyVaultURL}",
           "KeyVaultResourceId": "${local.KeyVaultResourceId}",
           "KekVaultResourceId": "${local.KekVaultResourceId}",
           "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLcenadecvm02}",
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

  # PrepVMprotected_settings    = <<PROTECTED_SETTINGS
  #   {
  #     "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM.ps1",
  #     "storageAccountName": "${var.storageAccountName}",
  #     "storageAccountKey": "${local.storageAccountKey}"
  #   }
  #   PROTECTED_SETTINGS
  # PrepVMsettings = <<SETTINGS
  #   {
  #       "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}"]
  #   }
  #   SETTINGS

  #diskattach01  = {
  #       manged_disk_id = data.azurerm_managed_disk.cenadvm01_data_disk.id
  #       lun_number     = var.disk_lun_01
  #       vm_id          = data.azurerm_virtual_machine.tenable_vm.id
  #   }

}

############# backup ######################


locals {

  subId = data.azurerm_client_config.current.subscription_id

  vm_source_id = {
    source_epcvm01_id = "/subscriptions/${local.subId}/resourceGroups/${var.lzcenadtpecRgName}/providers/Microsoft.Compute/virtualMachines/${var.cenadtpecvm01name}"
    source_epcvm02_id = "/subscriptions/${local.subId}/resourceGroups/${var.lzcenadtpecRgName}/providers/Microsoft.Compute/virtualMachines/${var.cenadtpecvm02name}"
    source_epcvm03_id = "/subscriptions/${local.subId}/resourceGroups/${var.lzcenadtRgName}/providers/Microsoft.Compute/virtualMachines/${var.cenadtvm01name}"
    source_epcvm04_id = "/subscriptions/${local.subId}/resourceGroups/${var.lzcenadtRgName}/providers/Microsoft.Compute/virtualMachines/${var.cenadtvm02name}"

    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_01}"
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
