################### Run This Azure cli command manually by login into that subscription before starting the deployment ###########

#az vm image terms accept --urn publisher:offer:sku:version

#For example- az vm image terms accept --urn f5-networks:f5-big-ip-byol:f5-big-all-2slot-byol:latest

################ Resource Group - F5 Appliance  #############
module "createTargetRgForTransitF5Appliances" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.f5RgName
  resourceLocation  = var.f5ResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

########################### NIC Cards for F5 Appliances VM1 #######################
module "createMgmtNicForF5VM1" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksalzf5a-mgmt-nic" #should be static
  location          = var.f5ResourceLocation
  resourceGroupName = module.createTargetRgForTransitF5Appliances.rgName

  subnetId = data.azurerm_subnet.mgmtSubnet.id

  nicIpConfigName = "eituksalzf5a-mgmt-nic-Ip-Config" #should be static
  ipName          = "eituksalzf5a-mgmt-nic-Ip"        #should be static
  ipAddress       = local.f5Vm1mgmtIpAddress
}

module "createExternalNicForF5VM1" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nic-multiple-ip"

  nicName           = "eituksalzf5a-external-nic" #should be static
  location          = var.f5ResourceLocation
  resourceGroupName = module.createTargetRgForTransitF5Appliances.rgName

  subnetId = data.azurerm_subnet.externalSubnet.id

  nicIpConfigName1 = var.f5Vm1ExternalNicIpConfigName1
  ipName           = var.f5Vm1ExternalNicIpName
  ipAddress1       = local.f5Vm1externalIpAddress1

  nicIpConfigName2 = var.f5Vm1ExternalNicIpConfigName2
  ipAddress2       = local.f5Vm1externalIpAddress2

  nicIpConfigName3 = var.f5Vm1ExternalNicIpConfigName3
  ipAddress3       = local.f5Vm1externalIpAddress3

}

module "createInternalNicForF5VM1" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksalzf5a-internal-nic" #should be static
  location          = var.f5ResourceLocation
  resourceGroupName = module.createTargetRgForTransitF5Appliances.rgName

  subnetId = data.azurerm_subnet.internalSubnet.id

  nicIpConfigName = "eituksalzf5a-internal-nic-Ip-Config" #should be static
  ipName          = "eituksalzf5a-internal-nic-Ip"        #should be static
  ipAddress       = local.f5Vm1internalIpAddress
}

########################### NIC Cards for F5 Appliances VM2 #######################
module "createMgmtNicForF5VM2" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksalzf5b-mgmt-nic" #should be static
  location          = var.f5ResourceLocation
  resourceGroupName = module.createTargetRgForTransitF5Appliances.rgName

  subnetId = data.azurerm_subnet.mgmtSubnet.id

  nicIpConfigName = "eituksalzf5b-mgmt-nic-Ip-Config" #should be static
  ipName          = "eituksalzf5b-mgmt-nic-Ip"        #should be static
  ipAddress       = local.f5Vm2mgmtIpAddress
}

module "createExternalNicForF5VM2" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nic-multiple-ip"

  nicName           = "eituksalzf5b-external-nic" #should be static
  location          = var.f5ResourceLocation
  resourceGroupName = module.createTargetRgForTransitF5Appliances.rgName

  subnetId = data.azurerm_subnet.externalSubnet.id

  nicIpConfigName1 = var.f5Vm2ExternalNicIpConfigName1
  ipName           = var.f5Vm2ExternalNicIpName
  ipAddress1       = local.f5Vm2externalIpAddress1

  nicIpConfigName2 = var.f5Vm2ExternalNicIpConfigName2
  ipAddress2       = local.f5Vm2externalIpAddress2

  nicIpConfigName3 = var.f5Vm2ExternalNicIpConfigName3
  ipAddress3       = local.f5Vm2externalIpAddress3


}

module "createInternalNicForF5VM2" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksalzf5b-internal-nic" #should be static
  location          = var.f5ResourceLocation
  resourceGroupName = module.createTargetRgForTransitF5Appliances.rgName

  subnetId = data.azurerm_subnet.internalSubnet.id

  nicIpConfigName = "eituksalzf5b-internal-nic-Ip-Config" #should be static
  ipName          = "eituksalzf5b-internal-nic-Ip"        #should be static
  ipAddress       = local.f5Vm2internalIpAddress
}

################### F5 Appliance VM1 ############################

module "azuref5Appliance1" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-f5-appliance"

  f5VmName                = "eituksalzf5a"
  f5VmLocation            = var.f5ResourceLocation
  f5ResourceGroup         = module.createTargetRgForTransitF5Appliances.rgName
  nicIds                  = [module.createMgmtNicForF5VM1.nicId, module.createExternalNicForF5VM1.nicId, module.createInternalNicForF5VM1.nicId]
  primaryNicId            = module.createMgmtNicForF5VM1.nicId
  f5InstanceType          = "Standard_DS4_v2"
  f5ProductName           = "f5-big-ip-byol" //Offer
  f5Version               = "latest"
  storageDiskName         = "eituksalzf5a-os-disk"
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

  depends_on = [module.createExternalNicForF5VM1, module.createExternalNicForF5VM2]
}

module "azuref5Appliance2" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-f5-appliance"

  f5VmName                = "eituksalzf5b"
  f5VmLocation            = var.f5ResourceLocation
  f5ResourceGroup         = module.createTargetRgForTransitF5Appliances.rgName
  nicIds                  = [module.createMgmtNicForF5VM2.nicId, module.createExternalNicForF5VM2.nicId, module.createInternalNicForF5VM2.nicId]
  primaryNicId            = module.createMgmtNicForF5VM2.nicId
  f5InstanceType          = "Standard_DS4_v2"
  f5ProductName           = "f5-big-ip-byol" //Offer
  f5Version               = "latest"
  storageDiskName         = "eituksalzf5b-os-disk"
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

  depends_on = [module.createExternalNicForF5VM1, module.createExternalNicForF5VM2]
}


#######################Azure Internal Load balancer for F5 Appliances ###########################

module "createInternalLoadBalancerF5" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-internal-load-balancer"

  vNetName                = var.f5VnetName
  subnetName              = var.f5externalSubnetName
  subnetID                = data.azurerm_subnet.externalSubnet.id
  ipconfigName1           = var.f5Vm1ExternalNicIpConfigName2
  ipconfigName2           = var.f5Vm2ExternalNicIpConfigName2
  lbName                  = "eit-uks-alz-f5-int"
  FrontIpAllocationMethod = "static"
  IPaddressforstatic      = local.f5InternalLbPrivateIpAddress
  resourceGroupName       = module.createTargetRgForTransitF5Appliances.rgName
  location                = var.f5ResourceLocation
  lb_Sku                  = "Standard"
  healthProbProtocol      = "TCP"
  healthProbProtocolPort  = "443"
  lbRuleName              = "f5-lb-probe-ilb"
  lbRuleProtocol          = "TCP"
  lbRuleFrontPort         = "443"
  lbRuleBackPort          = "443"
  backPoolIPConfigName    = "eit-uks-alz-f5-ilb-be"
  vm1NicID                = module.createExternalNicForF5VM1.nicId
  vm2NicID                = module.createExternalNicForF5VM2.nicId

  depends_on = [module.createExternalNicForF5VM1, module.createExternalNicForF5VM2]
}

############## Enabling F5 VM Backup #####################

resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.azuref5Appliance1, module.azuref5Appliance2]
}
