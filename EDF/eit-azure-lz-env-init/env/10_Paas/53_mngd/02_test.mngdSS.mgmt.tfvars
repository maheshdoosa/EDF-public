environment                     = "Test"
lzHubNetworkingResourceLocation = "uksouth"
lzmanagedSSVmLogsRgName         = "gen-uks-tst-ss-vmlogs-rg-01"
lzHubManagedResourceLocation    = "uksouth"

vmDiagSA                     = "genukststssvmlogssa02"
managedSSsaRgLocation        = "uksouth"
managedSSrestoresaRgLocation = "uksouth"
managedSSKvName              = "avmgentstssmngdsub01kv"
managedSSKvRgName            = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "gen-uks-tst-ss-vmbackup-rsv-01"
resourceLocation             = "UK South"
resourceGroupName            = "gen-uks-tst-ss-vmbackup-rg-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0
LaName                       = "eit-uks-alz-ss-loga-01"
La_resource_group_name       = "eit-uks-alz-ss-loga-rg"

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

############ VM Backup ###########
vmName              = "genukststams01"
resource_group_name = "gen-uks-tst-ss-ams-rg-01"

#################### KV ################################
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "false"    //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Allow"         //Allow will enable access to all networks
bypass                          = "AzureServices" //none

########################## Ade KV ######################
ade_keyvault_name                 = "gen-uks-tst-ss-ade-kv-01"
ade_kv_resource_group_name        = "gen-uks-tst-ss-ade-rg-01"
enabled_for_disk_encryption_adekv = "true"


########################## AVM KV ######################
avm_keyvault_name          = "avmgentstssmngdsub01kv"
avm_kv_resource_group_name = ".security"

#### managed aux SA ############
managedSSsaRgName               = "eit-uk-gen-ss-auxscripts"
managedSSsa                     = "genukststssauxscripts"
managedSSsa_accounttier         = "standard"
managedSSsa_storagetype         = "StorageV2"
managedSSsa_accountreptype      = "LRS"
managedSSsa_tlsversion          = "TLS1_2"
managedSSsa_accesstier          = "Hot"
managedSSsa_httpstraffic        = "true"
managedSSsa_publicaccess        = "false"
managedSSsa_hnsenable           = "false"
managedSSsa_nfsv3               = "false"
managedSSsa_largefileshare      = "false"
managedSSsa_blobsoftdelete      = "90"
managedSSsa_containersoftdelete = "90"
managedSSsa_sharesoftdelete     = "90"
managedSSsa_acl                 = "Deny"
managedSSsa_bypass              = ["AzureServices"]
managedSSsa_routing             = "MicrosoftRouting"
managedSSsa_publishinternet     = "false"
managedSSsa_publishmicrosoft    = "false"


############## SA PE ###############
saprivate_dns_zone_name         = "privatelink.blob.core.windows.net"
managedSSvmDiagsa_endpoint_name = "genukststssvmlogssa02-pe"
managedSSvmDiagsa_endpoint_SC   = "genukststssvmlogssa02-pesc"
is_manual_connection            = "false" //keep default false
sa_subresource_names            = ["blob"]

managedSSpesubnetName     = "gen-uks-tst-ss-pep-snet-01"
managedSSVnetName         = "gen-uks-tst-ss-managed-vnet-01"
managedSSNetworkingRgName = "gen-uks-tst-ss-managed-vnet-rg-01"

managedSSauxsa_endpoint_name = "genukststssauxscripts-pe"
managedSSauxsa_endpoint_SC   = "genukststssauxscripts-pesc"

auxSaName = "genukststssauxscripts"
auxRgName = "eit-uk-gen-ss-auxscripts"

#### managed restore SA ############

managedSSrestoresaRgName = ".security1"
#managedSSrestoresaRgLocation = "uksouth"
managedSSrestoresa = "genukststssvmrestoresa01"

managedSSrestoresa_accounttier         = "standard"
managedSSrestoresa_storagetype         = "StorageV2"
managedSSrestoresa_accountreptype      = "LRS"
managedSSrestoresa_tlsversion          = "TLS1_2"
managedSSrestoresa_accesstier          = "Hot"
managedSSrestoresa_httpstraffic        = "true"
managedSSrestoresa_publicaccess        = "false"
managedSSrestoresa_hnsenable           = "false"
managedSSrestoresa_nfsv3               = "false"
managedSSrestoresa_largefileshare      = "false"
managedSSrestoresa_blobsoftdelete      = "90"
managedSSrestoresa_containersoftdelete = "90"
managedSSrestoresa_sharesoftdelete     = "90"
managedSSrestoresa_acl                 = "Deny"
managedSSrestoresa_bypass              = ["AzureServices"]
managedSSrestoresa_routing             = "MicrosoftRouting"
managedSSrestoresa_publishinternet     = "false"
managedSSrestoresa_publishmicrosoft    = "false"

#### PE
managedSSrestoresa_endpoint_name = "genukststssvmrestoresa01-pe"
managedSSrestoresa_endpoint_SC   = "genukststssvmrestoresa01-pesc"
