module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

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
  }
}

module "appSSUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

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
  }
}
