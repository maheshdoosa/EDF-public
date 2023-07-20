################ Resource Group - managementHs VM Logging  #############
module "createTargetRgForLzmanagementHsVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsVmLogsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.vmlogsaRgName
  resourceLocation                       = var.vmlogsaResourceLocation
  storageAccountName                     = var.vmlogsa
  account_tier                           = var.vmlogsa_accounttier
  storagetype                            = var.vmlogsa_storagetype
  account_replication_type               = var.vmlogsa_accountreptype
  minTlsVersion                          = var.vmlogsa_tlsversion
  access_tier                            = var.vmlogsa_accesstier
  enable_https_traffic                   = var.vmlogsa_httpstraffic
  blob_public_access                     = var.vmlogsa_publicaccess
  hns_enabled                            = var.vmlogsa_hnsenable
  nfsv3_enabled                          = var.vmlogsa_nfsv3
  large_file_share                       = var.vmlogsa_largefileshare
  blob_soft_delete_retention_days        = var.vmlogsa_blobsoftdelete
  container_delete_retention_policy_days = var.vmlogsa_containersoftdelete
  share_soft_delete_retention_days       = var.vmlogsa_sharesoftdelete
  network_acl_action                     = var.vmlogsa_acl
  microsoft_trusted_services             = var.vmlogsa_bypass
  routing_preference                     = var.vmlogsa_routing
  publish_internet_endpoints             = var.vmlogsa_publishinternet
  publish_microsoft_endpoints            = var.vmlogsa_publishmicrosoft
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.createTargetRgForLzmanagementHsVmLogging]
}


################ Resource Group - managementHs Subscription Logging  #############
module "createTargetRgForLzmanagementHsSubLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsSubLogsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}
module "subLogs-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.auditsaRgName
  resourceLocation                       = var.auditsaResourceLocation
  storageAccountName                     = var.auditsa
  account_tier                           = var.auditsa_accounttier
  storagetype                            = var.auditsa_storagetype
  account_replication_type               = var.auditsa_accountreptype
  minTlsVersion                          = var.auditsa_tlsversion
  access_tier                            = var.auditsa_accesstier
  enable_https_traffic                   = var.auditsa_httpstraffic
  blob_public_access                     = var.auditsa_publicaccess
  hns_enabled                            = var.auditsa_hnsenable
  nfsv3_enabled                          = var.auditsa_nfsv3
  large_file_share                       = var.auditsa_largefileshare
  blob_soft_delete_retention_days        = var.auditsa_blobsoftdelete
  container_delete_retention_policy_days = var.auditsa_containersoftdelete
  share_soft_delete_retention_days       = var.auditsa_sharesoftdelete
  network_acl_action                     = var.auditsa_acl
  microsoft_trusted_services             = var.auditsa_bypass
  routing_preference                     = var.auditsa_routing
  publish_internet_endpoints             = var.auditsa_publishinternet
  publish_microsoft_endpoints            = var.auditsa_publishmicrosoft
  additionalTags                         = module.subAuditLogsSATags.tagsResult
  depends_on                             = [module.createTargetRgForLzmanagementHsSubLogging]
}
module "EnforceImmutability" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage/immutability?ref=v1.1.19"
  resourceGroupName  = module.createTargetRgForLzmanagementHsSubLogging.rgName
  storageAccountName = var.subLogsSA

  containers = {
    container1 = "insights-activity-logs" #container created automatically
  }

  immutabilityPeriod = var.subLogsSAImmutabilityRententionPeriod

  tenantId        = data.azurerm_key_vault_secret.tenantId.value
  subscriptionId  = data.azurerm_key_vault_secret.subscriptionId.value
  spApplicationId = data.azurerm_key_vault_secret.contributorSpId.value
  spSecret        = data.azurerm_key_vault_secret.contributorSpSecret.value
}

