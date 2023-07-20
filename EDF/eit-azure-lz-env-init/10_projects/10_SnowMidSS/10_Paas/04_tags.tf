module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    # "Environment" = "Standard Secured Security Governance"
    "Role" : "MID Server Diagnostic Storage"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    #"Environment" = "Standard Secured Security Governance"
    "Role" : "MID Server Diagnostic Storage"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Finance"
    "Major Function" = "Enterprise IT"
    "Cost Centre"    = "6C040714"
    "Project Code"   = "TBC"
    #"Environment" = "Standard Secured Security Governance"
    "Category"      = "Infrastructure"
    "Role"          = "MID Server Backup Valut"
    "Service"       = "SNOW MID Services"
    "Service Level" = "Gold"
    "Owner"         = "CloudServices@edfenergy.com"
    "Support"       = "Cloud Services Azure TSI"
  }
}

############### key vault tags ################
module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    # "Environment" = "Standard Secured Security Governance"
    "Role" : "MID Server Disk Encryption KV"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

# ############### DNS Zone tags ################
# module "DnsTags" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
#   # environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "SNOW MID Services"
#     "Environment" = "Standard Secured Security Governance"
#     "Role" : "MID Server Disk Encryption KV"
#     "Service Level" : "Gold"
#     "Owner" : "cloudservices@edfenergy.com"
#     "Support" : "Cloud Services Azure TSI"
#   }
# }


module "secgovauxRGTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    # "Environment" = "Standard Secured Security Governance"
    "Role" : "MID Server Diagnostic Storage"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
module "secgovauxsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    # "Environment" = "Standard Secured Security Governance"
    "Role" : "scripts"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
