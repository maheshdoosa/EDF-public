################ Resource Group - managementSS Networking #############
module "createTargetRgForLzmanagementHsNetworking" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagementSSNetworkingRgName
  resourceLocation  = var.lzmanagementSSNetworkingResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}
