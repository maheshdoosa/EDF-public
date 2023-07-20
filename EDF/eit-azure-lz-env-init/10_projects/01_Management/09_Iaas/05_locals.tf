locals {
  pkiEaRootPrivateIpAddress   = data.azurerm_key_vault_secret.pkiEaRootPrivateIpAddress.value
  pkiCa01PrivateIpAddress     = data.azurerm_key_vault_secret.pkiCA01PrivateIpAddress.value
  pkiCa02PrivateIpAddress     = data.azurerm_key_vault_secret.pkiCA02PrivateIpAddress.value
  pkiWebPki01PrivateIpAddress = data.azurerm_key_vault_secret.webpki01PrivateIpAddress.value
  pkiWebPki02PrivateIpAddress = data.azurerm_key_vault_secret.webpki02PrivateIpAddress.value
  wac01PrivateIpAddress       = data.azurerm_key_vault_secret.wac01PrivateIpAddress.value
  wac02PrivateIpAddress       = data.azurerm_key_vault_secret.wac02PrivateIpAddress.value
  AFS01PrivateIpAddress       = data.azurerm_key_vault_secret.AFS01PrivateIpAddress.value
  dc03PrivateIpAddress        = data.azurerm_key_vault_secret.dc03PrivateIpAddress.value
  dc04PrivateIpAddress        = data.azurerm_key_vault_secret.dc04PrivateIpAddress.value
  AnsPrivateIpAddress         = data.azurerm_key_vault_secret.AnsPrivateIpAddress.value
  workspaceId                 = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                 = data.azurerm_key_vault.HsAdeKeyVault.vault_uri
  KeyVaultResourceId          = data.azurerm_key_vault.HsAdeKeyVault.id
  KekVaultResourceId          = data.azurerm_key_vault.HsAdeKeyVault.id
  KeyEncryptionKeyURLsafs01   = data.azurerm_key_vault_secret.afs01EncryptKeyURL.value
  KeyEncryptionKeyURLsdc03    = data.azurerm_key_vault_secret.dc03EncryptKeyURL.value
  KeyEncryptionKeyURLsdc04    = data.azurerm_key_vault_secret.dc04EncryptKeyURL.value
  storageAccountKey           = data.azurerm_key_vault_secret.storageAccountKey.value
  subId                       = data.azurerm_client_config.current.subscription_id
  KeyEncryptionKeyURLans01    = data.azurerm_key_vault_secret.ans01EncryptKeyURL.value

  domain          = data.azurerm_key_vault_secret.adDomainName.value
  user            = data.azurerm_key_vault_secret.adAdminUser.value
  password        = data.azurerm_key_vault_secret.adAdminPassword.value
  nameserveripvm1 = data.azurerm_key_vault_secret.nameserverip1.value
  nameserveripvm2 = data.azurerm_key_vault_secret.nameserverip2.value
  dNSHostNamevm1  = data.azurerm_key_vault_secret.dNSHostName1.value
  dNSHostNamevm2  = data.azurerm_key_vault_secret.dNSHostName2.value
  dchostnamevm1   = data.azurerm_key_vault_secret.dchostname1.value
  dchostnamevm2   = data.azurerm_key_vault_secret.dchostname2.value

  vm_source_id = {
    source_vm_id    = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementHsAFSVmRgName}/providers/Microsoft.Compute/virtualMachines/${var.afshsvm01Name}"
    source_vm_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementHsDc03RgName}/providers/Microsoft.Compute/virtualMachines/${var.dc03vmName}"
    source_vm_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementHsDc03RgName}/providers/Microsoft.Compute/virtualMachines/${var.dc04vmName}"
    source_vm_id_03 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhsAnsRgName}/providers/Microsoft.Compute/virtualMachines/${var.ansvm01name}"
    source_vm_id_04 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementHsDc03RgName}/providers/Microsoft.Compute/virtualMachines/${var.dc01vmName}"
    source_vm_id_05 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementHsDc03RgName}/providers/Microsoft.Compute/virtualMachines/${var.dc02vmName}"
    source_vm_id_06 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhsweb01RgName}/providers/Microsoft.Compute/virtualMachines/${var.web01vmname}"
    source_vm_id_07 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhsweb01RgName}/providers/Microsoft.Compute/virtualMachines/${var.web02vmname}"
    source_vm_id_08 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhsica01RgName}/providers/Microsoft.Compute/virtualMachines/${var.ica01vmname}"
    source_vm_id_09 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhsica01RgName}/providers/Microsoft.Compute/virtualMachines/${var.ica02vmname}"
    source_vm_id_10 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhsica01RgName}/providers/Microsoft.Compute/virtualMachines/${var.rca01vmname}"
    source_vm_id_11 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhswac01RgName}/providers/Microsoft.Compute/virtualMachines/${var.wac01vmname}"
    source_vm_id_12 = "/subscriptions/${local.subId}/resourceGroups/${var.lzmanagementhswus01RgName}/providers/Microsoft.Compute/virtualMachines/${var.wus01vmname}"

    backup_policy_id    = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
    backup_policy_id_01 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_01}"

    backup_policy_id_03 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name_02}/backupPolicies/${var.infraVM_backup_policy}"
    backup_policy_id_04 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name_02}/backupPolicies/${var.infraVM_backup_policy_01}"
  }

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

  EncryptVMsettingsafs01 = <<SETTINGS
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

  EncryptVMsettingsdc03 = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsdc03}",
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
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLsdc04}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
    SETTINGS

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

  PrepVMprotected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVM.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS

  PrepVMsettings             = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}","${var.lapsFilePath}"]
  }
  SETTINGS
  PrepVMprotected_settingsDC = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVMForAD.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS
  PrepVMsettingsDC           = <<SETTINGS
  {
      "fileUris": ["${var.gbRegionXmlFilePath}","${var.PrepareVMForADPath}"]
  }
  SETTINGS
  EncryptVMsettingsansvm01   = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLans01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  PrepLinuxVMsettings        = <<SETTINGS
   {
       "fileUris": ["${var.DomainJoinFilePath}"]
   }
   SETTINGS

  PrepLinuxVMprotected_settings = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh ubuntu_domainjoin.sh  ${local.domain} ${local.user} ${local.password} ${local.nameserveripvm1} ${local.nameserveripvm2} ${local.dNSHostNamevm1} ${local.dNSHostNamevm2} ${local.dchostnamevm1} ${local.dchostnamevm2} ${var.adAdminGroup} ${var.adAdminGroup2} ${var.hostname}",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey" : "${local.storageAccountKey}"
  }
PROTECTED_SETTINGS

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
