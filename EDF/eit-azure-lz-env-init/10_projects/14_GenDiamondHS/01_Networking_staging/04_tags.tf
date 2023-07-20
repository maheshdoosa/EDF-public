module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Diamond"
    "Cost Centre" : "TAFF"
    "Project Code" : "TBC"
    "Environment" : "High Secured Lower"
    "Category" : "Application"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "AzureCloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

############## Vnet Tags ###############
module "vnetTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Diamond"
    "Cost Centre" : "TAFF"
    "Project Code" : "TBC"
    "Environment" : "High Secured Lower"
    "Category" : "Application"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "AzureCloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "genDiamondHSUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Diamond"
    "Cost Centre" : "TAFF"
    "Project Code" : "TBC"
    "Environment" : "High Secured Lower"
    "Category" : "Application"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Gold"
    "Owner" : "AzureCloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Diamond"
    "Cost Centre" : "TAFF"
    "Project Code" : "TBC"
    "Environment" : "High Secured"
    "Category" : "Application"
    "Service" : "Networking"
    "Role" : "NSG"
    "Service Level" : "Gold"
    "Owner" : "AzureCloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
