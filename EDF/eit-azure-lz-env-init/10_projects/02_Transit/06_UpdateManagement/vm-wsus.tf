module "wsusVmTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : local.rgTagBusinessUnit
    "Major Function" : local.rgTagMajorFunction
    "Cost Centre" : local.rgTagCostCentre
    "Project Code" : local.rgTagProjectCode
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "Firewall"
    "Service Level" : "Bronze"
    "Owner" : "TBC"
    "Support" : "TBC"
    "PipelineRunID" : local.rgTagPipelineRunId
  }
}

module "createNicForWsusVm" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"
  nicName           = "eituksstgwus01-nic-01" //should not change
  location          = var.lzHubNetworkingResourceLocation
  resourceGroupName = module.createTargetRgForLzHubNetworking.rgName

  nicIpConfigName = "wsus-public-ip"
  subnetId        = data.azurerm_subnet.lzHubmgmtSubnet.id
  ipName          = "wsus-nic-ip"
}

module "createWsusVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName          = "eituksstgwus01"
  location        = var.lzHubNetworkingResourceLocation
  vmResourceGroup = module.createTargetRgForLzHubNetworking.rgName
  nicIds          = [module.createNicForWsusVm.nicId]

  //Following VM specific details are not expected change over environments at the time
  // of writing this code. If needed to, one or more of these should parameterised
  osImagePublisher = "MicrosoftWindowsServer"
  osImageOffer     = "WindowsServer"
  osImageSku       = "2019-Datacenter"
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3"

  osDiskName                = "eituksstgwus01_OSDisk_01"
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksstgwus01_DataDisk_01"
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "1023"
  storageDataDiskCaching  = "None"

  computerName      = "eituksstgwus01"
  userAdminName     = data.azurerm_key_vault_secret.kvsecretwsusVmUserAdmin.value
  userAdminPassword = data.azurerm_key_vault_secret.kvsecretwsusVmAdminPassword.value

  additionalTags = module.wsusVmTags.tagsResult
}
