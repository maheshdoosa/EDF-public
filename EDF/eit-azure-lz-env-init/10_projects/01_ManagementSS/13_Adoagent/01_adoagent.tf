#Initially ado agent was developed under IAAS module but segregation of ADO keeping VMSS only moving now and will do the remaining resources later
#################### VMSS for Ado Agent ##############################################

module "adovmss01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vmss-linux?ref=v1.0.0"
  vmssname                  = "eituksalzssado01"
  vmssrg                    = var.lzmanagementSsadoagentVMsRgName
  vmsslocation              = var.lzHubManagementResourceLocation
  admin_username            = data.azurerm_key_vault_secret.vmssadminuser.value
  admin_password            = data.azurerm_key_vault_secret.vmssadminPassword.value
  computernameprefix        = "eituksalzssado"
  instances                 = "2"
  sourceimageid             = "/subscriptions/${data.azurerm_key_vault_secret.subscriptionId.value}/resourceGroups/${var.lzmanagementSsadoagentVMsRgName}/providers/Microsoft.Compute/galleries/${var.sigalleryname}/images/${var.sharedimagedefname}/versions/3.0.1"
  vmssplan                  = "cis-ubuntu1804-l1"
  vmsspublisher             = "center-for-internet-security-inc"
  vmssproduct               = "cis-ubuntu-linux-1804-l1"
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
