module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Generation Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Key Vault"
    "Role" : "Azure Disk Encryption"
    "Service Level" : "Gold"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
