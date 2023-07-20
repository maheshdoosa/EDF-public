################### Run This Azure cli command manually by login into that subscription before starting the deployment ###########

#az vm image terms accept --urn publisher:offer:sku:version

#For example- az vm image terms accept --urn f5-networks:f5-big-ip-byol:f5-big-all-2slot-byol:latest

########################### NIC Cards for F5 Appliances VM1 #######################
module "createNicForhF5VM1Primary" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName           = var.F5VM1PrimarynicName #should be static
  location          = var.hf5ResourceLocation
  resourceGroupName = var.f5RgName

  subnetId                          = data.azurerm_subnet.f5Subnet2.id
  enable_nic_ip_forwarding          = var.f5Vm1primaryenable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.f5Vm1primaryenable_nic_accelerated_networking
  nicIpConfigName                   = var.F5VM1PrimarynicIpConfigName #should be static
  # ipName                          = var.F5VM1PrimaryipName        #should be static
  ipAddress = local.f5Vm1primaryIpAddress
}

module "createNicForF5VM1mgmt" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName           = var.F5VM1mgmtnicName #should be static
  location          = var.hf5ResourceLocation
  resourceGroupName = var.f5RgName

  subnetId                          = data.azurerm_subnet.mgmtSubnet.id
  enable_nic_ip_forwarding          = var.F5VM1mgmtenable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.F5VM1mgmtenable_nic_accelerated_networking
  nicIpConfigName                   = var.F5VM1mgmtnicIpConfigName #should be static
  # ipName                          = var.F5VM1mgmtipName        #should be static
  ipAddress = local.f5Vm1mgmtIpAddress
}

########################### NIC Cards for F5 Appliances VM2 #######################
module "createNicForF5VM2secondary" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName           = var.F5VM2secondarynicName #should be static
  location          = var.hf5ResourceLocation
  resourceGroupName = var.f5RgName

  subnetId                          = data.azurerm_subnet.f5Subnet2.id
  enable_nic_ip_forwarding          = var.F5VM2secondaryenable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.F5VM2secondaryenable_nic_accelerated_networking
  nicIpConfigName                   = var.F5VM2secondarynicIpConfigName #should be static
  # ipName                          = var.F5VM2secondaryipName        #should be static
  ipAddress = local.f5Vm2secondIpAddress
}

module "createNicForF5VM2mgmt" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName           = var.F5VM2mgmtnicName #should be static
  location          = var.hf5ResourceLocation
  resourceGroupName = var.f5RgName

  subnetId                          = data.azurerm_subnet.mgmtSubnet.id
  enable_nic_ip_forwarding          = var.F5VM2mgmtenable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.F5VM2mgmtenable_nic_accelerated_networking
  nicIpConfigName                   = var.F5VM2mgmtnicIpConfigName #should be static
  # ipName          = var.F5VM2mgmtipName        #should be static
  ipAddress = local.f5Vm2mgmtIpAddress
}

################### F5 Appliance VM1 ############################

module "azuref5Appliance3" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-f5-appliance?ref=v1.0.0"

  f5VmName                = "eituksalzwafa"
  f5VmLocation            = var.hf5ResourceLocation
  f5ResourceGroup         = var.f5RgName
  nicIds                  = [module.createNicForhF5VM1Primary.nicId, module.createNicForF5VM1mgmt.nicId]
  primaryNicId            = module.createNicForF5VM1mgmt.nicId
  f5InstanceType          = "Standard_DS4_v2"
  f5ProductName           = "f5-big-ip-byol" //Offer f5-big-ip-byol
  f5Version               = "latest"
  storageDiskName         = "eituksalzwafa-os-disk"
  storageDiskCashing      = "ReadWrite"
  storageDiskCreateOption = "FromImage"
  storageDiskType         = "Standard_LRS"
  f5AdminUserName         = data.azurerm_key_vault_secret.adminUser.value
  f5AdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  enableSshKey            = "false"
  f5ImageName             = "f5-big-all-2slot-byol" //Plan
  osImagePublisher        = "f5-networks"           //Publisher
  zones                   = var.f5Vm1availabiltiyZone
  additionalTags          = module.additionalTagsF5.tagsResult

  depends_on = [module.createNicForhF5VM1Primary, module.createNicForF5VM1mgmt]
}