################ Resource Group - managementHs Subscription Aux Scripts  #############
module "createTargetRgForLzmanagementHsAuxScripts" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsAuxScriptsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}
module "auxScripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.auxsaRgName
  resourceLocation                       = var.auxsaResourceLocation
  storageAccountName                     = var.auxsa
  account_tier                           = var.auxsa_accounttier
  storagetype                            = var.auxsa_storagetype
  account_replication_type               = var.auxsa_accountreptype
  minTlsVersion                          = var.auxsa_tlsversion
  access_tier                            = var.auxsa_accesstier
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
  additionalTags                         = module.subAuditLogsSATags.tagsResult
  depends_on                             = [module.createTargetRgForLzmanagementHsAuxScripts]
}


# ################ Resource Group - managementHS Image Build  #############
module "createTargetRgForLzmanagementHSVmimage" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHSVmimageRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.vmimageTags.tagsResult
}

# ################ Shared image gallery - managementHS Image Build  #############
module "createTargetsigForLzmanagementHSVmimage" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImagegallery?ref=v1.1.19"

  SIgallery       = var.SIgalleryname #"test_image_gallery_tfcode"
  SIresourcegroup = var.lzmanagementHSVmimageRgName
  SIlocation      = var.lzHubManagementResourceLocation
  depends_on = [
    module.createTargetRgForLzmanagementHSVmimage,
  ]
}

# # ################ Shared image gallery Image - managementHS Image Build  #############
module "createTargetimageForLzmanagementHSVmimage" {
  source                   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImage?ref=v1.1.19"
  for_each                 = var.images
  sharedimagename          = each.value.sharedimagename
  Sharedimagegalleryname   = each.value.Sharedimagegalleryname
  sharedimageresourcegroup = each.value.sharedimageresourcegroup
  sharedimagelocation      = each.value.sharedimagelocation
  os_type                  = each.value.os_type
  publisher                = each.value.publisher
  offer                    = each.value.offer
  sku                      = each.value.sku
  planpurchase             = each.value.planpurchase
  planpublisher            = each.value.planpublisher
  planproduct              = each.value.planproduct

  depends_on = [
    module.createTargetsigForLzmanagementHSVmimage,
  ]
}


############ Storage account for mgmt ADDS ################

module "createTargetRgFormgmtaddssa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.mgmtaddssaRgName
  resourceLocation  = var.mgmtaddssaResourceLocation

  additionalTags = module.mgmtaddsRGTags.tagsResult
}

module "mgmtaddsStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.mgmtaddssaRgName
  resourceLocation                       = var.mgmtaddssaResourceLocation
  storageAccountName                     = var.mgmtaddssa
  account_tier                           = var.mgmtaddssa_accounttier
  storagetype                            = var.mgmtaddssa_storagetype
  account_replication_type               = var.mgmtaddssa_accountreptype
  minTlsVersion                          = var.mgmtaddssa_tlsversion
  access_tier                            = var.mgmtaddssa_accesstier
  enable_https_traffic                   = var.mgmtaddssa_httpstraffic
  blob_public_access                     = var.mgmtaddssa_publicaccess
  hns_enabled                            = var.mgmtaddssa_hnsenable
  nfsv3_enabled                          = var.mgmtaddssa_nfsv3
  large_file_share                       = var.mgmtaddssa_largefileshare
  blob_soft_delete_retention_days        = var.mgmtaddssa_blobsoftdelete
  container_delete_retention_policy_days = var.mgmtaddssa_containersoftdelete
  share_soft_delete_retention_days       = var.mgmtaddssa_sharesoftdelete
  network_acl_action                     = var.mgmtaddssa_acl
  microsoft_trusted_services             = var.mgmtaddssa_bypass
  routing_preference                     = var.mgmtaddssa_routing
  publish_internet_endpoints             = var.mgmtaddssa_publishinternet
  publish_microsoft_endpoints            = var.mgmtaddssa_publishmicrosoft
  additionalTags                         = module.mgmtaddssaTags.tagsResult
  depends_on                             = [module.createTargetRgFormgmtaddssa]

}


############ Storage account for mgmt NTC ################

module "createTargetRgFormgmtntcsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.mgmtntcsaRgName
  resourceLocation  = var.mgmtntcsaResourceLocation

  additionalTags = module.mgmtntcRGTags.tagsResult
}

module "mgmtntcStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.mgmtntcsaRgName
  resourceLocation                       = var.mgmtntcsaResourceLocation
  storageAccountName                     = var.mgmtntcsa
  account_tier                           = var.mgmtntcsa_accounttier
  storagetype                            = var.mgmtntcsa_storagetype
  account_replication_type               = var.mgmtntcsa_accountreptype
  minTlsVersion                          = var.mgmtntcsa_tlsversion
  access_tier                            = var.mgmtntcsa_accesstier
  enable_https_traffic                   = var.mgmtntcsa_httpstraffic
  blob_public_access                     = var.mgmtntcsa_publicaccess
  hns_enabled                            = var.mgmtntcsa_hnsenable
  nfsv3_enabled                          = var.mgmtntcsa_nfsv3
  large_file_share                       = var.mgmtntcsa_largefileshare
  blob_soft_delete_retention_days        = var.mgmtntcsa_blobsoftdelete
  container_delete_retention_policy_days = var.mgmtntcsa_containersoftdelete
  share_soft_delete_retention_days       = var.mgmtntcsa_sharesoftdelete
  network_acl_action                     = var.mgmtntcsa_acl
  microsoft_trusted_services             = var.mgmtntcsa_bypass
  routing_preference                     = var.mgmtntcsa_routing
  publish_internet_endpoints             = var.mgmtntcsa_publishinternet
  publish_microsoft_endpoints            = var.mgmtntcsa_publishmicrosoft
  additionalTags                         = module.mgmtntcsaTags.tagsResult
  depends_on                             = [module.createTargetRgFormgmtntcsa]

}

#### management HS vmDiagSA SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-mgmtHS-vmDiagSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.mgmtvmDiagHSsaRgName
  endpoint_name                  = var.mgmtvmDiagHSauxsa_endpoint_name
  resource_Location              = var.mgmtResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id //
  endpoint_SC                    = var.mgmtvmDiagHSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtvmDiagHSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### management HS subLogs SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-mgmtHS-subLogs" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.lzmanagementHsSubLogsRgName
  endpoint_name                  = var.mgmtsubLogsHSauxsa_endpoint_name
  resource_Location              = var.mgmtResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id //
  endpoint_SC                    = var.mgmtsubLogsHSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtHSsubLogssa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.subAuditLogsSATags.tagsResult
}
######### auxScripts SA PE #################
module "azure-private-endpoint-dns-Integrate-mgmtHS-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.lzmanagementHsAuxScriptsRgName
  endpoint_name                  = var.mgmtHSauxsa_endpoint_name
  resource_Location              = var.mgmtResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id //
  endpoint_SC                    = var.mgmtHSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtHSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.auxScriptsSATags.tagsResult
}
########## ADDS SA PE ################
module "azure-private-endpoint-dns-Integrate-mgmtHS-addssa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.mgmtaddssaRgName
  endpoint_name                  = var.mgmtHSaddssa_endpoint_name
  resource_Location              = var.mgmtResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id //
  endpoint_SC                    = var.mgmtHSaddssa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtHSaddssa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.mgmtaddssaTags.tagsResult
}
######## ntc SA PE #############
module "azure-private-endpoint-dns-Integrate-mgmtHS-ntcsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.mgmtntcsaRgName
  endpoint_name                  = var.mgmtHSntcsa_endpoint_name
  resource_Location              = var.mgmtResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id //
  endpoint_SC                    = var.mgmtHSntcsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtHSntcsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.mgmtntcsaTags.tagsResult

}
############ avmeit Storage Account #######################

module "createTargetRgForavmeit" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.avmeitRgName
  resourceLocation  = var.avmeitResourceLocation
  additionalTags    = module.avmeitresourceGroupTags.tagsResult
}

