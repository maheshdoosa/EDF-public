################ Resource Group - managementHs VM Logging  #############
module "createTargetRgForLzmanagementHsLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsLogsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "la-workspace" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-logAnalytics?ref=v1.1.19"

  resourceGroupName = module.createTargetRgForLzmanagementHsLogging.rgName
  resourceLocation  = var.lzHubManagementResourceLocation

  laWorkspaceName = var.laWorkSpaceName
  sku             = "PerGB2018"

  additionalTags = module.laTags.tagsResult
}
