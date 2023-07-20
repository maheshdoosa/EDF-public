################ RG for AZure Devops Agent build ############################

module "createTargetRgForLzmanagementSsadoagentVMs" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzmanagementSsadoagentVMsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.SSVMSSVmRGTags.tagsResult
}

############### Shared Image Gallery for keep ado agent image ###################

module "sharedImagegalleryForadoagent" {
  source          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImagegallery?ref=v1.0.0"
  SIgallery       = var.sigalleryname
  SIresourcegroup = module.createTargetRgForLzmanagementSsadoagentVMs.rgName
  SIlocation      = var.lzHubManagementResourceLocation
}

############### Shared Image Definition for keep ado agent ######################

module "sharedImagedefinitionForadoagent" {
  source                   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImage?ref=v1.0.0"
  sharedimagename          = var.sharedimagedefname
  Sharedimagegalleryname   = var.sigalleryname
  sharedimageresourcegroup = module.createTargetRgForLzmanagementSsadoagentVMs.rgName
  sharedimagelocation      = var.lzHubManagementResourceLocation
  publisher                = "center-for-internet-security-inc"
  offer                    = "cis-ubuntu-linux-2004-l1"
  sku                      = "cis-ubuntu2004-l1"
  planpurchase             = "cis-ubuntu2004-l1"
  planpublisher            = "center-for-internet-security-inc"
  planproduct              = "cis-ubuntu-linux-2004-l1"

  depends_on = [module.sharedImagegalleryForadoagent]
}

######### GET: ADO Configuration cloudinit file. This can be converted to use an image.
data "template_file" "cloudinit" {
  template = file("${path.module}/scripts/cloudinit.tpl")

  vars = {
    server_url     = "https://dev.azure.com/EDF-Staging-ALZ"
    pat_token      = data.azurerm_key_vault_secret.adopattoken.value
    pool_name      = "Default"
    vm_admin       = data.azurerm_key_vault_secret.adminUser.value
    proxy_url      = ""
    proxy_username = ""
    proxy_password = ""
    proxy_bypass   = ""
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content = data.template_file.cloudinit.rendered
  }
}


############ pre build agent #########################################

module "createNicForagentvm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.0.0"

  nicName           = "prebuildagent-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsadoagentVMs.rgName

  subnetId = data.azurerm_subnet.ssvmssadosubnet.id

  nicIpConfigName = "prebuildagent-nic-01-Ip-Config" #should be static
  ipName          = "prebuildagent-nic-01-Ip"        #should be static
  ipAddress       = "10.217.1.196"
}

####################### CREATE: Azure Linux VM as Azure DevOps prebild Agent ####################
resource "azurerm_linux_virtual_machine" "ado" {

  name                  = "prebuildagentSS"
  location              = var.lzHubManagementResourceLocation
  resource_group_name   = module.createTargetRgForLzmanagementSsadoagentVMs.rgName
  network_interface_ids = [module.createNicForagentvm.nicId]
  size                  = "Standard_B2s"

  computer_name                   = "prebuildagentSS"
  admin_username                  = data.azurerm_key_vault_secret.adminUser.value
  disable_password_authentication = false
  encryption_at_host_enabled      = false
  secure_boot_enabled             = false
  vtpm_enabled                    = false
  tags                            = module.SSvmssTags.tagsResult
  admin_password                  = data.azurerm_key_vault_secret.adminPassword.value

  custom_data = data.template_cloudinit_config.config.rendered

  os_disk {
    name                 = "prebuildagentSS-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

#################### VMSS for Ado Agent ##############################################

module "adovmss01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vmss-linux?ref=v1.0.0"
  vmssname                  = "eituksalzssado"
  vmssrg                    = module.createTargetRgForLzmanagementSsadoagentVMs.rgName
  vmsslocation              = var.lzHubManagementResourceLocation
  admin_username            = data.azurerm_key_vault_secret.vmssadminuser.value
  admin_password            = data.azurerm_key_vault_secret.vmssadminPassword.value
  computernameprefix        = "eituksalzssado"
  instances                 = "2"
  sourceimageid             = "/subscriptions/${data.azurerm_key_vault_secret.subscriptionId.value}/resourceGroups/${var.lzmanagementSsadoagentVMsRgName}/providers/Microsoft.Compute/galleries/${var.sigalleryname}/images/${var.sharedimagedefname}/versions/2.2.2"
  vmssplan                  = "cis-ubuntu2004-l1"
  vmsspublisher             = "center-for-internet-security-inc"
  vmssproduct               = "cis-ubuntu-linux-2004-l1"
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  vmssnic                   = "eituksalzssado"
  vmssnicip                 = "eituksalzssado"
  vmsssubnetid              = data.azurerm_subnet.ssvmssadosubnet.id
  singleplacementgroup      = false
  overprovision             = false
  zone_balance              = false
  zones                     = [1, 2]

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings

  additionalTags = module.SSvmssTags.tagsResult
}
