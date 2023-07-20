module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
}

module "additionalTagsF5" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TABB Project"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VM"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}

module "additionalTagsF52" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TABB Project"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VM"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-2"
  }
}
