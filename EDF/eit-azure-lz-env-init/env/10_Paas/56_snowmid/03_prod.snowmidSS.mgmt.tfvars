# environment                     = "Production"
snowmidSSVmLogsRgName     = "eit-alz-ss-secgov-prdvmlogs-rg-01"
snowmidSSResourceLocation = "uksouth"

vmDiagSA = "eituksalzssprdvmlogssa02"

snowmidSSKvName   = "avmeitalzsssecgovsub01kv"
snowmidSSKvRgName = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "eit-alz-ss-secgov-prdvmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "eit-alz-ss-secgov-prdvmbackup-rg-01"
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

keyvault_name                   = "eit-alz-ss-sgov-pkvt-01"
resource_Location               = "uk south"
kv_resource_group_name          = "eit-alz-ss-secgov-prdade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          // Allow will enable access to all networks
bypass                          = "AzureServices" //none
# environment                             = "Production"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
# dns_resource_group_name                 = "eit-alz-ss-test-dns-rg-01"
# dns_resource_group_name                 = "eit-uks-alz-ss-mgmt-pvtdns-rg"
# private_dns_zone_name                   = "privatelink.vault.azure.net"
# vnet_dns_link_name                      = "kv-vnet-dns-link-01"
endpoint_name             = "eitalzsssgovpkvt-pe"
endpoint_SC               = "eitalzsssgovpkvt-pesc"
is_manual_connection      = "false" //keep default false
subresource_names         = ["vault"]
lzsandpitNetworkingRgName = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
lzsandpitVnetName         = "eit-uks-alz-ss-secgovprd-vnet-01"
peSubnetName              = "eit-alz-ss-midprd-snet-01"
aad_group                 = "EIT-PRD-RBAC-SS-SNOWMID-Contributor"
aad_user                  = "sai.devarabhotla_accenture.com#EXT#@edfenergynnb.onmicrosoft.com"
#log_analytics_destination_type          = "AzureDiagnostics"


#### AUX SA ############
secgovauxsaRgName           = "eit-alz-ss-secgov-auxscripts"
secgovauxsaResourceLocation = "UK South"
mgmtavmsaResourceLocation   = "uksouth"
secgovauxsa                 = "eitalzsssgovauxscriptprd"


secgovauxsa_accounttier         = "standard"
secgovauxsa_storagetype         = "StorageV2"
secgovauxsa_accountreptype      = "LRS"
secgovauxsa_tlsversion          = "TLS1_2"
secgovauxsa_accesstier          = "Hot"
secgovauxsa_httpstraffic        = "true"
secgovauxsa_publicaccess        = "false"
secgovauxsa_hnsenable           = "false"
secgovauxsa_nfsv3               = "false"
secgovauxsa_largefileshare      = "false"
secgovauxsa_blobsoftdelete      = "90"
secgovauxsa_containersoftdelete = "90"
secgovauxsa_sharesoftdelete     = "90"
secgovauxsa_acl                 = "Deny"
secgovauxsa_bypass              = ["AzureServices"]
secgovauxsa_routing             = "MicrosoftRouting"
secgovauxsa_publishinternet     = "false"
secgovauxsa_publishmicrosoft    = "false"
environment                     = "Standard Secured Security Governance"



saprivate_dns_zone_name       = "privatelink.blob.core.windows.net"
secgovauxsa_resourceGroupName = "eit-alz-ss-secgov-auxscripts"
secgovauxsa_endpoint_name     = "eitalzsssgovauxscriptprd-pe"
secgovauxsa_endpoint_SC       = "eitalzsssgovauxscriptprd-pesc"
secgovauxsa_subresource_names = ["blob"]
secgovpesubnetName            = "eit-alz-ss-midprd-pep-snet-01"
secgovVnetName                = "eit-uks-alz-ss-secgovprd-vnet-01"
secgovNetworkingRgName        = "eit-uks-alz-ss-secgovprd-vnet-rg-01"

secgovvmDiagsa_endpoint_name = "eituksalzssprdvmlogssa02-pe"
secgovvmDiagsa_endpoint_SC   = "eituksalzssprdvmlogssa02-pesc"
