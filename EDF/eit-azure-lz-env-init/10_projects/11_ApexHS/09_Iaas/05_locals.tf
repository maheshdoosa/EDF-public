locals {
  apexVm0101PrivateIpAddress  = data.azurerm_key_vault_secret.apexVm0101PrivateIpAddress.value
  apexVm02PrivateIpAddress    = data.azurerm_key_vault_secret.apexVm02PrivateIpAddress.value
  apexTstVm01PrivateIpAddress = data.azurerm_key_vault_secret.apexTstVm01PrivateIpAddress.value
  apexTstVm02PrivateIpAddress = data.azurerm_key_vault_secret.apexTstVm02PrivateIpAddress.value
  storageAccountKey           = data.azurerm_key_vault_secret.storageAccountKey.value
  storageAccountKeytst        = data.azurerm_key_vault_secret.storageAccountKeytst.value
  workspaceId                 = data.azurerm_key_vault_secret.laworkspaceId.value
  workspaceKey                = data.azurerm_key_vault_secret.laWorkspaceKey.value
  KeyVaultURL                 = data.azurerm_key_vault.kvapexHsKeyVault.vault_uri
  KeyVaultResourceId          = data.azurerm_key_vault.kvapexHsKeyVault.id
  KekVaultResourceId          = data.azurerm_key_vault.kvapexHsKeyVault.id
  KeyVaultTstURL              = data.azurerm_key_vault.kvapexHsTstKeyVault.vault_uri
  KeyVaultTstResourceId       = data.azurerm_key_vault.kvapexHsTstKeyVault.id
  KekVaultTstResourceId       = data.azurerm_key_vault.kvapexHsTstKeyVault.id
  KeyEncryptionKeyURLprdams01 = data.azurerm_key_vault_secret.prdams01EncryptKeyURL.value
  KeyEncryptionKeyURLprdams02 = data.azurerm_key_vault_secret.prdams02EncryptKeyURL.value

  KeyEncryptionKeyURLprdams03 = data.azurerm_key_vault_secret.prdams03EncryptKeyURL.value
  KeyEncryptionKeyURLprdams04 = data.azurerm_key_vault_secret.prdams04EncryptKeyURL.value

  subId = data.azurerm_client_config.current.subscription_id
  vm_source_id = {
    source_vm_id        = "/subscriptions/${local.subId}/resourceGroups/${var.apexHsRgName}/providers/Microsoft.Compute/virtualMachines/${var.apexvm01Name}"
    source_vm2_id       = "/subscriptions/${local.subId}/resourceGroups/${var.apexHsRgName}/providers/Microsoft.Compute/virtualMachines/${var.apexvm02Name}"
    backup_policy_id    = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy}"
    backup_policy_id_02 = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name}/backupPolicies/${var.infraVM_backup_policy_02}"
  }
  vm_source_id_tst = {
    source_tst_vm_id        = "/subscriptions/${local.subId}/resourceGroups/${var.apexHsRgName_tst}/providers/Microsoft.Compute/virtualMachines/${var.apexTstvm01Name}"
    source_tst_vm2_id       = "/subscriptions/${local.subId}/resourceGroups/${var.apexHsRgName_tst}/providers/Microsoft.Compute/virtualMachines/${var.apexTstvm02Name}"
    backup_policy_id_tst    = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName_tst}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name_tst}/backupPolicies/${var.infraVM_backup_policy}"
    backup_policy_id_02_tst = "/subscriptions/${local.subId}/resourceGroups/${var.rsv_resourceGroupName_tst}/providers/Microsoft.RecoveryServices/vaults/${var.recovery_vault_name_tst}/backupPolicies/${var.infraVM_backup_policy_02}"
  }

  LAsettings                    = <<SETTINGS
  {
    "workspaceId": "${local.workspaceId}"
  }
  SETTINGS
  LAprotected_settings          = <<PROTECTED_SETTINGS
  {
    "workspaceKey": "${local.workspaceKey}"
  }
  PROTECTED_SETTINGS
  EncryptVMsettingsvm01         = <<SETTINGS
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
  EncryptVMsettingsvm02         = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLprdams02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingststvm01      = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultTstURL}",
        "KeyVaultResourceId": "${local.KeyVaultTstResourceId}",
        "KekVaultResourceId": "${local.KekVaultTstResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLprdams03}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingststvm02      = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultTstURL}",
        "KeyVaultResourceId": "${local.KeyVaultTstResourceId}",
        "KekVaultResourceId": "${local.KekVaultTstResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLprdams04}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  PrepLinuxVMprotected_settings = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh domainjoin.sh ${local.domain} ouPath='${var.ouPath}' ${local.user} ${local.password} ${var.adAdminGroup} ${local.nameserverip} ${local.dNSHostName} ${local.dchostname}",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS
  PrepLinuxVMsettings           = <<SETTINGS
   {
       "fileUris": ["${var.DomainJoinFilePath}"]
   }
   SETTINGS

  PrepLinuxVMprotected_settings02 = <<PROTECTED_SETTINGS
 {
  "commandToExecute" : "sh domainjoin.sh ${local.domain} ouPath='${var.ouPath}' ${local.user} ${local.password} ${var.adAdminGroup} ${local.nameserverip} ${local.dNSHostName} ${local.dchostname}",
    "storageAccountName": "${var.storageAccountNametst}",
    "storageAccountKey": "${local.storageAccountKeytst}"
  }
  PROTECTED_SETTINGS
  PrepLinuxVMsettings02           = <<SETTINGS
   {
       "fileUris": ["${var.DomainJoinFilePathtst}"]
   }
   SETTINGS
  domain                          = data.azurerm_key_vault_secret.adDomainName.value
  user                            = data.azurerm_key_vault_secret.adAdminUser.value
  password                        = data.azurerm_key_vault_secret.adAdminPassword.value
  nameserverip                    = data.azurerm_key_vault_secret.nameserverip.value
  dNSHostName                     = data.azurerm_key_vault_secret.dNSHostName.value
  dchostname                      = data.azurerm_key_vault_secret.dchostname.value

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
