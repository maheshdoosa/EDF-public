
####### Production PaaS Resource

################# Resource Group - MDWHS-TEST VM Logging  #############
module "create-Target-Rg-for-MDWHs-Tst-VmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsTstVmLogsRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Tst-vmDiagSATags.tagsResult
}

module "vmDiag-StorageAccount-MDWHs-Tst" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.create-Target-Rg-for-MDWHs-Tst-VmLogging.rgName
  resourceLocation                       = var.MDWHsResourceLocation
  storageAccountName                     = var.vmDiagTstSA
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
  additionalTags                         = module.MDWHs-Tst-vmDiagSATags.tagsResult
  depends_on                             = [module.create-Target-Rg-for-MDWHs-Tst-VmLogging, ]
}

################ Resource Group - MDWHs Subscription Aux Scripts  #############
module "create-Target-Rg-MDWHs-AuxScripts" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsTstAuxRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Tst-vmDiagSATags.tagsResult
}

module "auxScripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"

  resourceGroupName                      = module.create-Target-Rg-MDWHs-AuxScripts.rgName
  resourceLocation                       = var.MDWHsResourceLocation
  storageAccountName                     = var.auxScriptsSA
  minTlsVersion                          = var.auxsa_tlsversion
  account_replication_type               = var.auxsa_accountreptype
  account_tier                           = var.auxsa_accounttier
  storagetype                            = var.auxsa_storagetype
  enable_https_traffic                   = var.auxsa_httpstraffic
  blob_public_access                     = var.auxsa_publicaccess
  hns_enabled                            = var.auxsa_hnsenable
  nfsv3_enabled                          = var.auxsa_nfsv3
  large_file_share                       = var.auxsa_largefileshare
  blob_soft_delete_retention_days        = var.auxsa_blobsoftdelete
  container_delete_retention_policy_days = var.auxsa_containersoftdelete
  share_soft_delete_retention_days       = var.auxsa_sharesoftdelete
  network_acl_action                     = var.auxsa_acl
  microsoft_trusted_services             = var.auxsa_bypass
  routing_preference                     = var.auxsa_routing
  publish_internet_endpoints             = var.auxsa_publishinternet
  publish_microsoft_endpoints            = var.auxsa_publishmicrosoft

  containers = { container1 = "scripts" } #container name will static

  additionalTags = module.MDWHs-Tst-vmDiagSATags.tagsResult
  depends_on     = [module.create-Target-Rg-MDWHs-AuxScripts]
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
  depends_on                 = [module.avmsa-StorageAccount, module.auxScripts-StorageAccount, module.vmDiag-StorageAccount-MDWHs-Tst]
}
### will be enabled post pep subnet added
/*
########### Data HS vmDiag Storage Account private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-vmDiagsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.MDWHsTstVmLogsRgName
  endpoint_name                  = var.vmDiagsa_endpoint_name
  resource_Location              = var.MDWHsResourceLocation
  subnet_id                      = data.azurerm_subnet.pepsubnet.id //
  endpoint_SC                    = var.vmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.vmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
########### Data HS avm Storage Account private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-avmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.MDWHsResourceLocation
  subnet_id                      = data.azurerm_subnet.pepsubnet.id //
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
########### Data HS aux Storage Account private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.MDWHsTstAuxRgName
  endpoint_name                  = var.auxsa_endpoint_name
  resource_Location              = var.MDWHsResourceLocation
  subnet_id                      = data.azurerm_subnet.pepsubnet.id //
  endpoint_SC                    = var.auxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.auxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
} */

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
