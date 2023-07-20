module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "environment" : "High Secured Managed"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "ciUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "environment" : "High Secured Managed"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TS"
  }
}

############# NSGs ####################
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit"  = "Generation"
    "Major Function" = "Nuclear Operations"
    "Cost Centre"    = "8BSB"
    "Project Code"   = "TBC"
    "Category"       = "Infrastructure"
    "Environment"    = "High Secured Managed"
    "Service"        = "Networking"
    "Role"           = "NSG"
    "Service Level"  = "Live"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
