module "MIMHsvmrgTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "high secured development"

  tags = {
    "Business Unit" : "NA"
    "Cost Code" : "NA"
    "Project Code" : "TAFD"
    "Category" : "infrastructure"
    "Service" : "compute"
    "Role" : "virtual machine"
    "Infra support team" : "avanade"
    "Am support team" : "cloud services"
    "Service Level" : "gold"
    "Resource owner" : "cloud services"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "MIMHsDBvm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "high secured development"

  tags = {
    "Business Unit" : "NA"
    "Cost Code" : "NA"
    "Project Code" : "TAFD"
    "Category" : "infrastructure"
    "Service" : "compute"
    "Role" : "virtual machine"
    "Infra support team" : "avanade"
    "Am support team" : "cloud services"
    "Service Level" : "gold"
    "Resource owner" : "cloud services"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}

module "MIMHsAppvm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "high secured development"

  tags = {
    "Business Unit" : "NA"
    "Cost Code" : "NA"
    "Project Code" : "TAFD"
    "Category" : "infrastructure"
    "Service" : "compute"
    "Role" : "virtual machine"
    "Infra support team" : "avanade"
    "Am support team" : "cloud services"
    "Service Level" : "gold"
    "Resource owner" : "cloud services"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}

module "MIMHsAppvm02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "high secured development"

  tags = {
    "Business Unit" : "NA"
    "Cost Code" : "NA"
    "Project Code" : "TAFD"
    "Category" : "infrastructure"
    "Service" : "compute"
    "Role" : "virtual machine"
    "Infra support team" : "avanade"
    "Am support team" : "cloud services"
    "Service Level" : "gold"
    "Resource owner" : "cloud services"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}
