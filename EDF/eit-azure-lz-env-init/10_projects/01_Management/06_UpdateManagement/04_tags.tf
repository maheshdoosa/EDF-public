module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Management"
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "WSUS"
    "Role" : "Distribution Point"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
  }
}

module "wsusVmTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Management"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "WSUS"
    "Role" : "Distribution Point"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
    "UpdateWindow" : "TST-CYCLE-1"
  }
}
########### LAW Tags ############
module "lawTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Management"
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Logging"
    "Role" : "Log Analytics"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
