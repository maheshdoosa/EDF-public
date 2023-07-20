module "ComsyHS-Prd-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.ComsyHS-Prd-environment

  tags = {

    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "2-D448-A3-HA-08-CAB"
    "Project Code" : "8BSB"
    "Category" : "Infrastructure"
    "Service" : "COMSY"
    "Role" : "COMSY License"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}



module "ComsyHS-Prd-VM01-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.ComsyHS-Prd-environment

  tags = {

    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "2-D448-A3-HA-08-CAB"
    "Project Code" : "8BSB"
    "Category" : "Infrastructure"
    "Service" : "COMSY"
    "Role" : "COMSY License"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}
