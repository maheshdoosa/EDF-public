
################ APEX Production Resources ######################

################# Resource Group - ApexHS-prd VM Logging  #############
module "createTargetRgForApexHSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ApexHSprdVmLogsRgName
  resourceLocation  = var.ApexHSResourceLocation

  additionalTags = module.ApexHsuatresourceGroupTags.tagsResult
}


module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.ApexHSprdVmLogsRgName
  resourceLocation                       = var.ApexHSResourceLocation
  storageAccountName                     = var.prdvmDiagSA
  account_tier                           = var.vmDiagSA_accounttier
  storagetype                            = var.vmDiagSA_storagetype
  account_replication_type               = var.vmDiagSA_accountreptype
  minTlsVersion                          = var.vmDiagSA_tlsversion
  access_tier                            = var.vmDiagSA_accesstier
  enable_https_traffic                   = var.vmDiagSA_httpstraffic
  blob_public_access                     = var.vmDiagSA_publicaccess
  hns_enabled                            = var.vmDiagSA_hnsenable
  nfsv3_enabled                          = var.vmDiagSA_nfsv3
  large_file_share                       = var.vmDiagSA_largefileshare
  blob_soft_delete_retention_days        = var.vmDiagSA_blobsoftdelete
  container_delete_retention_policy_days = var.vmDiagSA_containersoftdelete
  share_soft_delete_retention_days       = var.vmDiagSA_sharesoftdelete
  network_acl_action                     = var.vmDiagSA_acl
  microsoft_trusted_services             = var.vmDiagSA_bypass
  routing_preference                     = var.vmDiagSA_routing
  publish_internet_endpoints             = var.vmDiagSA_publishinternet
  publish_microsoft_endpoints            = var.vmDiagSA_publishmicrosoft

  additionalTags = module.vmDiagSATags.tagsResult
  depends_on     = [module.createTargetRgForApexHSVmLogging]

}


################ Resource Group - Apex Hs Subscription domain join Scripts  #############
module "create-Target-Rg-Apex-Scripts" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ApexHSprdscriptsRgName
  resourceLocation  = var.ApexHSResourceLocation

  additionalTags = module.ApexHsuatresourceGroupTags.tagsResult
}

module "auxScripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"

  resourceGroupName                      = var.ApexHSprdscriptsRgName
  resourceLocation                       = var.ApexHSResourceLocation
  storageAccountName                     = var.prdscriptsSA
  minTlsVersion                          = var.auxScripts_minTlsVersion
  account_tier                           = var.auxScripts_account_tier
  account_replication_type               = var.auxScripts_account_replication_type
  storagetype                            = var.auxScripts_storagetype
  enable_https_traffic                   = var.auxScripts_enable_https_traffic
  blob_public_access                     = var.auxScripts_blob_public_access
  hns_enabled                            = var.auxScripts_hns_enabled
  nfsv3_enabled                          = var.auxScripts_nfsv3_enabled
  large_file_share                       = var.auxScripts_large_file_share
  blob_soft_delete_retention_days        = var.auxScripts_blob_soft_delete_retention_days
  container_delete_retention_policy_days = var.auxScripts_container_delete_retention_policy_days
  share_soft_delete_retention_days       = var.auxScripts_share_soft_delete_retention_days
  routing_preference                     = var.auxScripts_routing_preference
  publish_internet_endpoints             = var.auxScripts_publish_internet_endpoints
  publish_microsoft_endpoints            = var.auxScripts_publish_microsoft_endpoints
  network_acl_action                     = var.auxScripts_network_acl_action
  microsoft_trusted_services             = var.auxScripts_microsoft_trusted_services
  containers                             = { container1 = "scripts" } #container name will static
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.create-Target-Rg-Apex-Scripts]

}

############ AVM Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.avmsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.avmsaresourceGroupTags.tagsResult
}

module "avmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName           = var.avmsaRgName
  resourceLocation            = var.avmsaResourceLocation
  storageAccountName          = var.avmsa
  account_tier                = var.avmsa_accounttier
  storagetype                 = var.avmsa_storagetype
  account_replication_type    = var.avmsa_accountreptype
  minTlsVersion               = var.avmsa_tlsversion
  access_tier                 = var.avmsa_accesstier
  enable_https_traffic        = var.avmsa_httpstraffic
  blob_public_access          = var.avmsa_publicaccess
  hns_enabled                 = var.avmsa_hnsenable
  nfsv3_enabled               = var.avmsa_nfsv3
  large_file_share            = var.avmsa_largefileshare
  network_acl_action          = var.avmsa_acl
  microsoft_trusted_services  = var.avmsa_bypass
  routing_preference          = var.avmsa_routing
  publish_internet_endpoints  = var.avmsa_publishinternet
  publish_microsoft_endpoints = var.avmsa_publishmicrosoft
  additionalTags              = module.avmsaTags.tagsResult
  depends_on                  = [module.createTargetRgForavmsa]
}
############ avmgen Storage Account #######################

module "avmgen-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName           = var.avmgenRgName
  resourceLocation            = var.avmgenResourceLocation
  storageAccountName          = var.avmgen
  account_tier                = var.avmgen_accounttier
  storagetype                 = var.avmgen_storagetype
  account_replication_type    = var.avmgen_accountreptype
  minTlsVersion               = var.avmgen_tlsversion
  access_tier                 = var.avmgen_accesstier
  enable_https_traffic        = var.avmgen_httpstraffic
  blob_public_access          = var.avmgen_publicaccess
  hns_enabled                 = var.avmgen_hnsenable
  nfsv3_enabled               = var.avmgen_nfsv3
  large_file_share            = var.avmgen_largefileshare
  network_acl_action          = var.avmgen_acl
  microsoft_trusted_services  = var.avmgen_bypass
  routing_preference          = var.avmgen_routing
  publish_internet_endpoints  = var.avmgen_publishinternet
  publish_microsoft_endpoints = var.avmgen_publishmicrosoft
  additionalTags              = module.avmgenTags.tagsResult
}


#### Apex UAT auxscript SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-auxScripts" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.ApexHSprdscriptsRgName
  endpoint_name                  = var.auxScripts_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.auxScriptspesubnet.id //
  endpoint_SC                    = var.auxScripts_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.auxScriptssa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.auxScripts_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### Apex UAT vmlogs SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-vmlogs" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.ApexHSprdVmLogsRgName
  endpoint_name                  = var.vmlogs_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.auxScriptspesubnet.id //
  endpoint_SC                    = var.vmlogs_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.vmlogssa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.auxScripts_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

#### Apex UAT avmtst SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-avmsatst" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsatst_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.auxScriptspesubnet.id //
  endpoint_SC                    = var.avmsatst_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsatst.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.auxScripts_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

#### Apex UAT avmnp SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-avmsanp" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsanp_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.auxScriptspesubnet.id //
  endpoint_SC                    = var.avmsanp_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsanp.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.auxScripts_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
################# Storage Account diagnostic log configuration #######################################
module "sadiagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.sa_diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.vmDiag-StorageAccount, module.auxScripts-StorageAccount, module.avmsa-StorageAccount, module.avmgen-StorageAccount]
}
