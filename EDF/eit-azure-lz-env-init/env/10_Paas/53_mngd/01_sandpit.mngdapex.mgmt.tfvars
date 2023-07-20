
# environment          = "High Secured Managed"
# managedGenHSKvName   = "avmgenprdhsmngdsub01kv"
# managedGenHSKvRgName = ".security"

# ########### Apex Prod TFVARS ##############

# #VM Loging Storage Account

# #########  ApexHS VM Logging storage account #######

# ApexHSprdVmLogsRgName        = "gen-uks-prd-hs-vmlogs-rg-1"
# ApexHSprdscriptsRgName       = "gen-uks-prd-hs-vmscripts-rg-1"
# ApexHSResourceLocation       = "UK South"
# prdvmDiagSA                  = "genuksprdhsvmlogssa1"
# prdscriptsSA                 = "genuksprdhsvmscrtsa1"
# vmDiagSA_accounttier         = "standard"
# vmDiagSA_storagetype         = "StorageV2"
# vmDiagSA_accountreptype      = "LRS"
# vmDiagSA_tlsversion          = "TLS1_2"
# vmDiagSA_accesstier          = "Hot"
# vmDiagSA_httpstraffic        = "true"
# vmDiagSA_publicaccess        = "false"
# vmDiagSA_hnsenable           = "false"
# vmDiagSA_nfsv3               = "false"
# vmDiagSA_largefileshare      = "false"
# vmDiagSA_blobsoftdelete      = "90"
# vmDiagSA_containersoftdelete = "90"
# vmDiagSA_sharesoftdelete     = "90"
# vmDiagSA_acl                 = "Deny"
# vmDiagSA_bypass              = ["AzureServices"]
# vmDiagSA_routing             = "MicrosoftRouting"
# vmDiagSA_publishinternet     = "false"
# vmDiagSA_publishmicrosoft    = "false"

# ######### Recovery Services Vault #######

# ApexHS_recovery_vault_name   = "gen-uks-prd-hs-apex-vmbackup-rsv-1"
# ApexHS_rsv_resourceGroupName = "gen-uks-hs-prd-apex-vmbackup-rg-1"
# sku                          = "standard"
# soft_delete_enabled          = true
# log_analytics_workspace_name = "rsv_logs"
# log_category                 = "CoreAzureBackup"
# log_category_enabled         = true
# log_category_retention       = true
# log_category_retention_days  = 0

# ############ Backup Policies #############

# infraVM_backup_policy_01   = "Daily-2200-52W-AppVMs"
# infraVM_backup_policy_02   = "Daily-2300-52W-AppVMs"
# vm_backup_policy_timezone  = "UTC"
# backup_policy_frequency    = "Daily"
# backup_policy_time_01      = "22:00"
# backup_policy_time_02      = "23:00"
# retention_daily_count      = 7
# retention_weekly_count     = 52
# retention_weekly_weekdays  = ["Sunday"]
# retention_monthly_count    = 12
# retention_monthly_weekdays = ["Sunday", "Wednesday"]
# retention_monthly_weeks    = ["First", "Last"]
# retention_yearly_count     = 1
# retention_yearly_weekdays  = ["Sunday"]
# retention_yearly_weeks     = ["Last"]
# retention_yearly_months    = ["January"]


# #################### KV ################################

# ApexHS_keyvault_name            = "g-uks-prd-hs-apex-adekv"
# ApexHS_kv_resourceGroupName     = "gen-uks-prd-hs-apex-ade-rg-1"
# sku_name                        = "standard" // standard or premium HSM
# enabled_for_deployment          = "false"    //true or false
# enabled_for_disk_encryption     = "true"     //true or false
# enabled_for_template_deployment = "false"    //true or false
# soft_delete_retention_days      = "90"
# purge_protection_enabled        = "true" //true
# diagnosticsetting_name          = "keyVault-diagnostics"
# default_action                  = "Deny"          //Allow will enable access to all networks
# bypass                          = "AzureServices" //none
# ApexHSPrivateDNSRgName          = "gen-uks-prd-hs-apex-pdns-rg"
# private_dns_zone_name           = "privatelink.vaultcore.azure.net"
# vnet_dns_link_name              = "gen-uks-prd-hs-apex-pdns-link"
# ApexHs_Prd_endpoint_name        = "gen-uks-prd-hs-apex-ade-kv-pe"
# ApexHs_Prd_endpoint_SC          = "gen-uks-prd-hs-apex-ade-kv-pesc"
# is_manual_connection            = "false" //keep default false
# subresource_names               = ["vault"]
# ApexHsPrdNetworkingRgName       = "gen-uks-prd-hs-managed-vnet-rg-1"
# ApexHsPrdVnetName               = "gen-uks-prd-hs-managed-vnet-1"
# ApexHsPrdSubnetName             = "gen-uks-prd-hs-apex-snet-1"





