module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "environment" : "Production"
    "Service" : "Resource Group"
    "Role" : "VNET"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "GenIS"
  }
}

module "eamCISsVnetTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "environment" : "Production"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "GenIS"
    "costcentre" : "eit"
  }
}

###########################
module "ciUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Environment" : "Production"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "GenIS"
  }
}

module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Diamond"
    "Cost Centre" : "TAFF"
    "Project Code" : "TBC"
    "Environment" : "Standard Secured"
    "Category" : "Application"
    "Service" : "Networking"
    "Role" : "NSG"
    "Service Level" : "Gold"
    "Owner" : "AzureCloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
