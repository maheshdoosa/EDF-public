environment = "Standard Secured Managed"

avdSSKvName   = "avmcusprdssmgmtsub01kv"
avdSSKvRgName = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "cus-uks-prd-ss-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "cus-uks-prd-ss-vmbackup-rg-01"
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

keyvault_name                   = "cus-uks-prd-ss-ade-kv-01"
resource_Location               = "uk south"
kv_resource_group_name          = "cus-uks-prd-ss-ade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false   #need to check
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false   #need to check
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //false //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          // Allow will enable access to all networks
bypass                          = "AzureServices" //none
#environment                             = "Production"
#   aad_group                               = ""
aad_user  = "SVL-AZ-Dean.Lawrence@edfenergynnb.onmicrosoft.com"
aad_user1 = "SVL-AZ-Dipak.Borole@edfenergynnb.onmicrosoft.com"




######### Logging storage account #######
# environment                     =   "Standard Secured Managed"
AVDVmLogsRgName              = "cus-uks-prd-ss-vmlogs-rg-01"
AVDResourceLocation          = "UK South"
vmDiagSA                     = "cusuksprdssvmlogssa01"
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


#### AUX SA ############
cusauxsaRgName           = "cus-uks-prd-ss-auxscripts"
cusauxsaResourceLocation = "UK South"
cusauxsa                 = "cusuksprdssauxscript1"


cusauxsa_accounttier         = "standard"
cusauxsa_storagetype         = "StorageV2"
cusauxsa_accountreptype      = "LRS"
cusauxsa_tlsversion          = "TLS1_2"
cusauxsa_accesstier          = "Hot"
cusauxsa_httpstraffic        = "true"
cusauxsa_publicaccess        = "false"
cusauxsa_hnsenable           = "false"
cusauxsa_nfsv3               = "false"
cusauxsa_largefileshare      = "false"
cusauxsa_blobsoftdelete      = "90"
cusauxsa_containersoftdelete = "90"
cusauxsa_sharesoftdelete     = "90"
cusauxsa_acl                 = "Deny"
cusauxsa_bypass              = ["AzureServices"]
cusauxsa_routing             = "MicrosoftRouting"
cusauxsa_publishinternet     = "false"
cusauxsa_publishmicrosoft    = "false"

##### PE for SA ######
saprivate_dns_zone_name    = "privatelink.blob.core.windows.net"
cusauxsa_resourceGroupName = "cus-uks-prd-ss-auxscripts"
cusauxsa_endpoint_name     = "cusuksprdssauxscript-pe"
cusauxsa_endpoint_SC       = "cusuksprdssauxscript-pesc"
is_manual_connection       = "false" //keep default false
cusauxsa_subresource_names = ["blob"]

cusvmDiagsa_resourceGroupName = "cus-uks-prd-ss-vmlogs-rg-01"
cusvmDiagsa_endpoint_name     = "cusuksprdssvmlogssa01-pe"
cusvmDiagsaResourceLocation   = "UK South"
cusvmDiagsa_endpoint_SC       = "cusuksprdssvmlogssa01-pesc"
cusvmDiagsa_subresource_names = ["blob"]

cuspesubnetName     = "cus-uks-prd-ss-pep-snet-01"
cusVnetName         = "cus-uks-prd-ss-mgmt-vnet-01"
cusNetworkingRgName = "cus-uks-prd-ss-mgmt-vnet-rg-01"
