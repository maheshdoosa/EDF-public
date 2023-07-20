########### sql Rg Tags ##############
module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E294-A0-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "Database"
    "Role" : "sql"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
