
#####################  Nuclear PAAS tags ########################

module "hpbdvdbprodresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "PostgreSQL Database"
    "Role" : "HPB DB Server"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
  "StartupPriority" : "10" }
}
