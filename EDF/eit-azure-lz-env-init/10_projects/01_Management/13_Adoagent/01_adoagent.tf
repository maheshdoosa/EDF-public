################ RG for AZure Devops Agent build ############################

module "createTargetRgForLzmanagementHsadoagentVMs" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsadoagentVMsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

############### Shared Image Gallery for keep ado agent image ###################

module "sharedImagegalleryForadoagent" {
  source          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImagegallery?ref=v1.1.19"
  SIgallery       = var.sigalleryname
  SIresourcegroup = module.createTargetRgForLzmanagementHsadoagentVMs.rgName
  SIlocation      = var.lzHubManagementResourceLocation
}

############### Shared Image Definition for keep ado agent ######################

module "sharedImagedefinitionForadoagent" {
  source                   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImage?ref=v1.1.19"
  sharedimagename          = var.sharedimagedefname
  Sharedimagegalleryname   = var.sigalleryname
  sharedimageresourcegroup = module.createTargetRgForLzmanagementHsadoagentVMs.rgName
  sharedimagelocation      = var.lzHubManagementResourceLocation
  publisher                = "center-for-internet-security-inc"
  offer                    = "cis-ubuntu-linux-2004-l1"
  sku                      = "cis-ubuntu2004-l1"
  planpurchase             = "cis-ubuntu2004-l1"
  planpublisher            = "center-for-internet-security-inc"
  planproduct              = "cis-ubuntu-linux-2004-l1"

  depends_on = [module.sharedImagegalleryForadoagent]
}

## delete the prebuild VM AZT-3951

# ######### GET: ADO Configuration cloudinit file. This can be converted to use an image.
# data "template_file" "cloudinit" {
#   template = file("${path.module}/scripts/cloudinit.tpl")

#   vars = {
#     server_url     = "https://dev.azure.com/EDF-Staging-ALZ"
#     pat_token      = data.azurerm_key_vault_secret.adopattoken.value
#     pool_name      = "Default"
#     vm_admin       = data.azurerm_key_vault_secret.vmssadminuser.value
#     proxy_url      = ""
#     proxy_username = ""
#     proxy_password = ""
#     proxy_bypass   = ""
#   }
# }

# data "template_cloudinit_config" "config" {
#   gzip          = true
#   base64_encode = true

#   part {
#     content = data.template_file.cloudinit.rendered
#   }
# }


# ############ pre build agent #########################################

# data "azurerm_key_vault_secret" "prebuildagentPrivateIpAddress" {
#   name         = "prebuildagentPrivateIpAddress"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# module "createNicForagentvm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

#   nicName           = "prebuildagent-nic-01" #should be static
#   location          = var.lzHubManagementResourceLocation
#   resourceGroupName = module.createTargetRgForLzmanagementHsadoagentVMs.rgName

#   subnetId = data.azurerm_subnet.hsvmssadosubnet.id

#   nicIpConfigName = "prebuildagent-nic-01-Ip-Config" #should be static
#   ipName          = "prebuildagent-nic-01-Ip"        #should be static
#   ipAddress       = "${data.azurerm_key_vault_secret.prebuildagentPrivateIpAddress.value}"
# }

# ####################### CREATE: Azure Linux VM as Azure DevOps prebild Agent ####################

# data "azurerm_key_vault_key" "adekey" {
#   name         = "prebuildagentHS-ade-01"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsKeyVault.id
# }


# resource "azurerm_linux_virtual_machine" "ado" {

#   name                  = "prebuildagentHS"
#   location              = var.lzHubManagementResourceLocation
#   resource_group_name   = module.createTargetRgForLzmanagementHsadoagentVMs.rgName
#   network_interface_ids = [module.createNicForagentvm.nicId]
#   size                  = "Standard_D2s_v3"

#   computer_name                   = "prebuildagentHS"
#   admin_username                  = data.azurerm_key_vault_secret.vmssadminuser.value
#   disable_password_authentication = false
#   admin_password                  = data.azurerm_key_vault_secret.vmssadminPassword.value

#   custom_data = data.template_cloudinit_config.config.rendered

#   os_disk {
#     name                 = "prebuildagentHS-osdisk"
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }

# ############## Disk encryption for prebuildagent #####################################

# module "Create-AzureDiskEncryption-extension" {
#   source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension"
#   name               = "AzureDiskEncryption"
#   publisher          = "Microsoft.Azure.Security"
#   type               = "AzureDiskEncryptionForLinux"
#   handler_version    = "1.2"
#   vmId               = azurerm_linux_virtual_machine.ado.id
#   settings           = <<SETTINGS
#     {
#         "EncryptionOperation"      : "EnableEncryption",
#         "KeyVaultURL"              : "${data.azurerm_key_vault.kvmanagementHsKeyVault.vault_uri}",
#         "KeyVaultResourceId"       : "${data.azurerm_key_vault.kvmanagementHsKeyVault.id}",
#         "KekVaultResourceId"       : "${data.azurerm_key_vault.kvmanagementHsKeyVault.id}",
#         "KeyEncryptionKeyURL"      : "${data.azurerm_key_vault_key.adekey.id}",
#         "KeyEncryptionAlgorithm"   : "RSA-OAEP",
#         "VolumeType"               : "OS"
#     }
#     SETTINGS
# }

####### VMSS HS ADO #####################################################################
####### !!!! dont make directly change in below ADO resource ##################################
####### Create a new scale set vm and make it as new agent in "vmss-ado-hs" ADO Agent pool #######

module "adovmss01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vmss-linux?ref=v1.1.19"
  vmssname                  = "eituksalzhsado01"
  vmssrg                    = module.createTargetRgForLzmanagementHsadoagentVMs.rgName
  vmsslocation              = var.lzHubManagementResourceLocation
  admin_username            = data.azurerm_key_vault_secret.vmssadminuser.value
  admin_password            = data.azurerm_key_vault_secret.vmssadminPassword.value
  computernameprefix        = "eituksalzhsado"
  instances                 = "2"
  sourceimageid             = "/subscriptions/${data.azurerm_key_vault_secret.subscriptionId.value}/resourceGroups/${var.lzmanagementHsadoagentVMsRgName}/providers/Microsoft.Compute/galleries/${var.sigalleryname}/images/${var.sharedimagedefname}/versions/3.0.1"
  vmssplan                  = "cis-ubuntu1804-l1"
  vmsspublisher             = "center-for-internet-security-inc"
  vmssproduct               = "cis-ubuntu-linux-1804-l1"
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  vmssnic                   = "eituksalzhsado"
  vmssnicip                 = "eituksalzhsado-ip"
  vmsssubnetid              = data.azurerm_subnet.hsvmssadosubnet.id
  singleplacementgroup      = false
  overprovision             = false
  zone_balance              = false
  zones                     = [1, 2]

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings

  additionalTags = module.HSvmssTags.tagsResult

}
