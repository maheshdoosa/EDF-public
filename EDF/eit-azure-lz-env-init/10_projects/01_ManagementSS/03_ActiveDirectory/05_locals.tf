locals {
  blobSas                 = data.azurerm_storage_account_sas.Blobsas.sas
  storageAccountKey       = data.azurerm_key_vault_secret.storageAccountKey.value
  rootDc1IpAddress        = data.azurerm_key_vault_secret.rootDc1IpAddress.value
  adDomainName            = data.azurerm_key_vault_secret.adDomainName.value
  adminUserName           = data.azurerm_key_vault_secret.ADadminUser.value
  adminPassword           = data.azurerm_key_vault_secret.ADadminPassword.value
  KeyVaultURL             = data.azurerm_key_vault.kvmanagementSsKeyVault.vault_uri
  KeyVaultResourceId      = data.azurerm_key_vault.kvmanagementSsKeyVault.id
  KekVaultResourceId      = data.azurerm_key_vault.kvmanagementSsKeyVault.id
  KeyEncryptionKeyURLdc01 = data.azurerm_key_vault_secret.ssdc01EncryptKeyURL.value
  KeyEncryptionKeyURLdc02 = data.azurerm_key_vault_secret.ssdc02EncryptKeyURL.value
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
  EncryptVMsettingsdc01     = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLdc01}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  EncryptVMsettingsdc02     = <<SETTINGS
    {
        "EncryptionOperation": "${var.EncryptionOperation}",
        "KeyVaultURL": "${local.KeyVaultURL}",
        "KeyVaultResourceId": "${local.KeyVaultResourceId}",
        "KekVaultResourceId": "${local.KekVaultResourceId}",
        "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURLdc02}",
        "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
        "VolumeType": "${var.VolumeType}"
    }
        SETTINGS
  PrepVMprotected_settings  = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepareVMForAD.ps1",
    "storageAccountName": "${var.storageAccountName}",
    "storageAccountKey": "${local.storageAccountKey}"
  }
  PROTECTED_SETTINGS
  DC01DSCsettings           = <<SETTINGS
            {
                "WmfVersion": "latest",
                "configuration": {
                    "url": "${var.urlCreateAdRootDc1}",
                    "script": "${var.createADRootDC1}",
                    "function": "${var.createFunctionAdRootDc1}"
                },
                "configurationArguments": {
                    "DomainName": "${local.adDomainName}",
                    "DnsForwarder": "${var.dnsForwarder}",
                    "DnsAlternate": "${local.rootDc1IpAddress}"
                }
            }
            SETTINGS
  DC02DSCsettings           = <<SETTINGS
            {
                "WmfVersion": "latest",
                "configuration": {
                    "url": "${var.urlConfigureADNextDC}",
                    "script": "${var.ConfigureADNextDC}",
                    "function": "${var.createFunctionAdRootDc2}"
                },
                "configurationArguments": {
                    "DomainName": "${local.adDomainName}",
                    "DNSServer": "${local.rootDc1IpAddress}",
                    "DnsForwarder": "${local.rootDc1IpAddress}"
                }
            }
            SETTINGS
  DC01DSCprotected_settings = <<PROTECTED_SETTINGS
        {
            "configurationArguments": {
                "adminCreds": {
                    "UserName": "${local.adminUserName}",
                    "Password": "${local.adminPassword}"
                }
            },
      "configurationUrlSasToken": "${local.blobSas}"
  }
    PROTECTED_SETTINGS
  DC02DSCprotected_settings = <<PROTECTED_SETTINGS
        {
            "configurationArguments": {
                "adminCreds": {
                    "UserName": "${local.adminUserName}",
                    "Password": "${local.adminPassword}"
                }
            },
      "configurationUrlSasToken": "${local.blobSas}"
        }
    PROTECTED_SETTINGS
}
