module "resourceGroupTags" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  # environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "environment" : "High Secured Management"
    # "Environment" : "High Secured Management"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}
############ Vnet tags #####
module "mgmthsVnet" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "environment" : "High Secured Management"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}


module "mgmthsUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

############# NSGs ####################
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit"  = "Finance"
    "Major Function" = "Enterprise IT"
    "Cost Centre"    = "TABB"
    "Project Code"   = "6C040714"
    "Category"       = "Infrastructure"
    # "Environment"    = "High Secured Management"
    "Service"       = "Networking"
    "Role"          = "NSG"
    "Service Level" = "Gold"
    "Owner"         = "CloudServices@edfenergy.com"
    "Support"       = "Cloud Services Azure TSI"
  }
}

################## Existing code ###########
# module "resourceGroupTags" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment
# }

# module "managementHsVnetTags" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "VNET"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# ############################
# module "mgmtUdrTable" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "UDR"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "adUdrTable" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "UDR"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "wsusUdrTable" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "UDR"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "wacUdrTable" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "UDR"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "pkiUdrTable" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "UDR"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }


# module "auditUdrTable" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "UDR"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }
# ########## NSGs #####################

# module "tags-addsNsg" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "NSG"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "tags-wsusNsg" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "NSG"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "tags-wacNsg" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "NSG"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "tags-caNsg" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "NSG"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }

# module "tags-auditNsg" {
#   source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
#   environment = var.environment

#   tags = {
#     "Business Unit" : "Finance"
#     "Major Function" : "Enterprise IT"
#     "Cost Centre" : "6C040714"
#     "Project Code" : "TBC"
#     "Category" : "Infrastructure"
#     "Service" : "Networking"
#     "Role" : "NSG"
#     "Service Level" : "Gold"
#     "Owner" : "TBC"
#     "Support" : "TBC"
#   }
# }
