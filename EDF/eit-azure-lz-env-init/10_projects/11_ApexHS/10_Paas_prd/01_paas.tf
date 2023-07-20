
################ APEX Production Resources ######################

################# Resource Group - ApexHS-prd VM Logging  #############
module "createTargetRgForApexHSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ApexHSprdVmLogsRgName
  resourceLocation  = var.ApexHSResourceLocation

  additionalTags = module.ApexHs-Prd-st-resourceGroupTags.tagsResult
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
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.createTargetRgForApexHSVmLogging, ]
}


################ Resource Group - Apex Hs Subscription domain join Scripts  #############
module "create-Target-Rg-Apex-Scripts" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ApexHSprdscriptsRgName
  resourceLocation  = var.ApexHSResourceLocation

  additionalTags = module.ApexHs-Prd-st-resourceGroupTags.tagsResult
}

module "auxScripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"

  resourceGroupName                      = var.ApexHSprdscriptsRgName
  resourceLocation                       = var.ApexHSResourceLocation
  storageAccountName                     = var.auxScriptsSA
  account_replication_type               = var.auxScriptsSA_account_replication_type
  account_tier                           = var.auxScriptsSA_account_tier
  minTlsVersion                          = var.auxScriptsSA_minTlsVersion
  storagetype                            = var.auxScriptsSA_storagetype
  enable_https_traffic                   = var.auxScriptsSA_enable_https_traffic
  blob_public_access                     = var.auxScriptsSA_blob_public_access
  hns_enabled                            = var.auxScriptsSA_hns_enabled
  nfsv3_enabled                          = var.auxScriptsSA_nfsv3_enabled
  large_file_share                       = var.auxScriptsSA_large_file_share
  blob_soft_delete_retention_days        = var.auxScriptsSA_blob_soft_delete_retention_days
  container_delete_retention_policy_days = var.auxScriptsSA_container_delete_retention_policy_days
  share_soft_delete_retention_days       = var.auxScriptsSA_share_soft_delete_retention_days
  routing_preference                     = var.auxScriptsSA_routing_preference
  publish_internet_endpoints             = var.auxScriptsSA_publish_internet_endpoints
  publish_microsoft_endpoints            = var.auxScriptsSA_publish_microsoft_endpoints
  network_acl_action                     = var.auxScriptsSA_network_acl_action
  microsoft_trusted_services             = var.auxScriptsSA_microsoft_trusted_services
  containers                             = { container1 = "scripts" } #container name will static

  additionalTags = module.vmDiagSATags.tagsResult
  depends_on     = [module.create-Target-Rg-Apex-Scripts]
}
############ avmsa Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.avmsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.avmsaresourceGroupTags.tagsResult
}

module "avmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName        = var.avmsaRgName
  resourceLocation         = var.avmsaResourceLocation
  storageAccountName       = var.avmsa
  account_tier             = var.avmsa_accounttier
  storagetype              = var.avmsa_storagetype
  account_replication_type = var.avmsa_accountreptype
  minTlsVersion            = var.avmsa_tlsversion
  access_tier              = var.avmsa_accesstier
  enable_https_traffic     = var.avmsa_httpstraffic
  blob_public_access       = var.avmsa_publicaccess
  hns_enabled              = var.avmsa_hnsenable
  nfsv3_enabled            = var.avmsa_nfsv3
  large_file_share         = var.avmsa_largefileshare
  # blob_soft_delete_retention_days        = var.avmsa_blobsoftdelete
  # container_delete_retention_policy_days = var.avmsa_containersoftdelete
  # share_soft_delete_retention_days       = var.avmsa_sharesoftdelete
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
  depends_on                 = [module.vmDiag-StorageAccount, module.auxScripts-StorageAccount, module.avmsa-StorageAccount]
}
# will be enabled post PE subnet created
#### Apex vmDiag SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-vmDiagSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.ApexHSprdVmLogsRgName
  endpoint_name                  = var.vmDiagSA_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.vmDiagSA_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.vmDiagSA.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### Apex auxScripts SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-auxScriptsSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.ApexHSprdscriptsRgName
  endpoint_name                  = var.auxScriptsSA_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.auxScriptsSA_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.auxScriptsSA.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### Apex avm SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-avmSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmSA_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.avmSA_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmSA.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.avmsaTags.tagsResult
}
