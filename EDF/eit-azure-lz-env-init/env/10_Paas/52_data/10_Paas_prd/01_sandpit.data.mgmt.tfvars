
prjKvName   = "mdwcommkv"
prjKvRgName = "mdwhs-comm-rg"

MDWHs-Prd-environment = "Production"
MDWHsResourceLocation = "UK South"

########### PaaS Storage Account TFVARS  ################

MDWHsPrdAuxRgName            = "gen-uks-stg-hs-auxscripts-rg-02"
auxScriptsSA                 = "genuksstghsbosauxsa02"
MDWHsPrdVmLogsRgName         = "gen-uks-stg-hs-bosvmlogs-rg-02"
vmDiagPrdSA                  = "genuksstghsbosvmlogsa02"
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

MDWHsPrdRSVName             = "gen-uks-stg-hs-bosvmbackup-rsv-02"
MDWHsPrdRSVRgName           = "gen-uks-hs-stg-bosvmbackup-rg-02"
sku                         = "Standard"
soft_delete_enabled         = true
RSV_diagnosticsetting_name  = "RSV_loganalytics"
log_category                = "CoreAzureBackup"
log_category_enabled        = true
log_category_retention      = true
log_category_retention_days = 0

############ Backup Policies #############

MDWHs_infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
MDWHs_infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
backup_policy_time_01          = "22:00"
backup_policy_time_02          = "23:00"

vm_backup_policy_timezone  = "UTC"
backup_policy_frequency    = "Daily"
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


################# KV TFVARS

MDWHsPrdkvRgName                = "gen-uks-stg-hs-bosade-rg-02"
MDWHsPrdkvName                  = "gen-uks-stg-hs-ade-kv-02"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
KV_diagnosticsetting_name       = "KV_loganalytics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
Backup_Mngt_AppId               = "262044b1-e2ce-469f-a196-69ab7ada62d3"

MDWHsPrivateDNSRgName = "gen-uks-stg-hs-bosdns-rg-02"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
vnet_dns_link_name    = "hsado-vnet-dns-link-02"


MDWHs_Prd_endpoint_name = "genuksstghsadekv-pe"
MDWHs_Prd_endpoint_SC   = "genuksstghsadekv-pesc"
is_manual_connection    = "false" //keep default false
subresource_names       = ["vault"]


MDWHsPrdNetworkingRgName = "mdwhs-prd-vnet-rg"
MDWHsPrdVnetName         = "mdwhs-prd-vnet"
MDWHsPrdSubnetName       = "mdwhs-prd-snet1"
