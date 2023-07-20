module "NuclearRnDHSvmwebTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E294-A0-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "HPB"
    "Role" : "HPB Web Server"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "Yes"
    "StartupPriority" : "60"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}

module "NuclearRnDHSvmappTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Managed"
  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "2-E294-A0-MA-01-AAE"
    "Category" : "Infrastructure"
    "Service" : "HPB"
    "Role" : "HPB App Server"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "Yes"
    "StartupPriority" : "60"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}
