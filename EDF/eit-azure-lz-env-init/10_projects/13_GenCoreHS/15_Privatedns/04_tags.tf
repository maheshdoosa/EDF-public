module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "DNS"
    "Role" : "Private Zone"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "pvtdnstags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Generation Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "DNS"
    "Role" : "Private Zone"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "Arecordtags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "creator" : "created by private endpoint genuksprdhsloga01-pe with resource guid 9b3b3caa-90d3-4f7a-a952-61967801076f"
  }
}
