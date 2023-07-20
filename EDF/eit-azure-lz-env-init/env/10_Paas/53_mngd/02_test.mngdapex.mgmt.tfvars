apexKvName   = "avmgentsthsmngdsub01kv"
apexKvRgName = ".security"

#########  ApexHS VM Logging storage account #######
environment                  = "High Secured Managed"
ApexHSVmLogsRgName           = "gen-uks-dev-hs-vmlogs-rg-01"
ApexHStstVmLogsRgName        = "gen-uks-tst-hs-vmlogs-rg-01"
ApexHSResourceLocation       = "UK South"
vmDiagSA                     = "genuksdevhsvmlogssa02"
vmDiagtstSA                  = "genukststhsvmlogssa01"
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

#################### KV ################################

keyvault_name                   = "gen-dev-hs-apex-kvt-01"
keyvault_name_tst               = "gen-tst-hs-apex-kvt-01"
resource_Location               = "uk south"
kv_resource_group_name          = "gen-uks-hs-apex-devade-rg-01"
kv_resource_group_name_tst      = "gen-uks-hs-apex-tstade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
#environment                             = "Development"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
#private_dns_zone_name = "privatelink.vault.azure.net"
vnet_dns_link_name    = "kv-vnet-dns-link-01"
endpoint_name         = "eitalzhsapexpkvt-pe"
endpoint_SC           = "eitalzhsapexpkvt-pesc"
is_manual_connection  = "false" //keep default false
subresource_names     = ["vault"]
lzdevNetworkingRgName = "gen-uks-dev-hs-managed-vnet-rg-01"
lztstNetworkingRgName = "gen-uks-tst-hs-managed-vnet-rg-01"
lzdevVnetName         = "gen-uks-dev-hs-managed-vnet-01"
lztstVnetName         = "gen-uks-tst-hs-managed-vnet-01"
peSubnetName          = "gen-uks-dev-hs-apex-snet-01"
peSubnetName_tst      = "gen-uks-tst-hs-apex-snet-01"
aad_group             = "GEN-TST-RBAC-HS-EITManaged-Contributor"
aad_user              = "sai.devarabhotla_accenture.com#EXT#@edfenergynnb.onmicrosoft.com"
#log_analytics_destination_type          = "AzureDiagnostics"

apexDevHSKvName   = "avmgentsthsmngdsub01kv"
apexDevHSKvRgName = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "gen-uks-dev-hs-vmbackup-rsv-01"
recovery_vault_name_tst      = "gen-uks-tst-hs-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "gen-uks-dev-hs-apex-vmbackup-01"
resourceGroupName_tst        = "gen-uks-tst-hs-apex-vmbackup-01"
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

################# Vault to generate RSA Keys#########
/*
keys = {
      "key01" = {
        key_name = "apextsths-vm1-encryption"
        key_type = "RSA"
        key_size = "4096"
      },
      "key02" = {
        key_name = "apextsths-vm2-encription"
        key_type = "RSA"
        key_size = "4096"
      }
    }*/


############# auxtstSA SA ####################

auxtstSARgName               = "eit-uk-gen-hs-tst-auxscripts"
auxtstSAResourceLocation     = "uksouth"
auxtstSA                     = "eitukshsapexscripttst"
auxtstSA_accounttier         = "standard"
auxtstSA_storagetype         = "StorageV2"
auxtstSA_accountreptype      = "LRS"
auxtstSA_tlsversion          = "TLS1_2"
auxtstSA_accesstier          = "Hot"
auxtstSA_httpstraffic        = "true"
auxtstSA_publicaccess        = "false"
auxtstSA_hnsenable           = "false"
auxtstSA_nfsv3               = "false"
auxtstSA_largefileshare      = "false"
auxtstSA_acl                 = "Deny"
auxtstSA_bypass              = ["AzureServices"]
auxtstSA_routing             = "MicrosoftRouting"
auxtstSA_publishinternet     = "false"
auxtstSA_publishmicrosoft    = "false"
auxtstSAca                   = "statefiles"
auxtstSA_blobsoftdelete      = "90"
auxtstSA_containersoftdelete = "90"
auxtstSA_sharesoftdelete     = "90"

############# auxdevsa SA ####################

auxdevsaRgName               = "eit-uk-gen-hs-dev-auxscripts"
auxdevsaResourceLocation     = "uksouth"
auxdevsa                     = "eitukshsapexscriptdev"
auxdevsa_accounttier         = "standard"
auxdevsa_storagetype         = "StorageV2"
auxdevsa_accountreptype      = "LRS"
auxdevsa_tlsversion          = "TLS1_2"
auxdevsa_accesstier          = "Hot"
auxdevsa_httpstraffic        = "true"
auxdevsa_publicaccess        = "false"
auxdevsa_hnsenable           = "false"
auxdevsa_nfsv3               = "false"
auxdevsa_largefileshare      = "false"
auxdevsa_acl                 = "Deny"
auxdevsa_bypass              = ["AzureServices"]
auxdevsa_routing             = "MicrosoftRouting"
auxdevsa_publishinternet     = "false"
auxdevsa_publishmicrosoft    = "false"
auxdevsaca                   = "statefiles"
auxdevsa_blobsoftdelete      = "90"
auxdevsa_containersoftdelete = "90"
auxdevsa_sharesoftdelete     = "90"

############ SA PE #############

apextstpesubnetName = "gen-uks-dev-hs-pep-snet-01"
apextstpeVnetName   = "gen-uks-dev-hs-managed-vnet-01"
apextstpeVnetRgName = "gen-uks-dev-hs-managed-vnet-rg-01"

saprivate_dns_zone_name = "privatelink.blob.core.windows.net"
vmDiagDev_endpoint_name = "genuksdevhsvmlogssa02-pe"
vmDiagDev_endpoint_SC   = "genuksdevhsvmlogssa02-pesc"
sa_subresource_names    = ["blob"]

vmDiagtst_endpoint_name = "genukststhsvmlogssa01-pe"
vmDiagtst_endpoint_SC   = "genukststhsvmlogssa01-pesc"

auxdev_endpoint_name = "eitukshsapexscriptdev-pe"
auxdev_endpoint_SC   = "eitukshsapexscriptdev-pesc"

auxtst_endpoint_name = "eitukshsapexscripttst-pe"
auxtst_endpoint_SC   = "eitukshsapexscripttst-pesc"

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
