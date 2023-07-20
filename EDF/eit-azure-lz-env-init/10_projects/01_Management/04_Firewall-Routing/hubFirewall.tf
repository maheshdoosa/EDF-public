######### Firewall #########
module "hubFirewallTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.1.19"
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

module "createHubFirewallIp" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ip?ref=v1.1.19"

  ipName            = var.hubFirewallIpName
  location          = var.lzHubNetworkingResourceLocation
  resourceGroupName = module.createTargetRgForLzHubNetworking.rgName
  allocationMethod  = "Static"   //this value is not deemed to change
  sku               = "Standard" //this value is not deemed to change

  additionalTags = module.hubFirewallTags.tagsResult
}

module "createFirewall" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-firewall?ref=v1.1.19"

  firewallName      = var.hubFirewallName
  location          = var.lzHubNetworkingResourceLocation
  resourceGroupName = module.createTargetRgForLzHubNetworking.rgName
  firewallIpName    = var.hubFirewallIpName

  firewallIpSubnetId  = data.azurerm_subnet.firewallSubnet.id
  firewallIpAddressId = module.createHubFirewallIp.ipId

  additionalTags = module.hubFirewallTags.tagsResult
}

module "createFirewallAppRuleCollection_Wvd_AzureStorage" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-firewall-apprulecollection?ref=v1.1.19"

  firewallName                      = module.createFirewall.fwName
  resourceGroupName                 = module.createTargetRgForLzHubNetworking.rgName
  applicationRuleCollectionName     = "Access-from-WVD-to-AzureStorage"
  applicationRuleCollectionPriority = 150
  applicationRuleCollectionAction   = "Allow"

  sourceAddreses = [data.azurerm_subnet.wvdSubnet.address_prefix]

  firewallId = data.azurerm_firewall.hubfirewall.id

  applicationRulesCollection = [
    {
      name = "AOT-WVD-AzureDC-02"

      targetFqdns = ["*xt.blob.core.windows.net", "*eh.servicebus.windows.net", "*xt.table.core.windows.net"]

      protocol1 = {
        port = "80"
      type = "Http" }

      protocol2 = {
        port = "443"
      type = "Https" }
  }, ]
}

module "createFirewallAppRuleCollection_Vms_AzureBackup" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-firewall-apprulecollection?ref=v1.1.19"

  firewallName                      = module.createFirewall.fwName
  resourceGroupName                 = module.createTargetRgForLzHubNetworking.rgName
  applicationRuleCollectionName     = "Access-from-VMs-to-AzureBackup"
  applicationRuleCollectionPriority = 200
  applicationRuleCollectionAction   = "Allow"

  sourceAddreses = data.azurerm_virtual_network.lzhubVnet.address_space

  firewallId = data.azurerm_firewall.hubfirewall.id

  applicationRulesCollection = [
    {
      name = "AOT-VMs-AzureBackup-02"

      targetFqdns = ["login.windows.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
  }, ]
}

module "createFirewallAppRuleCollection_Mgmt_KeyVault" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-firewall-apprulecollection?ref=v1.1.19"

  firewallName                      = module.createFirewall.fwName
  resourceGroupName                 = module.createTargetRgForLzHubNetworking.rgName
  applicationRuleCollectionName     = "Access-from-Mgmt-to-KeyVault"
  applicationRuleCollectionPriority = 250
  applicationRuleCollectionAction   = "Allow"

  sourceAddreses = [data.azurerm_subnet.mgmtSubnet.address_prefix]

  firewallId = data.azurerm_firewall.hubfirewall.id

  applicationRulesCollection = [
    {
      name = "AOT-VMs-Key-Vault-01"

      targetFqdns = ["login.microsoftonline.com", "management.azure.com", "*.vault.azure.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
  }, ]
}


module "createFirewallAppRuleCollection_Vms_AzureServices" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-firewall-apprulecollection?ref=v1.1.19"

  firewallName                      = module.createFirewall.fwName
  resourceGroupName                 = module.createTargetRgForLzHubNetworking.rgName
  applicationRuleCollectionName     = "Access-from-VMs-to-AzureServices"
  applicationRuleCollectionPriority = 450
  applicationRuleCollectionAction   = "Allow"

  sourceAddreses = data.azurerm_virtual_network.lzhubVnet.address_space

  firewallId = data.azurerm_firewall.hubfirewall.id

  applicationRulesCollection = [
    {
      name = "AOT-VMs-Azure_Services-01"

      targetFqdns = ["*.windows.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-02"

      targetFqdns = ["*.azure-automation.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-03"

      targetFqdns = ["*.microsoft.com"]

      protocol1 = {
        port = "80"
      type = "Http" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-04"

      targetFqdns = ["*.msauth.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-05"

      targetFqdns = ["*.msftauth.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-06"

      targetFqdns = ["*.digicert.com"]

      protocol1 = {
        port = "80"
      type = "Http" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-07"

      targetFqdns = ["*.azure.com"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-08"

      targetFqdns = ["*.msft.net"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
    },
    {
      name = "AOT-VMs-Azure_Services-09"

      targetFqdns = ["*.windowsupdate.com"]

      protocol1 = {
        port = "443"
      type = "Https" }

      protocol2 = {
        port = "443"
      type = "Https" }
  }, ]
}

######### Firewall #########


########## Firewall N/W rules ##########
module "createFirewallNwRuleCollection_WVD_Vms" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-firewall-nwrulecollection?ref=v1.1.19"

  networkRuleCollectionName     = "Access-RDP-from-WVD-to-VMs"
  networkRuleCollectionPriority = 200
  networkRuleCollectionAction   = "Allow"
  firewallName                  = module.createFirewall.fwName
  resourceGroupName             = module.createTargetRgForLzHubNetworking.rgName

  networkRulesCollection = [
    {
      name                 = "AOT-VMs-MgmtVM-01"
      protocols            = ["TCP"]
      sourceAddreses       = [data.azurerm_subnet.wvdSubnet.address_prefix]
      destinationPorts     = ["3389"]
      destinationAddresses = data.azurerm_virtual_network.lzhubVnet.address_space
    }
  ]
}

########## Firewall N/W rules ##########
