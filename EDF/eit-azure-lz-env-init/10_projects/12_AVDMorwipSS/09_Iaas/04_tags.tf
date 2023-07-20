
module "resourceGroupavTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Anti-Virus"
    "Role" : "AV Management"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "AVDav01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Anti-Virus"
    "Role" : "AV Management"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}

module "AVDav02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Anti-Virus"
    "Role" : "AV Management"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}

################################################################################################
module "resourceGroupsccmTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Configuration Management"
    "Role" : "SCCM"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "AVDSccm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Configuration Management"
    "Role" : "SCCM"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}

module "AVDSccm02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Configuration Management"
    "Role" : "SCCM"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}
#################### AD ####################

module "resourceGroupaddsTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Active Directory"
    "Role" : "Domain Controller"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "AVDadds01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Active Directory"
    "Role" : "Domain Controller"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}

module "AVDadds02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Customers"
    "Major Function" : "Customer Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Active Directory"
    "Role" : "Domain Controller"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "20"
    "UpdateWindow" : "SAT1UTC16"
  }
}
