# environment      = "Production"
controlmHSKvName   = "avmeitprdhsmngdsub01kv"
controlmHSKvRgName = ".security"

######### Recovery Services Vault #######
recovery_vault_name          = "eit-uks-prd-hs-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "eit-uks-prd-hs-vmbackup-rg"
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

#########  SA VMdiag #######
controlmHSVmLogsRgName       = "eit-uks-prd-hs-vmlogs-rg-01"
controlmHSResourceLocation   = "uksouth"
vmDiagSA                     = "eituksprdmngdvmlogssa01"
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

#################### KV ################################

keyvault_name                   = "eit-uks-prd-hs-ade-kv-01"
resource_Location               = "uk south"
kv_resource_group_name          = "eit-uks-prd-hs-ade-kv-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
endpoint_name                   = "eithsctrlmpkvt-pe"
endpoint_SC                     = "eithsctrlmpkvt-pesc"
is_manual_connection            = "false" //keep default false
subresource_names               = ["vault"]
lzsandpitNetworkingRgName       = "eit-uks-prd-hs-mngd-vnet-rg-01"
lzsandpitVnetName               = "eit-uks-prd-hs-mngd-vnet-01"
peSubnetName                    = "eit-uks-prd-hs-pep-snet-01"
aad_group                       = "EIT-PRD-RBAC-HS-EITManaged-Contributor"
aad_user                        = "SVL-AZ-Wayne.Crow@edfenergynnb.onmicrosoft.com"

##### Control M aux SA ############
cntrlmHSsaRgName               = "eit-uks-prd-hs-auxscripts-rg-01"
cntrlmHSsaResourceLocation     = "uksouth"
cntrlmHSsa                     = "eitprdmngdauxscript"
ctrlmauxsac                    = "scripts"
cntrlmHSsa_accounttier         = "standard"
cntrlmHSsa_storagetype         = "StorageV2"
cntrlmHSsa_accountreptype      = "LRS"
cntrlmHSsa_tlsversion          = "TLS1_2"
cntrlmHSsa_accesstier          = "Hot"
cntrlmHSsa_httpstraffic        = "true"
cntrlmHSsa_publicaccess        = "false"
cntrlmHSsa_hnsenable           = "false"
cntrlmHSsa_nfsv3               = "false"
cntrlmHSsa_largefileshare      = "false"
cntrlmHSsa_blobsoftdelete      = "90"
cntrlmHSsa_containersoftdelete = "90"
cntrlmHSsa_sharesoftdelete     = "90"
cntrlmHSsa_acl                 = "Deny"
cntrlmHSsa_bypass              = ["AzureServices"]
cntrlmHSsa_routing             = "MicrosoftRouting"
cntrlmHSsa_publishinternet     = "false"
cntrlmHSsa_publishmicrosoft    = "false"

########### SA PE ##############
saprivate_dns_zone_name         = "privatelink.blob.core.windows.net"
cntrlmHSauxsa_endpoint_name     = "eitprdmngdauxscript-pe"
cntrlmHSauxsa_endpoint_SC       = "eitprdmngdauxscript-pesc"
cntrlmHSauxsa_subresource_names = ["blob"]
cntrlmHSpesubnetName            = "eit-uks-prd-hs-pep-snet-01"
cntrlmHSVnetName                = "eit-uks-prd-hs-mngd-vnet-01"
cntrlmHSNetworkingRgName        = "eit-uks-prd-hs-mngd-vnet-rg-01"
cntrlmHSvmDiagsa_endpoint_name  = "eituksprdmngdvmlogssa01-pe"
cntrlmHSvmDiagsa_endpoint_SC    = "eituksprdmngdvmlogssa01-pesc"

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

##### Diag Settings #####

category16 = "AuditEvent"
category17 = "AzurePolicyEvaluationDetails"
category18 = "AllMetrics"
########## Storage account diag settings ##########
category19 = "StorageRead"
category20 = "StorageWrite"
category21 = "StorageDelete"
category22 = "Transaction"
