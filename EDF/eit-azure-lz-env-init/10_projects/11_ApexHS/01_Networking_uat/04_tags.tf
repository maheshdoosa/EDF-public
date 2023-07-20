module "apexuatresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E294-A0-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "apexuatUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E294-A0-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

############# NSGs ####################
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit"  = "Generation"
    "Major Function" = "Nuclear Operations"
    "Cost Centre"    = "8BSB"
    "Project Code"   = "2-E294-A0-MA-01-AAE"
    "Category"       = "Infrastructure"
    "Environment"    = "High Secured Managed"
    "Service"        = "Networking"
    "Role"           = "NSG"
    "Service Level"  = "Live"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
