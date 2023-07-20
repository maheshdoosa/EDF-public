# environment                    = "Production"
snowmidHSVmLogsRgName     = "eit-alz-hs-secgov-prdvmlogs-rg-01"
snowmidHSResourceLocation = "uksouth"

vmDiagSA = "eituksalzhsprdvmlogssa01"

snowmidHSKvName   = "avmeitalzhssecgovsub01kv"
snowmidHSKvRgName = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "eit-alz-hs-secgov-prdvmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "eit-alz-hs-secgov-prdvmbackup-rg-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-AppVMs"
vm_backup_policy_timezone = "UTC"

backup_policy_frequency = "Daily"
backup_policy_time      = "22:00"
retention_daily_count   = 7

retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday", "Wednesday", "Friday", "Saturday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]

infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
backup_policy_time_02    = "23:00"

#################### KV ################################

keyvault_name                   = "eit-alz-hs-sgov-pkvt-01"
resource_Location               = "uk south"
kv_resource_group_name          = "eit-alz-hs-secgov-prdade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
# environment                             = "Production"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
# private_dns_zone_name                   = "privatelink.vault.azure.net"
# vnet_dns_link_name                      = "kv-vnet-dns-link-01"
endpoint_name             = "eitalzhssgovpkvt-pe"
endpoint_SC               = "eitalzhssgovpkvt-pesc"
is_manual_connection      = "false" //keep default false
subresource_names         = ["vault"]
lzsandpitNetworkingRgName = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
lzsandpitVnetName         = "eit-uks-alz-hs-secgovprd-vnet-01"
peSubnetName              = "eit-alz-hs-secgov-pep-snet-01"
aad_group                 = "EIT-PRD-RBAC-HS-SNOWMID-Contributor"
aad_user                  = "sai.devarabhotla_accenture.com#EXT#@edfenergynnb.onmicrosoft.com"
#log_analytics_destination_type          = "AzureDiagnostics"



#### secgov aux SA ############
secgovHSsaRgName           = "eit-alz-hs-secgov-auxscripts"
secgovHSsaResourceLocation = "uksouth"
secgovHSsa                 = "eitalzshsgovauxscriptprd"


secgovHSsa_accounttier         = "standard"
secgovHSsa_storagetype         = "StorageV2"
secgovHSsa_accountreptype      = "LRS"
secgovHSsa_tlsversion          = "TLS1_2"
secgovHSsa_accesstier          = "Hot"
secgovHSsa_httpstraffic        = "true"
secgovHSsa_publicaccess        = "false"
secgovHSsa_hnsenable           = "false"
secgovHSsa_nfsv3               = "false"
secgovHSsa_largefileshare      = "false"
secgovHSsa_blobsoftdelete      = "90"
secgovHSsa_containersoftdelete = "90"
secgovHSsa_sharesoftdelete     = "90"
secgovHSsa_acl                 = "Deny"
secgovHSsa_bypass              = ["AzureServices"]
secgovHSsa_routing             = "MicrosoftRouting"
secgovHSsa_publishinternet     = "false"
secgovHSsa_publishmicrosoft    = "false"


########### SA PE ##############
saprivate_dns_zone_name         = "privatelink.blob.core.windows.net"
secgovHSauxsa_endpoint_name     = "eitalzshsgovauxscriptprd-pe"
secgovHSauxsa_endpoint_SC       = "eitalzshsgovauxscriptprd-pesc"
secgovHSauxsa_subresource_names = ["blob"]
secgovHSpesubnetName            = "eit-alz-hs-secgov-pep-snet-01"
secgovHSVnetName                = "eit-uks-alz-hs-secgovprd-vnet-01"
secgovHSNetworkingRgName        = "eit-uks-alz-hs-secgovprd-vnet-rg-01"

secgovHSvmDiagsa_endpoint_name = "eituksalzhsprdvmlogssa01-pe"
secgovHSvmDiagsa_endpoint_SC   = "eituksalzhsprdvmlogssa01-pesc"

############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "avmeitalzhssecgovsub01tf"
avmsa_accounttier      = "standard"
avmsa_storagetype      = "StorageV2"
avmsa_accountreptype   = "LRS"
avmsa_tlsversion       = "TLS1_2"
avmsa_accesstier       = "Hot"
avmsa_httpstraffic     = "true"
avmsa_publicaccess     = "false"
avmsa_hnsenable        = "false"
avmsa_nfsv3            = "false"
avmsa_largefileshare   = "false"
avmsa_acl              = "Deny"
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"


vmDiagSA_tlsversion          = "TLS1_2"
vmDiagSA_accountreptype      = "LRS"
vmDiagSA_accounttier         = "standard"
vmDiagSA_storagetype         = "StorageV2"
vmDiagSA_httpstraffic        = "true"
vmDiagSA_publicaccess        = "false"
vmDiagSA_hnsenable           = "false"
vmDiagSA_nfsv3               = "false"
vmDiagSA_largefileshare      = "false"
vmDiagSA_blobsoftdelete      = "90"
vmDiagSA_containersoftdelete = "90"
vmDiagSA_sharesoftdelete     = "90"
vmDiagSA_routing             = "MicrosoftRouting"
vmDiagSA_publishinternet     = "false"
vmDiagSA_publishmicrosoft    = "false"
vmDiagSA_acl                 = "Deny"
vmDiagSA_bypass              = ["AzureServices"]

avmsa_endpoint_name = "avmeitalzhssecgovsub01tf-pe"
avmsa_endpoint_SC   = "avmeitalzhssecgovsub01tf-pesc"

category1  = "AzureBackupReport"
category2  = "CoreAzureBackup"
category3  = "AddonAzureBackupJobs"
category4  = "AddonAzureBackupAlerts"
category5  = "AddonAzureBackupPolicy"
category6  = "AddonAzureBackupStorage"
category7  = "AddonAzureBackupProtectedInstance"
category8  = "AzureSiteRecoveryJobs"
category9  = "AzureSiteRecoveryEvents"
category10 = "AzureSiteRecoveryReplicatedItems"
category11 = "AzureSiteRecoveryReplicationStats"
category12 = "AzureSiteRecoveryRecoveryPoints"
category13 = "AzureSiteRecoveryReplicationDataUploadRate"
category14 = "AzureSiteRecoveryProtectedDiskDataChurn"
category15 = "Health"

categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90
########## Storage account diag settings ##########
category16 = "StorageRead"
category17 = "StorageWrite"
category18 = "StorageDelete"
category19 = "Transaction"


##### KV Diag Settings #####

category20 = "AuditEvent"
category21 = "AzurePolicyEvaluationDetails"
category22 = "AllMetrics"
