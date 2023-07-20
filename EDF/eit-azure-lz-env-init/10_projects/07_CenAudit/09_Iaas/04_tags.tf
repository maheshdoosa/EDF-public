module "CenadtvmTags01" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TABB Project"
    "Environment" : "High Secured Central Audit"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VM"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1,PRD-CYCLE-2"
    "ScheduledShutdown" : "No",
    "Golden_Image_version" : "1.0.2022042009"
  }
}

module "CenadtvmTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TABB Project"
    "Environment" : "High Secured Central Audit"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VM"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1,PRD-CYCLE-2"
    "ScheduledShutdown" : "No"
  }
}

################# Event Collector ##############

module "CenadtpecvmrgTags" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  #environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Environment" : "High Secured Managed"
    "Category" : "Infrastructure"
    "Service" : "VF Event Collector"
    "Role" : "Syslog Server"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "Cenadtpecvm01Tags" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  #environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Environment" : "High Secured Managed"
    "Category" : "Infrastructure"
    "Service" : "VF Event Collector"
    "Role" : "Syslog Server"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
    "ScheduledShutdown" : "No"
  }
}

module "Cenadtpecvm02Tags" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  #environment = "High Secured Governance"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Environment" : "High Secured Managed"
    "Category" : "Infrastructure"
    "Service" : "VF Event Collector"
    "Role" : "Windows Event Collector"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
    "ScheduledShutdown" : "No"
  }
}
