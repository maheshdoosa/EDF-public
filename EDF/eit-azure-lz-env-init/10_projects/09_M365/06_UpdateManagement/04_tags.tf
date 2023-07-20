module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
}

# module "automationaccountTags" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
#   environment = "Standard Secured Managed"

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "TABB Project"
#     "Project Code" : "6C040714"
#     "Category" : "Infrastructure"
#     "Service" : "Automation"
#     "Role" : "Automation Account"
#     "Service Level" : "Bronze"
#     "Owner" : "CloudServices@edfenergy.com"
#     "Support" : "Cloud Services Azure TSI"
#   }
# }
