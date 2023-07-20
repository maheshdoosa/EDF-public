############ AVM Storage Account #######################

module "avmsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance",
    "Category" : "Infrastructure",
    "Cost Centre" : "TABB Project",
    "Major Function" : "Enterprise IT",
    "Owner" : "cloudservices@edfenergy.com",
    "Project Code" : "6C040714",
    "Role" : "Storage",
    "Service" : "Resource Group",
    "Service Level" : "Bronze",
    "Support" : "cloudservices@edfenergy.com",
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
    "Role" : "AVM Storage",
    "Service" : "Storage Account",
    "Service Level" : "Bronze",
    "Support" : "cloudservices@edfenergy.com",
  }
}
