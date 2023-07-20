module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    "Role" : "MID Server VNET"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "hssecgovUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    "Role" : "MID Server UDR"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

############# NSGs ####################
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit"  = "Finance"
    "Major Function" = "Enterprise IT"
    "Cost Centre"    = "6C040714"
    "Project Code"   = "TBC"
    "Category"       = "Infrastructure"
    "Environment"    = "High Secured Security Governance"
    "Service"        = "SNOW MID Services"
    "Role"           = "MID Server NSG"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
