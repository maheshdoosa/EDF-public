module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Control-M"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" : "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Avanade"
  }
}

############## Vnet Tags ###############
module "vnetTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Control-M"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" : "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "VNET"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Avanade"
  }
}

module "controlmHSUdrTable" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Control-M"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" : "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "UDR"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Avanade"
  }
}
module "nsgtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Control-M"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" : "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "NSG"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Avanade"
  }
}
