environment            = "High Secured Managed"
genprdResourceLocation = "uksouth"
genprdHSKvName         = "avmgenprdhsmgmtsub01kv"
genprdHSKvRgName       = ".security"

######## Diag Storage Account ########
genprdscriptsRgName          = "gen-uks-prd-hs-auxscripts-rg-01"
vmDiagSA                     = "genuksprdhsvmlogssa02"
genprdvmLogsRgName           = "gen-uks-prd-hs-vmlogs-rg-01"
vmprepscriptsSA              = "genuksprdhsauxscripts"
container                    = "scripts"
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
vmDiagSA_acl                 = "Allow"
vmDiagSA_bypass              = ["AzureServices"]
vmDiagSA_routing             = "MicrosoftRouting"
vmDiagSA_publishinternet     = "false"
vmDiagSA_publishmicrosoft    = "false"

######################### Private Endpoint for Storage ###########################
sa_private_dns_zone_name        = "privatelink.blob.core.windows.net"
sa_private_dns_zone_rg_name     = "g-uks-prd-hs-mgmt-pvtdns-rg"
genProdHSvmDiagsa_endpoint_name = "genuksprdhsvmlogssa02-pe"
genprodHSvmDiagsa_endpoint_SC   = "genuksprdhsvmlogssa02-pesc"
subresource_name                = ["blob"]

##### genProdHS SA PE ################

genProdHSauxsa_endpoint_name     = "genuksprdhsauxscripts-pe"
genprodHSauxsa_endpoint_SC       = "genuksprdhsauxscripts-pesc"
genprodHSauxsa_subresource_names = ["blob"]

######### Recovery Services Vault #######
recovery_vault_name          = "gen-uks-prd-hs-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "gen-uks-prd-hs-vmbackup-rg-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy      = "Daily-2200-52W-InfaVMs"
vm_backup_policy_timezone  = "UTC"
backup_policy_frequency    = "Daily"
backup_policy_time         = "22:00"
retention_daily_count      = 7
retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday", "Wednesday", "Friday", "Saturday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]
infraVM_backup_policy_02   = "Daily-2300-52W-InfraVMs"
backup_policy_time_02      = "23:00"

#################### KV ################################

keyvault_name                   = "gen-uks-prd-hs-ade-kv-02"
resource_Location               = "uk south"
kv_resource_group_name          = "gen-uks-prd-hs-ade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
vnet_dns_link_name              = "gen-uks-prd-hs-ade-kv-pdns-link"
# endpoint_name                   = "gen-uks-prd-hs-ade-kv-pe"
# endpoint_SC                     = "gen-uks-prd-hs-ade-kv-pesc"
endpoint_name            = "gen-uks-prd-hs-ade-kv-02-pe"
endpoint_SC              = "gen-uks-prd-hs-ade-kv-02-pesc"
is_manual_connection     = "false" //keep default false
subresource_names        = ["vault"]
lzgenprdNetworkingRgName = "gen-uks-prd-hs-mgmt-vnet-rg-01" ##update
lzgenprdVnetName         = "gen-uks-prd-hs-mgmt-vnet-01"    ##update
peSubnetName             = "gen-uks-prd-hs-pep-snet-01"
aad_group                = "GEN-PRD-RBAC-HS-MGMT-Contributor"


auxscripts_account_replication_type               = "LRS"
auxscripts_account_tier                           = "Standard"
auxscripts_minTlsVersion                          = "TLS1_2"
auxscripts_storagetype                            = "StorageV2"
auxscripts_enable_https_traffic                   = "true"
auxscripts_blob_public_access                     = "false"
auxscripts_hns_enabled                            = "false"
auxscripts_nfsv3_enabled                          = "false"
auxscripts_large_file_share                       = "false"
auxscripts_blob_soft_delete_retention_days        = "90"
auxscripts_container_delete_retention_policy_days = "90"
auxscripts_share_soft_delete_retention_days       = "90"
auxscripts_routing_preference                     = "MicrosoftRouting"
auxscripts_publish_internet_endpoints             = "false"
auxscripts_publish_microsoft_endpoints            = "false"
auxscripts_network_acl_action                     = "Allow"
auxscripts_microsoft_trusted_services             = ["AzureServices"]


############# avmsa SA ####################

avmsaRgName               = ".terraformBootstrap"
avmsaResourceLocation     = "uksouth"
avmsa                     = "avmgenprdhsmgmtsub01tf"
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

avmsa_endpoint_name = "avmgenprdhsmgmtsub01tf-pe"
avmsa_endpoint_SC   = "avmgenprdhsmgmtsub01tf-pesc"

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
