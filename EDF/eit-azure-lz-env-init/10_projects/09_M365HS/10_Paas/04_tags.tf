############ AVM Storage Account #######################

module "avmsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Resource Group"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}
module "avmsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance",
    "Category" : "Infrastructure",
    "Cost Centre" : "TABB Project",
    "Major Function" : "Enterprise IT",
    "Owner" : "cloudservices@edfenergy.com",
    "Project Code" : "6C040714",
    "Role" : "AVM",
    "Service" : "Storage Account",
    "Service Level" : "Bronze",
    "Support" : "cloudservices@edfenergy.com",
  }
}
