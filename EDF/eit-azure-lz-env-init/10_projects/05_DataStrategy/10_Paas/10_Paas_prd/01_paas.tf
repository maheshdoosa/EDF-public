
####### Production PaaS Resource

################# Resource Group - MDWHS-PROD VM Logging  #############
module "create-Target-Rg-for-MDWHs-Prd-VmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsPrdVmLogsRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Prd-vmDiagSATags.tagsResult
}

module "vmDiag-StorageAccount-MDWHs-Prd" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.create-Target-Rg-for-MDWHs-Prd-VmLogging.rgName
  resourceLocation                       = var.MDWHsResourceLocation
  storageAccountName                     = var.vmDiagPrdSA
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
  additionalTags                         = module.MDWHs-Prd-vmDiagSATags.tagsResult
  depends_on                             = [module.create-Target-Rg-for-MDWHs-Prd-VmLogging, ]
}

################ Resource Group - MDWHs Subscription Aux Scripts  #############
module "create-Target-Rg-MDWHs-AuxScripts" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsPrdAuxRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Prd-vmDiagSATags.tagsResult
}

module "auxScripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.0"

  resourceGroupName  = module.create-Target-Rg-MDWHs-AuxScripts.rgName
  resourceLocation   = var.MDWHsResourceLocation
  storageAccountName = var.auxScriptsSA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = { container1 = "scripts" } #container name will static

  additionalTags = module.MDWHs-Prd-vmDiagSATags.tagsResult
  depends_on     = [module.create-Target-Rg-MDWHs-AuxScripts]
}

####### UAT PaaS Resource

################# Resource Group - MDWHS-UAT VM Logging  #############
module "create-Target-Rg-for-MDWHs-Uat-VmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsUatVmLogsRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Uat-vmDiagSATags.tagsResult
}

module "vmDiag-StorageAccount-MDWHs-Uat" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.create-Target-Rg-for-MDWHs-Uat-VmLogging.rgName
  resourceLocation                       = var.MDWHsResourceLocation
  storageAccountName                     = var.vmDiagUatSA
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
  additionalTags                         = module.MDWHs-Uat-vmDiagSATags.tagsResult
  depends_on                             = [module.create-Target-Rg-for-MDWHs-Uat-VmLogging, ]
}
############ AVM Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

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
################# Storage Account diagnostic log configuration #######################################
module "sadiagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.sa_diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.vmDiag-StorageAccount-MDWHs-Prd, module.avmsa-StorageAccount, module.vmDiag-StorageAccount-MDWHs-Uat, module.auxScripts-StorageAccount]
}

########### AVM SA Private Endpoint ##############
module "azure-private-endpoint-dns-Integrate-avmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.avmsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
########### AUX SA Private Endpoint ##############
module "azure-private-endpoint-dns-Integrate-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.MDWHsPrdAuxRgName
  endpoint_name                  = var.auxsa_endpoint_name
  resource_Location              = var.MDWHsResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id
  endpoint_SC                    = var.auxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.auxScriptsSA.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
