
module "resourceGroupavTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Generation Operations"
    "Cost Centre" : "8bsb"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "data gateway"
    "Role" : "on-premises data gateway"
    "Service Level" : "gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "dtgwvm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Generation Operations"
    "Cost Centre" : "8bsb"
    "Project Code" : "TBC"
    "Category" : "application"
    "Service" : "data gateway"
    "Role" : "on-premises data gateway"
    "infra support team" : "avanade"
    "Service Level" : "gold"
    "resource owner" : "finance"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "yes"
    "StartupPriority" : "10"
    "UpdateWindow" : "TST-CYCLE-1"
  }
}

module "dtgwvm02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Generation Operations"
    "Cost Centre" : "8bsb"
    "Project Code" : "TBC"
    "Category" : "application"
    "Service" : "data gateway"
    "Role" : "on-premises data gateway"
    "infra support team" : "avanade"
    "Service Level" : "gold"
    "resource owner" : "finance"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "yes"
    "StartupPriority" : "10"
    "UpdateWindow" : "TST-CYCLE-1"
  }
}
