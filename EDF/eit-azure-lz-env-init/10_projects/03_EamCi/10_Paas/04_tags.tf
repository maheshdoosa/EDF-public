############ AVM Storage Account #######################

module "avmsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Resource Group"
    "Role" : "Storage Account"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
  }
}
module "avmsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Storage Account"
    "Role" : "Blob Storage"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
  }
}
module "lawsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Resource Group"
    "Role" : "Storage Account"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
  }
}
module "lawsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E068-A1-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Storage Account"
    "Role" : "LAW Storage"
    "Service Level" : "Bronze"
    "Owner" : "adam.ashby@edf-energy.com"
    "Support" : "Avanade"
  }
}
