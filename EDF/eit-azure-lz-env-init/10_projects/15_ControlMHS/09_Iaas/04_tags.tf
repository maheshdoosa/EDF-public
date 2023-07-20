module "ControlMHsvmrgTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Management"

  tags = {
    "Business Unit" : "finance"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Category" : "application"
    "Service" : "control-m"
    "Role" : "CtrlM Machinery Manager"
    "Service Level" : "gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "ControlMHsvm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Management"

  tags = {
    "Business Unit" : "finance"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Category" : "application"
    "Service" : "control-m"
    "Role" : "control-m agent server"
    "Service Level" : "gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}

module "ControlMHsvm02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Management"

  tags = {
    "Business Unit" : "finance"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Category" : "application"
    "Service" : "control-m"
    "Role" : "control-m agent server"
    "Service Level" : "gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "no"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-2"
  }
}
