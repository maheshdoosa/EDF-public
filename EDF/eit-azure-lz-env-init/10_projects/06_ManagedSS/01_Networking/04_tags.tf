module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "745997"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "mngdssUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "745997"
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
    "Project Code"   = "745997"
    "Category"       = "Infrastructure"
    "Environment"    = "Standard Secured Managed"
    "Service"        = "Networking"
    "Role"           = "NSG"
    "Service Level"  = "Live"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
