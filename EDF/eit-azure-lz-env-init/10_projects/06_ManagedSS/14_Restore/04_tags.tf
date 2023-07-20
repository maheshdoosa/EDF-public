module "emersonams01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "ManagedSS"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "AMS Machinery Manager"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}