module "avmeit-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName           = var.avmeitRgName
  resourceLocation            = var.avmeitResourceLocation
  storageAccountName          = var.avmeit
  account_tier                = var.avmeit_accounttier
  storagetype                 = var.avmeit_storagetype
  account_replication_type    = var.avmeit_accountreptype
  minTlsVersion               = var.avmeit_tlsversion
  access_tier                 = var.avmeit_accesstier
  enable_https_traffic        = var.avmeit_httpstraffic
  blob_public_access          = var.avmeit_publicaccess
  hns_enabled                 = var.avmeit_hnsenable
  nfsv3_enabled               = var.avmeit_nfsv3
  large_file_share            = var.avmeit_largefileshare
  network_acl_action          = var.avmeit_acl
  microsoft_trusted_services  = var.avmeit_bypass
  routing_preference          = var.avmeit_routing
  publish_internet_endpoints  = var.avmeit_publishinternet
  publish_microsoft_endpoints = var.avmeit_publishmicrosoft
  additionalTags              = module.avmeitTags.tagsResult
  depends_on                  = [module.createTargetRgForavmeit]
}
module "tfstate-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName           = var.tfstateRgName
  resourceLocation            = var.tfstateResourceLocation
  storageAccountName          = var.tfstate
  account_tier                = var.tfstate_accounttier
  storagetype                 = var.tfstate_storagetype
  account_replication_type    = var.tfstate_accountreptype
  minTlsVersion               = var.tfstate_tlsversion
  access_tier                 = var.tfstate_accesstier
  enable_https_traffic        = var.tfstate_httpstraffic
  blob_public_access          = var.tfstate_publicaccess
  hns_enabled                 = var.tfstate_hnsenable
  nfsv3_enabled               = var.tfstate_nfsv3
  large_file_share            = var.tfstate_largefileshare
  network_acl_action          = var.tfstate_acl
  microsoft_trusted_services  = var.tfstate_bypass
  routing_preference          = var.tfstate_routing
  publish_internet_endpoints  = var.tfstate_publishinternet
  publish_microsoft_endpoints = var.tfstate_publishmicrosoft
  additionalTags              = module.tfstateTags.tagsResult
  depends_on                  = [module.createTargetRgForavmeit]
}
########### AVMEIT HS SA private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-avmeit" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.avmeitRgName
  endpoint_name                  = var.avmeit_privateEndpoint_name
  resource_Location              = var.avmeitResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id
  endpoint_SC                    = var.avmeit_privateEndpoint_sc
  private_connection_resource_id = data.azurerm_storage_account.avmeit.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
########### tfstate HS SA private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-tfstate" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.tfstateRgName
  endpoint_name                  = var.tfstate_privateEndpoint_name
  resource_Location              = var.avmeitResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtHSpesubnet.id
  endpoint_SC                    = var.tfstate_privateEndpoint_sc
  private_connection_resource_id = data.azurerm_storage_account.tfstate.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.mgmtsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
module "auxScripts-StorageAccount-Container" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.1.19"

  container_name     = var.container
  storageAccountName = var.auxsa
}

############ EIT DevOps RG #######################

module "createTargetRgForEITDevOpsApp" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.EITDevopsAppRgName
  resourceLocation  = var.eitdevopsResourceLocation
  additionalTags    = module.eitdevopsresourceGroupTags.tagsResult
}

module "createTargetRgForEITDevOpsPacker" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.EITDevopsPackerRgName
  resourceLocation  = var.eitdevopsResourceLocation
  additionalTags    = module.eitdevopsresourceGroupTags.tagsResult
}

module "createTargetRgForEITDevOpsctrl" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.EITDevopsctrlplaneRgName
  resourceLocation  = var.eitdevopsResourceLocation
  additionalTags    = module.eitdevopsresourceGroupTags.tagsResult
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
  depends_on                 = [module.vmDiag-StorageAccount, module.subLogs-StorageAccount, module.auxScripts-StorageAccount, module.mgmtaddsStorageAccount, module.mgmtntcStorageAccount, module.avmeit-StorageAccount, module.tfstate-StorageAccount, module.azurestorageaccountAFS]
}
