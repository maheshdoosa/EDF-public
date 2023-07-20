module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
}

module "wsusVmTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Management"

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
    "UpdateWindow" : "SAT2UTC18-NR"
  }
}

module "wsusVm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Management"

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
