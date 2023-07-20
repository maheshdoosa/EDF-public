# environment                     = "Test"
# lzHubNetworkingResourceLocation = "uksouth"
snowmidSSVmLogsRgName     = "eit-alz-ss-secgov-prdvmlogs-rg-01"
snowmidSSResourceLocation = "uksouth"

vmDiagSA = "eituksalzssprdvmlogssa01"

snowmidSSKvName   = "mgmtssinfrasecrets"
snowmidSSKvRgName = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "gen-uks-stg-ss-vmbackup-rsv-01"
resourceLocation             = "UK South"
resourceGroupName            = "gen-uks-stg-ss-vmbackup-rg-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0
# LaName                       = "eit-uks-stg-loganalytics-ws-01"
# La_resource_group_name       = "eit-uks-stg-update-rg"

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

keyvault_name                   = "eit-alz-ss-secgov-stgkvt"
resource_Location               = "uk south"
kv_resource_group_name          = "eit-alz-ss-secgov-stgade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "false" //true
diagnosticsetting_name          = "kv-036-diag-ss"
default_action                  = "Deny"          //Alow
bypass                          = "AzureServices" //none
# laWorkspaceName                         = "eit-uks-alz-ss-loga-01"
# cenAuditLaRgName                        = "eit-uks-prd-ss-m365-rg"
# environment                             = "Sandpit"
dns_resource_group_name = "eit-alz-ss-test-dns-rg-01"
private_dns_zone_name   = "privatelink.vaultcore.azure.net"
# private_dns_zone_name                   = "privatelink.vault.azure.net"
# vnet_dns_link_name                      = "vnet-dns-link-01"
endpoint_name             = "eit-ss-stg-stage-kv-pe"
endpoint_SC               = "eit-ss-stg-stage-kv-pesc"
is_manual_connection      = "false" //keep default false
subresource_names         = ["vault"]
lzsandpitNetworkingRgName = "eit-uks-alz-ss-mgmt-vnet-rg2"
lzsandpitVnetName         = "eit-uks-alz-ss-mgmt-vnet-01"
peSubnetName              = "eit-alz-ss-wac-snet-01"
aad_group                 = "test_ad_group02_stg_for_customrole"
aad_user                  = "netra.lal.bhushal@azure.edfstaging.io"
#log_analytics_destination_type          = "AzureDiagnostics"
