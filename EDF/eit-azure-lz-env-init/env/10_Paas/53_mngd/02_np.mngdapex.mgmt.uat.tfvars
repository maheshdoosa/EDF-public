managedGenHSKvName   = "avmgentsthsmngdsub01kv" //// need to edit
managedGenHSKvRgName = ".security"

#########  ApexHS VM Logging storage account #######
environment           = "High Secured Managed"
ApexHSprdVmLogsRgName = "gen-uks-uat-hs-vmlogs-rg-01"
# ApexHStstVmLogsRgName           =   "gen-uks-tst-hs-vmlogs-rg-01"
ApexHSResourceLocation = "UK South"
prdvmDiagSA            = "genuksuathsvmlogssa04"

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


ApexHSprdscriptsRgName                            = "gen-uks-uat-hs-auxscripts"
prdscriptsSA                                      = "genuksuathsauxscript"
auxScripts_minTlsVersion                          = "TLS1_2"
auxScripts_account_tier                           = "standard"
auxScripts_account_replication_type               = "LRS"
auxScripts_storagetype                            = "StorageV2"
auxScripts_enable_https_traffic                   = "true"
auxScripts_blob_public_access                     = "false"
auxScripts_hns_enabled                            = "false"
auxScripts_nfsv3_enabled                          = "false"
auxScripts_large_file_share                       = "false"
auxScripts_blob_soft_delete_retention_days        = "90"
auxScripts_container_delete_retention_policy_days = "90"
auxScripts_share_soft_delete_retention_days       = "90"
auxScripts_routing_preference                     = "MicrosoftRouting"
auxScripts_publish_internet_endpoints             = "false"
auxScripts_publish_microsoft_endpoints            = "false"
auxScripts_network_acl_action                     = "Deny"
auxScripts_microsoft_trusted_services             = ["AzureServices"]
#################### KV ################################

ApexHS_keyvault_name            = "g-uks-uat-hs-apex-ade-kv"
ApexHS_kv_resourceGroupName     = "gen-uks-uat-hs-apex-ade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
ApexHSPrivateDNSRgName          = "gen-uks-uat-hs-apex-pdns-rg"
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
vnet_dns_link_name              = "gen-uks-uat-hs-apex-pdns-link"
ApexHs_Prd_endpoint_name        = "gen-uks-uat-hs-apex-ade-kv-pe"
ApexHs_Prd_endpoint_SC          = "gen-uks-uat-hs-apex-ade-kv-pesc"
is_manual_connection            = "false" //keep default false
subresource_names               = ["vault"]
ApexHsPrdNetworkingRgName       = "gen-uks-uat-hs-managed-vnet-rg-01"
ApexHsPrdVnetName               = "gen-uks-uat-hs-managed-vnet-01"
ApexHsPrdSubnetName             = "gen-uks-uat-hs-apex-snet-01"


######### Recovery Services Vault #######

ApexHS_recovery_vault_name   = "gen-uks-uat-hs-apex-vmbackup-rsv-01"
ApexHS_rsv_resourceGroupName = "gen-uks-uat-uat-apex-vmbackup-rg-01"
sku                          = "standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "eit-uks-alz-hs-loga-01"
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




############# vm logs SA Private Endpoint #################
ApexHS_vmDiagSA_resourceGroupName = "gen-uks-uat-hs-vmlogs-rg-01"
ApexHs_uat_vmDiagSA_endpoint_name = "gen-uks-uat-hs-apex-ade-vmlogs-pe"
ApexHs_uat_vmDiagSA_endpoint_SC   = "gen-uks-uat-hs-pex-ade-vmlogs-pesc"

ApexHS_auxScriptsSA_resourceGroupName = "gen-uks-uat-hs-vmscripts-rg-01"
ApexHs_uat_auxScriptsSA_endpoint_name = "gen-uks-uat-hs-apex-ade-vmscripts-pe"
ApexHs_uat_auxScriptsSA_endpoint_SC   = "gen-uks-uat-hs-pex-ade-vmscripts-pesc"

