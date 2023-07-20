module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "mgmtssUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Management" #var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "Avanade"
  }
}

############# NSGs ####################
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit"  = "Finance"
    "Major Function" = "Enterprise IT"
    "Cost Centre"    = "TABB"
    "Project Code"   = "6C040714"
    "Category"       = "Infrastructure"
    "Environment"    = "Standard Secured Management"
    "Service"        = "Networking"
    "Role"           = "NSG"
    "Service Level"  = "Gold"
    "Owner"          = "CloudServices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
