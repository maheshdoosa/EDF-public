# locals {
#   privateStaticIpAddress = data.azurerm_key_vault_secret.wsusPrivateStaticIpAddress.value
#   storageAccountKey      = data.azurerm_key_vault_secret.storageAccountKey.value
#   KeyVaultURL            = data.azurerm_key_vault.kvmanagementSsKeyVault.vault_uri
#   KeyVaultResourceId     = data.azurerm_key_vault.kvmanagementSsKeyVault.id
#   KekVaultResourceId     = data.azurerm_key_vault.kvmanagementSsKeyVault.id
#   KeyEncryptionKeyURL    = data.azurerm_key_vault_secret.sswusEncryptKeyURL.value
#   workspaceId            = data.azurerm_log_analytics_workspace.laWorksapce.workspace_id
#   workspaceKey           = data.azurerm_log_analytics_workspace.laWorksapce.primary_shared_key

#   LAsettings           = <<SETTINGS
#         {
#           "workspaceId": "${local.workspaceId}"
#         }
#   SETTINGS
#   LAprotected_settings = <<PROTECTED_SETTINGS
#         {
#           "workspaceKey": "${local.workspaceKey}"
#         }
#   PROTECTED_SETTINGS

#   EncryptVMsettings = <<SETTINGS
#     {
#         "EncryptionOperation": "${var.EncryptionOperation}",
#         "KeyVaultURL": "${local.KeyVaultURL}",
#         "KeyVaultResourceId": "${local.KeyVaultResourceId}",
#         "KekVaultResourceId": "${local.KekVaultResourceId}",
#         "KeyEncryptionKeyURL": "${local.KeyEncryptionKeyURL}",
#         "KeyEncryptionAlgorithm": "${var.KeyEncryptionAlgorithm}",
#         "VolumeType": "${var.VolumeType}"
#     }
#         SETTINGS

#   IaaSAntiMalware = <<SETTINGS
#             {
#                 "AntimalwareEnabled": true,
#                 "RealtimeProtectionEnabled": "true",
#                 "ScheduledScanSettings": {
#                 "isEnabled": "false",
#                 "day": "1",
#                 "time": "180",
#                 "scanType": "Full"
#                 },
#                 "Exclusions": {
#                     "Extensions": "",
#                     "Paths": "%allusersprofile%\\NTUser.pol;%systemroot%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb",
#                     "Processes": ""
#                 }
#             }
#             SETTINGS

#   PrepVMprotected_settings = <<PROTECTED_SETTINGS
#   {
#     "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File PrepVM.ps1",
#     "storageAccountName": "${var.storageAccountName}",
#     "storageAccountKey": "${local.storageAccountKey}"
#   }
#   PROTECTED_SETTINGS

# PrepVMsettings = <<SETTINGS
#   {
#       "fileUris": ["${var.gbRegionXmlFilePath}","${var.prepVmPs1FilePath}"]
#   }
#   SETTINGS

# }
