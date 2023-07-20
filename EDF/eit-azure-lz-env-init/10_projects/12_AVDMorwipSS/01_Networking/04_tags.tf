module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : " Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "vnettags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : " Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "morwipUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : " Networking"
    "Role" : "UDR"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

############# NSGs ####################
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit"  = "Customers"
    "Major Function" = "Customer Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Category"       = "Infrastructure"
    "Service"        = "Networking"
    "Role"           = "NSG"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
