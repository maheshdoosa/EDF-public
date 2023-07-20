environment          = "High Secured Managed"
managedGenHSKvName   = "avmgenprdhsmngdsub01kv"
managedGenHSKvRgName = ".security"

########### Apex Prod TFVARS ##############

#VM Loging Storage Account

#########  ApexHS VM Logging storage account #######

ApexHSprdVmLogsRgName        = "gen-uks-prd-hs-vmlogs-rg-01"
ApexHSprdscriptsRgName       = "gen-uks-prd-hs-vmscripts-rg-01"
ApexHSResourceLocation       = "UK South"
prdvmDiagSA                  = "genuksprdhsvmlogssa01"
prdscriptsSA                 = "genuksprdhsvmscrtsa01"
vmDiagSA_accounttier         = "standard"
vmDiagSA_storagetype         = "StorageV2"
vmDiagSA_accountreptype      = "LRS"
vmDiagSA_tlsversion          = "TLS1_2"
vmDiagSA_accesstier          = "Hot"
vmDiagSA_httpstraffic        = "true"
vmDiagSA_publicaccess        = "false"
vmDiagSA_hnsenable           = "false"
vmDiagSA_nfsv3               = "false"
vmDiagSA_largefileshare      = "false"
vmDiagSA_blobsoftdelete      = "90"
vmDiagSA_containersoftdelete = "90"
vmDiagSA_sharesoftdelete     = "90"
vmDiagSA_acl                 = "Deny"
vmDiagSA_bypass              = ["AzureServices"]
vmDiagSA_routing             = "MicrosoftRouting"
vmDiagSA_publishinternet     = "false"
vmDiagSA_publishmicrosoft    = "false"

######### Recovery Services Vault #######

ApexHS_recovery_vault_name   = "gen-uks-prd-hs-apex-vmbackup-rsv-01"
ApexHS_rsv_resourceGroupName = "gen-uks-hs-prd-apex-vmbackup-rg-01"
sku                          = "standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "rsv_logs"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy_01   = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02   = "Daily-2300-52W-AppVMs"
vm_backup_policy_timezone  = "UTC"
backup_policy_frequency    = "Daily"
backup_policy_time_01      = "22:00"
backup_policy_time_02      = "23:00"
retention_daily_count      = 7
retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]


#################### KV ################################

ApexHS_keyvault_name            = "g-uks-prd-hs-apex-ade-kv"
ApexHS_kv_resourceGroupName     = "gen-uks-prd-hs-apex-ade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
ApexHSPrivateDNSRgName          = "gen-uks-prd-hs-apex-pdns-rg"
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
vnet_dns_link_name              = "gen-uks-prd-hs-apex-pdns-link"
ApexHs_Prd_endpoint_name        = "gen-uks-prd-hs-apex-ade-kv-pe"
ApexHs_Prd_endpoint_SC          = "gen-uks-prd-hs-apex-ade-kv-pesc"
is_manual_connection            = "false" //keep default false
subresource_names               = ["vault"]
ApexHsPrdNetworkingRgName       = "gen-uks-prd-hs-managed-vnet-rg-01"
ApexHsPrdVnetName               = "gen-uks-prd-hs-managed-vnet-01"
ApexHsPrdSubnetName             = "gen-uks-prd-hs-apex-snet-01"


auxScriptsSA                                        = "genuksprdhsvmscrtsa01"
auxScriptsSA_account_replication_type               = "LRS"
auxScriptsSA_account_tier                           = "Standard"
auxScriptsSA_minTlsVersion                          = "TLS1_2"
auxScriptsSA_storagetype                            = "StorageV2"
auxScriptsSA_enable_https_traffic                   = "true"
auxScriptsSA_blob_public_access                     = "false"
auxScriptsSA_hns_enabled                            = "false"
auxScriptsSA_nfsv3_enabled                          = "false"
auxScriptsSA_large_file_share                       = "false"
auxScriptsSA_blob_soft_delete_retention_days        = "90"
auxScriptsSA_container_delete_retention_policy_days = "90"
auxScriptsSA_share_soft_delete_retention_days       = "90"
auxScriptsSA_routing_preference                     = "MicrosoftRouting"
auxScriptsSA_publish_internet_endpoints             = "false"
auxScriptsSA_publish_microsoft_endpoints            = "false"
auxScriptsSA_network_acl_action                     = "Allow"
auxScriptsSA_microsoft_trusted_services             = ["AzureServices"]

############# avmsa SA ####################

avmsaRgName               = ".terraformBootstrap"
avmsaResourceLocation     = "uksouth"
avmsa                     = "avmgenprdhsmngdsub01tf"
avmsa_accounttier         = "standard"
avmsa_storagetype         = "StorageV2"
avmsa_accountreptype      = "LRS"
avmsa_tlsversion          = "TLS1_2"
avmsa_accesstier          = "Hot"
avmsa_httpstraffic        = "true"
avmsa_publicaccess        = "false"
avmsa_hnsenable           = "false"
avmsa_nfsv3               = "false"
avmsa_largefileshare      = "false"
avmsa_acl                 = "Allow"
avmsa_bypass              = ["AzureServices"]
avmsa_routing             = "MicrosoftRouting"
avmsa_publishinternet     = "false"
avmsa_publishmicrosoft    = "false"
avmsaca                   = "statefiles"
avmsa_blobsoftdelete      = "90"
avmsa_containersoftdelete = "90"
avmsa_sharesoftdelete     = "90"


saprivate_dns_zone_name = "privatelink.blob.core.windows.net"
vmDiagSA_endpoint_name  = "genuksprdhsvmlogssa01-pe"
vmDiagSA_endpoint_SC    = "genuksprdhsvmlogssa01-pesc"
sa_subresource_names    = ["blob"]

pesubnetName = "gen-uks-prd-hs-pep-snet-01"
peVnetName   = "gen-uks-prd-hs-managed-vnet-01"
peVnetRgName = "gen-uks-prd-hs-managed-vnet-rg-01"

auxScriptsSA_endpoint_name = "genuksprdhsvmscrtsa01-pe"
auxScriptsSA_endpoint_SC   = "genuksprdhsvmscrtsa01-pesc"

avmSA_endpoint_name = "avmgenprdhsmngdsub01tf-pe"
avmSA_endpoint_SC   = "avmgenprdhsmngdsub01tf-pesc"

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
