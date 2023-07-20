# environment                    = "Production"
gennpscriptsRgName    = "gen-uks-prod-hs-auxscripts-rg-01"
gennpResourceLocation = "uksouth"

vmDiagSA        = "genuksprdhsvmlogssa02"
gennpLogsRgName = "gen-uks-prd-hs-vmlogs-rg-01"
vmprepscriptsSA = "genuksprodhsauxscripts"
container       = "scripts"
gennpHSKvName   = "emersonvmtest"
# snowmidHSKvRgName           = ".security"
gennpHSKvRgName = ".security"
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

keyvault_name                   = "gen-uks-prd-hs-ade-kv-01"
resource_Location               = "uk south"
kv_resource_group_name          = "gen-uks-prd-hs-ade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
environment                     = "High Secured Managed"
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
# private_dns_zone_name                   = "privatelink.vault.azure.net"
vnet_dns_link_name      = "gen-uks-prod-hs-ade-kv-pdns-link"
endpoint_name           = "gen-uks-prod-hs-ade-kv-pe"
endpoint_SC             = "gen-uks-prod-hs-ade-kv-pesc"
is_manual_connection    = "false" //keep default false
subresource_names       = ["vault"]
lzgennpNetworkingRgName = "gen-uks-prd-hs-mgmt-vnet-rg-01"
lzgennpVnetName         = "gen-uks-prd-hs-mgmt-vnet-01"
lzgenNetworkingRgName   = "gen-uks-prd-hs-mgmt-vnet-rg-01"
peSubnetName            = "gen-uks-prd-hs-pep-snet-01"
aad_group               = "test_ad_group02_sandpit_for_customrole"
#aad_group                               = "test_ad_group02_stg_for_customrole "
aad_user = "netra.lal.bhushal@azure.edfstaging.io"
#log_analytics_destination_type          = "AzureDiagnostics"
