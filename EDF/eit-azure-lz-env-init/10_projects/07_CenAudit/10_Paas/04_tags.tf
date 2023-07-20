module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
}

module "subAuditLogsSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TBC"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Audit Logs"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TBC"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "VM Diagnostic Logs"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Security Governance"
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TBC"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "VM Diagnostic Logs"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Security Governance"
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TBC"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "VM Diagnostic Logs"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

############ AVM Storage Account #######################

module "avmsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}
module "avmsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}
