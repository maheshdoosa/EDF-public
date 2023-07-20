environment = "Sandpit"

#cenadt key vault
cenadtKvName   = "eitlzmanagementhsk"
cenadtKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-hs-cenadt-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  eit-uks-alz-hs-cenadt-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-hs-cenadt-vnet-rg-01"
    addressSpace  = "cenadt-prd-vnet-address-range" //key vault secret name as value
    dnsServerList = "cenadt-prd-dns-ips"            //key vault secret name as value
    subnets = {
      eit-alz-hs-cenadt-audit-snet-01 = {
        enable                    = true
        address                   = "cenadt-prd-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-hs-cenadt-vnet-01"
    peer2name = "eit-uks-alz-hs-cenadt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"      //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"      //hub network
    vnet2rg   = "eit-uks-alz-hs-cenadt-vnet-rg-01" //spoke network resource group
    vnet2name = "eit-uks-alz-hs-cenadt-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01" //spoke network
  }
}

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false


UDR = {
  eit-alz-hs-cenadt-audit-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-cenadt-audit-snet-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-cenadt-vnet-01"
    RGName                = "eit-uks-alz-hs-cenadt-vnet-rg-01"
    kv_secret_udrprefixes = "cenadt-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "cenadt-prd-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  eit-alz-hs-cenadt-audit-udr-01 = ["eit-alz-hs-cenadt-audit-snet-01"]
}


nsg = {
  eit-uks-alz-hs-cenadt-audit-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-cenadt-vnet-rg-01"
  }
}

nsgrules = {
  eit-uks-alz-hs-cenadt-audit-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIT-HS-VNETs-LOGA"
    #   description                = "AIT-HS-VNETs-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "eit-alz-hs-vnets-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "cenadt-prd-subnet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "450"
    #   name                       = "AIT-SS-VNETs-LOGA"
    #   description                = "AIT-SS-VNETs-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "eit-alz-ss-vnets-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "cenadt-prd-subnet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2000"
      name                                       = "AOT-Audit_AzureCloud"
      description                                = "AOT-Audit_AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2100"
    #   name                       = "Deny_Internet"
    #   description                = "Deny_Internet"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "cenadt-prd-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "Internet"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Deny"
    #   fetch_from_kv              = ["source_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
  ]
}

nsg_subnet_mapping = {
  eit-uks-alz-hs-cenadt-audit-nsg-01 = {
    eit-alz-hs-cenadt-audit-snet-01 = true
  }
}


tenantId            = "tenantId"                   //key vault secret name as value
hubSubscriptionId   = "hsTransitSubscriptionId"    //key vault secret name as value
spokeSubscriptionId = "hsManagementSubscriptionId" //key vault secret name as value

################ Private Linkscope ##################
SubscriptionId            = "hsManagementSubscriptionId" //key vault secret name as value
cenadtContributorSPAppId  = "hsmgmtContributorSPAppId"   //key vault secret name as value
cenadtContributorSPSecret = "hsmgmtContributorSPSecret"  //key vault secret name as value

################ Private endpoint ##################
laEndPointName           = "eituksalzhscenadtloga01-pe"
endPointLocation         = "UK South"
resourceGroupName        = "eit-uks-alz-hs-cenadt-loga-rg-01"
laSubResourceName        = ["azuremonitor"]
laPrivateServiceConnName = "eit-uks-alz-hs-cenadt-ampls-01"
