environment           = "High Secured Managed"
gennpResourceLocation = "uksouth"
gennpscriptsRgName    = "gen-uks-np-hs-auxscripts-rg-01"
vmprepscriptsSA       = "genuksnphsauxscripts"
container             = "scripts"
gennpHSKvName         = "avmgennphsmgmtsub01kv"
snowmidHSKvRgName     = ".security"
gennpHSKvRgName       = ".security"
############# VM Loging SA ##################
vmDiagSA                     = "genuksnphsvmlogssa01"
gennpLogsRgName              = "gen-uks-np-hs-vmlogs-rg-01"
vmDiagSA_accounttier         = "standard"
vmDiagSA_storagetype         = "StorageV2"
vmDiagSA_accountreptype      = "LRS"
vmDiagSA_tlsversion          = "TLS1_2"
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

scriptsSA_accounttier         = "standard"
scriptsSA_storagetype         = "StorageV2"
scriptsSA_accountreptype      = "LRS"
scriptsSA_tlsversion          = "TLS1_2"
scriptsSA_httpstraffic        = "true"
scriptsSA_publicaccess        = "false"
scriptsSA_hnsenable           = "false"
scriptsSA_nfsv3               = "false"
scriptsSA_largefileshare      = "false"
scriptsSA_blobsoftdelete      = "90"
scriptsSA_containersoftdelete = "90"
scriptsSA_sharesoftdelete     = "90"
scriptsSA_acl                 = "Allow"
scriptsSA_bypass              = ["AzureServices"]
scriptsSA_routing             = "MicrosoftRouting"
scriptsSA_publishinternet     = "false"
scriptsSA_publishmicrosoft    = "false"

######### Recovery Services Vault #######

recovery_vault_name          = "gen-uks-np-hs-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "gen-uks-np-hs-vmbackup-rg-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-InfaVMs"
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

infraVM_backup_policy_02 = "Daily-2300-52W-InfraVMs"
backup_policy_time_02    = "23:00"

#################### KV ################################

keyvault_name                   = "gen-uks-np-hs-ade-kv-01"
resource_Location               = "uk south"
kv_resource_group_name          = "gen-uks-np-hs-ade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
#environment                     = "High Secured Managed"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
# private_dns_zone_name                   = "privatelink.vault.azure.net"
vnet_dns_link_name      = "gen-uks-np-hs-ade-kv-pdns-link"
endpoint_name           = "gen-uks-np-hs-ade-kv-pe"
endpoint_SC             = "gen-uks-np-hs-ade-kv-pesc"
is_manual_connection    = "false" //keep default false
subresource_names       = ["vault"]
lzgennpNetworkingRgName = "gen-uks-np-hs-mgmt-vnet-rg-01"
lzgennpVnetName         = "gen-uks-np-hs-mgmt-vnet-01"
lzgenNetworkingRgName   = "gen-uks-np-hs-mgmt-vnet-rg-01"
peSubnetName            = "gen-uks-np-hs-pep-snet-01"
aad_group               = "EIT-PRD-RBAC-HS-SNOWMID-Contributor"
aad_user                = "sai.devarabhotla_accenture.com#EXT#@edfenergynnb.onmicrosoft.com"
#log_analytics_destination_type          = "AzureDiagnostics"

####### SA PE ############
saprivate_dns_zone_name         = "privatelink.blob.core.windows.net"
gennonProdHSauxsa_endpoint_name = "genuksnphsauxscripts-pe"
gennonProdHSauxsaRgName         = "gen-uks-np-hs-auxscripts-rg-01"
gennonProdHSResourceLocation    = "uk south"
gennonprodHSauxsa_endpoint_SC   = "genuksnphsauxscripts-pesc"
secgovHSauxsa_subresource_names = ["blob"]
gennonprodHSpesubnetName        = "gen-uks-np-hs-pep-snet-01"
gennonprodHSVnetName            = "gen-uks-np-hs-mgmt-vnet-01"
gennonprodHSNetworkingRgName    = "gen-uks-np-hs-mgmt-vnet-rg-01"
gennonprodHSauxsa               = "genuksnphsauxscripts"

vmDiagsa_endpoint_name = "genuksnphsvmlogssa01-pe"
vmDiagsa_endpoint_SC   = "genuksnphsvmlogssa01-pesc"

scriptsSA_endpoint_name = "genuksnphsauxscripts-pe"
scriptsSA_endpoint_SC   = "genuksnphsauxscripts-pesc"

genprodHSpesubnetName     = "gen-uks-prd-hs-pep-snet-01"
genprodHSVnetName         = "gen-uks-prd-hs-mgmt-vnet-01"
genprodHSNetworkingRgName = "gen-uks-prd-hs-mgmt-vnet-rg-01"


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

avmsaname                 = "avmgennphsmgmtsub01tf"
avmsargname               = ".terraformBootstrap"
avmsa_accounttier         = "standard"
avmsa_storagetype         = "StorageV2"
avmsa_accountreptype      = "LRS"
avmsa_tlsversion          = "TLS1_2"
avmsa_httpstraffic        = "true"
avmsa_publicaccess        = "false"
avmsa_hnsenable           = "false"
avmsa_nfsv3               = "false"
avmsa_largefileshare      = "false"
avmsa_blobsoftdelete      = "90"
avmsa_containersoftdelete = "90"
avmsa_sharesoftdelete     = "90"
avmsa_acl                 = "Allow"
avmsa_bypass              = ["AzureServices"]
avmsa_routing             = "MicrosoftRouting"
avmsa_publishinternet     = "false"
avmsa_publishmicrosoft    = "false"
avmsa_accesstier          = "Hot"


#### SA PE #################
sa_private_dns_zone_name     = "privatelink.blob.core.windows.net"
gencoresa_endpoint_name       = "avmgennphsmgmtsub01tf-pe"
gencorepeSubnetName           = "gen-uks-np-hs-pep-snet-01"
gencoreVnetName               = "gen-uks-np-hs-mgmt-vnet-01"
gencoredNetworkingRgName      = "gen-uks-np-hs-mgmt-vnet-rg-01"
gencoresa_endpoint_SC         = "avmgennphsmgmtsub01tf-pesc"
gencorepep_subresource_names  = ["blob"]
