########### sql Rg Tags ##############
module "genlwrSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "New Generation"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage Account"
    "Role" : "Blob Storage"
    "Service Level" : "Gold"
    "Owner" : "saul.graff@edf-energy.com"
    "Support" : "andy.bates@edf-energy.com"
  }
}