/*#########  ApexHS VM Logging storage account #######
environment                     =   "High Secured Managed"
ApexHSVmLogsRgName              =   "gen-uks-stg-dev-hs-vmlogs-rg-01"
ApexHStstVmLogsRgName           =   "gen-uks-stg-tst-hs-vmlogs-rg-01"
ApexHSResourceLocation          =   "UK South"
vmDiagSA                        =   "genstgdevhsvmlogssa02"
vmDiagtstSA                     =   "genstgtsthsvmlogssa01"
vmDiagSA_accounttier            =   "standard"
vmDiagSA_storagetype            =   "StorageV2"
vmDiagSA_accountreptype         =   "LRS"
vmDiagSA_tlsversion             =   "TLS1_2"
vmDiagSA_accesstier             =   "Hot"
vmDiagSA_httpstraffic           =   "true"
vmDiagSA_publicaccess           =   "false"
vmDiagSA_hnsenable              =   "false"
vmDiagSA_nfsv3                  =   "false"
vmDiagSA_largefileshare         =   "false"
vmDiagSA_blobsoftdelete         =   "90"
vmDiagSA_containersoftdelete    =   "90"
vmDiagSA_sharesoftdelete        =   "90"
vmDiagSA_acl                    =   "Deny"
vmDiagSA_bypass                 =   ["AzureServices"]
vmDiagSA_routing                =   "MicrosoftRouting"
vmDiagSA_publishinternet        =   "false"
vmDiagSA_publishmicrosoft       =   "false"




#################### KV ################################

keyvault_name                           = "gen-stg-dev-apex-kvt-01"
keyvault_name_tst                       = "gen-stg-tst-apex-kvt-01"
resource_Location                       = "uk south"
kv_resource_group_name                  = "gen-stg-hs-apex-devkv-rg-01"
kv_resource_group_name_tst              = "gen-stg-hs-apex-tstkv-rg-01"
sku_name                                = "standard"// standard or premium HSM
enabled_for_deployment                  = "false" //true or false
enabled_for_disk_encryption             = "true" //true or false
enabled_for_template_deployment         = "false" //true or false
soft_delete_retention_days              = "90"
purge_protection_enabled                = "true" //true
diagnosticsetting_name                  = "keyVault-diagnostics"
default_action                          = "Deny" //Allow will enable access to all networks
bypass                                  = "AzureServices" //none
#environment                             = "Development"
private_dns_zone_name                   = "privatelink.vaultcore.azure.net"
#private_dns_zone_name                   = "privatelink.vault.azure.net"
vnet_dns_link_name                      = "kv-vnet-dns-link-01"
endpoint_name                           = "eitalzhsapexpkvt-pe"
endpoint_SC                             = "eitalzhsapexpkvt-pesc"
is_manual_connection                    = "false" //keep default false
subresource_names                       = ["vault"]
lzdevNetworkingRgName                   = "eit-uks-alz-stg-am-rg-01"
lztstNetworkingRgName                   = "eit-uks-alz-stg-am-rg-01"
lzdevVnetName                           = "sm-stg-vnet"
lztstVnetName                           = "sm-stg-tst-vnet"
peSubnetName                            = "subnet-2"
peSubnetName_tst                        = "subnet-3"
aad_group                               = "test_ad_group02_stg_for_customrole"
aad_user                                = "sai.devarabhotla@azure.edfstaging.io"
#log_analytics_destination_type          = "AzureDiagnostics"

apexKvName   = "eit-uks-alz-stg-amkv-01"
apexKvRgName = "eit-uks-alz-stg-am-rg-01"

apexDevHSKvName   = "eit-uks-alz-stg-amkv-01"
apexDevHSKvRgName = "eit-uks-alz-stg-am-rg-01"


######### Recovery Services Vault #######

recovery_vault_name          = "gen-stg-dev-hs-vmbackup-rsv-01"
recovery_vault_name_tst      = "gen-stg-tst-hs-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "gen-stg-dev-hs-apex-vmbackup-01"
resourceGroupName_tst        = "gen-stg-tst-hs-apex-vmbackup-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "stganalytics"
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
retention_weekly_weekdays  = ["Sunday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]

infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
backup_policy_time_02    = "23:00*/

KvName   = "avmeitsand01kv"
KvRgName = ".security"

######### Recovery Services Vault #######
environment                  = "High Secured Managed"
recovery_vault_name          = "gen-uks-sand-hs-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "gen-uks-sand-hs-dtgw-vmbackup-01"
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
retention_weekly_weekdays  = ["Sunday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]

infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
backup_policy_time_02    = "23:00"