ApexHSvmlogssaPrivateDNSRgName    = "eit-uks-alz-hs-mgmt-pvtdns-rg"
private_dns_zone_vmlogs_name      = "privatelink.blob.core.windows.net"
vnet_dns_link_vmlogs_name         = "gen-uks-uat-hs-apex-vmlogs-pdns-link"
ApexHS_vmlogssa_resourceGroupName = "gen-uks-uat-hs-vmlogs-rg-01"
ApexHs_uat_vmlogssa_endpoint_name = "gen-uks-uat-hs-apex-log-sa-pe"
ApexHs_Prd_endpoint_vmlogs_SC     = "gen-uks-uat-hs-apex-log-sa-pesc"
subresource_names_sa              = ["blob"]

### scripts sa###
ApexHSauxscriptsPrivateDNSRgName   = "eit-uks-alz-hs-mgmt-pvtdns-rg"
private_dns_zone_scripts_name      = "privatelink.blob.core.windows.net"
vnet_dns_link_scripts_name         = "gen-uks-uat-hs-apex-aux-sa-pdns-link"
ApexHs_uat_scriptssa_endpoint_name = "gen-uks-uat-hs-apex-aux-sa-pe"
ApexHs_Prd_endpoint_scripts_SC     = "gen-uks-uat-hs-apex-aux-sa-pesc"

############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "avmgentsthsmngdsub01tf"
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
avmsa_acl              = "Allow"
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"

############# avmgen SA ####################

avmgenRgName            = ".terraformBootstrap"
avmgenResourceLocation  = "uksouth"
avmgen                  = "avmgennphsmngdsub01tf"
avmgen_accounttier      = "standard"
avmgen_storagetype      = "StorageV2"
avmgen_accountreptype   = "LRS"
avmgen_tlsversion       = "TLS1_2"
avmgen_accesstier       = "Hot"
avmgen_httpstraffic     = "true"
avmgen_publicaccess     = "false"
avmgen_hnsenable        = "false"
avmgen_nfsv3            = "false"
avmgen_largefileshare   = "false"
avmgen_acl              = "Allow"
avmgen_bypass           = ["AzureServices"]
avmgen_routing          = "MicrosoftRouting"
avmgen_publishinternet  = "false"
avmgen_publishmicrosoft = "false"
avmgenca                = "statefiles"

##### SA PE ##############
saprivate_dns_zone_name = "privatelink.blob.core.windows.net"
# is_manual_connection                = "false" //keep default false
auxScripts_subresource_names = ["blob"]
apexuatpesubnetName          = "gen-uks-uat-hs-pep-snet-01"
apexuatpeVnetName            = "gen-uks-uat-hs-managed-vnet-01"
apexuatpeVnetRgName          = "gen-uks-uat-hs-managed-vnet-rg-01"

auxScripts_endpoint_name = "genuksuathsauxscript-pe"
auxScripts_endpoint_SC   = "genuksuathsauxscript-pesc"

vmlogs_endpoint_name = "genuksuathsvmlogssa04-pe"
vmlogs_endpoint_SC   = "genuksuathsvmlogssa04-pesc"

avmsatst_endpoint_name = "avmgentsthsmngdsub01tf-pe"
avmsatst_endpoint_SC   = "avmgentsthsmngdsub01tf-pesc"

avmsanp_endpoint_name = "avmgennphsmngdsub01tf-pe"
avmsanp_endpoint_SC   = "avmgennphsmngdsub01tf-pesc"


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

##### KV Diag Settings #####

category20 = "AuditEvent"
category21 = "AzurePolicyEvaluationDetails"
category22 = "AllMetrics"

########## Storage account diag settings ##########
category16 = "StorageRead"
category17 = "StorageWrite"
category18 = "StorageDelete"
category19 = "Transaction"