module "azuref5Appliance4" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-f5-appliance?ref=v1.0.0"

  f5VmName                = "eituksalzwafb"
  f5VmLocation            = var.hf5ResourceLocation
  f5ResourceGroup         = var.f5RgName
  nicIds                  = [module.createNicForF5VM2secondary.nicId, module.createNicForF5VM2mgmt.nicId]
  primaryNicId            = module.createNicForF5VM2mgmt.nicId
  f5InstanceType          = "Standard_DS4_v2"
  f5ProductName           = "f5-big-ip-byol" //Offer
  f5Version               = "latest"
  storageDiskName         = "eituksalzwafb-os-disk"
  storageDiskCashing      = "ReadWrite"
  storageDiskCreateOption = "FromImage"
  storageDiskType         = "Standard_LRS"
  f5AdminUserName         = data.azurerm_key_vault_secret.adminUser.value
  f5AdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  enableSshKey            = "false"
  f5ImageName             = "f5-big-all-2slot-byol" //Plan
  osImagePublisher        = "f5-networks"           //Publisher
  zones                   = var.f5Vm2availabiltiyZone
  additionalTags          = module.additionalTagsF52.tagsResult

  depends_on = [module.createNicForF5VM2secondary, module.createNicForF5VM2mgmt]
}


#######################Azure Internal Load balancer for F5 Appliances ###########################

module "createInternalLoadBalancer-F5-prod" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-internal-load-balancer?ref=v1.1.14"

  vNetName                = var.f5VnetName
  subnetName              = var.f5Subnet2Name
  subnetID                = data.azurerm_subnet.f5Subnet2.id
  ipconfigName1           = var.F5VM1PrimarynicIpConfigName
  ipconfigName2           = var.F5VM2secondarynicIpConfigName
  lbName                  = "eit-uks-f5-prod"
  FrontIpAllocationMethod = "static"
  IPaddressforstatic      = local.LbPrivateIpAddress /// "10.216.19.68"
  resourceGroupName       = var.f5RgName
  location                = var.hf5ResourceLocation
  lb_Sku                  = "Standard"
  healthProbProtocol      = "TCP"
  healthProbProtocolPort  = "9999"
  lbRuleName              = "f5-lb-probe-new-lb"
  lbRuleProtocol          = "All"
  lbRuleFrontPort         = "0"
  lbRuleBackPort          = "0"
  backPoolIPConfigName    = "eit-uks-alz-f5A-int"
  vm1NicID                = module.createNicForhF5VM1Primary.nicId
  vm2NicID                = module.createNicForF5VM2secondary.nicId
  enable-floating-ip      = "true"
  load-distribution       = var.load-distribution
  Probe_interval          = var.Probe_interval
  idleTimeout             = var.idleTimeout

  depends_on = [module.createNicForhF5VM1Primary, module.createNicForF5VM2secondary, module.azuref5Appliance3, module.azuref5Appliance4]
}

# ############## Enabling F5 VM Backup #####################

# resource "azurerm_backup_protected_vm" "vm" {
#   for_each            = var.vm_name
#   recovery_vault_name = each.value.recovery_vault_name
#   resource_group_name = each.value.resourceGroupName
#   source_vm_id        = local.vm_source_id[each.value.vm_id]
#   backup_policy_id    = local.vm_source_id[each.value.policy_id]
#   depends_on          = [module.azuref5Appliance1, module.azuref5Appliance2]
# }
################################### Diagnostic Setting configuration to all the VM's NIC ############################

module "diagsettings-HS-NIC-mgmt-law" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.0.0"
  for_each                   = local.nic_id
  resource_id                = each.key
  diag_settings_name         = "Diag-Setting-Mgmt-HS-law"
  log_analytics_workspace_id = local.diag_settings_nic["Diag-Setting-Mgmt-HS-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings_nic["Diag-Setting-Mgmt-HS-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings_nic["Diag-Setting-Mgmt-HS-law"]["diagnostic_metrics"]
}
