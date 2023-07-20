module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Resource Group"
    "Role" : "VNET"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
  }
}

module "eamCIVnetTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
    "costcentre" : "eit"
  }
}

############################
module "ciUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
  }
}
# module "nsgtags" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = "High Secured Managed"
#   tags = {
#     "Business Unit" : "Generation"
#     "Major Function" : "Nuclear Operations"
#     "Cost Centre" : "8BSB"
#     "Project Code" : "2-E068-A1-MA-01-AAE"
#     "Environment" : "High Secured Managed"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "NSG"
#     "Service Level" : "Bronze"
#     "Owner" : "adam.ashby@edf-energy.com"
#     "Support" : "Avanade"
#   }
# }
