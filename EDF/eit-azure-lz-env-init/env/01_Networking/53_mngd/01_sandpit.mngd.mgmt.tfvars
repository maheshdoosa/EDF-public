environment = "Sandpit"

######### MngdHS key vault ##############################
mngdhsKvName   = "emersonvmtest"
mngdhsKvRgName = ".security"

rgs = {
  gen-uks-tst-hs-managed-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Sandpit"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-tst-hs-managed-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-hs-managed-vnet-rg-01"
    addressSpace  = "mngdhs-tst-vnet-address-range"
    dnsServerList = "mngdhs-tst-dns-ips"
    subnets = {
      gen-uks-tst-hs-comsy-snet-01 = {
        enable                    = true
        address                   = "mngdhs-tst-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

######################## Vnet Peering ##############################

# vnet_peering = {
#     peer-hub-spoke = {
#       enable       = true
#       peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-hs-managed-vnet-01"
#       peer2name = "gen-uks-tst-hs-managed-vnet-01-eit-uks-alz-transit-vnet-01"
#       vnet1rg   = "eit-uks-alz-transit-vnet-rg"     //hub network resource group
#       vnet1name = "eit-uks-alz-transit-vnet-01" //hub network
#       vnet2rg   = "gen-uks-tst-hs-managed-vnet-rg-01"           //spoke network resource group
#       vnet2name = "gen-uks-tst-hs-managed-vnet-01"    //spoke network
#      },
#     peer-hub-spoke-01 = {
#       enable       = true //dummy
#       peer1name = "uks-tst-hs-managed-vnet-01-eit-uks-alz-transit-vnet-01"
#       peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
#       vnet1rg   = "eit-uks-alz-transit-vnet-rg"     //hub network resource group
#       vnet1name = "eit-uks-alz-transit-vnet-01" //hub network
#       vnet2rg   = "data-uks-prd-vnet-prd-rg-01"           //spoke network resource group
#       vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01"    //spoke network
#      }
# }

# tenantId = "tenantId"                           //key vault secret name as value
# hubSubscriptionId = "transitSubscriptionId"     //key vault secret name as value
# spokeSubscriptionId = "subscriptionId"          //key vault secret name as value

# AllowVirtualNetworkAccess = true
# AllowForwardedTraffic     = true
# AllowGatewayTransitVNet12 = true
# AllowGatewayTransitVNet21 = false
# UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-tst-hs-comsy-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-managed-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-managed-snet-d_eit-uks-alz-t2-mngd-snet", "s_gen-uks-tst-hs-managed-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-managed-snet-d_eit-uks-alz-ss-mngd-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-tst-hs-managed-vnet-01"
    RGName                = "gen-uks-tst-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "eam-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
}

##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-tst-hs-comsy-udr-01 = ["gen-uks-tst-hs-comsy-snet-01"]
}

################ NSG #########################
nsg = {
  gen-uks-tst-hs-comsy-nsg-01 = {
    enable   = true
    location = "UK South"
    # rg       = "gen-uks-tst-hs-comsy-rg-01"
    rg = "ab-test-Rg"
  }
}

nsgrules = {
  gen-uks-tst-hs-comsy-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIA-ADDS-AMSMANGER"
    #   description                = "AIA-ADDS-AMSMANGER"
    #   protocol                   = "Any"
    #   destination_port_range     = "Any"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-adds-src-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WSUS-AMSMANGER"
      description                                = "AIT-WSUS-AMSMANGER"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "hs-mngd-wsus-src-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mngd-gen-uks-comsy-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-WAC-AMSMANGER"
      description                                = "AIT-WAC-AMSMANGER"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "hs-mngd-wac-src-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mngd-gen-uks-comsy-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "600"
    #   name                       = "AIT-AMSDEVICE-AMSMANGER"
    #   description                = "AIT-AMSDEVICE-AMSMANGER"
    #   protocol                   = "tcp"
    #   destination_port_range     = "TBC"
    #   source_port_range          = "*"
    #   source_address_prefix      = "On Prem TBC"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "650"
    #   name                       = "AIT-AMSCLIENT-AMSMANGER"
    #   description                = "AIT-AMSCLIENT-AMSMANGER"
    #   protocol                   = "tcp"
    #   destination_port_range     = "TBC"
    #   source_port_range          = "*"
    #   source_address_prefix      = "On Prem TBC"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "650"
    #   name                       = "AIT-AMSCLIENT-AMSMANGER"
    #   description                = "AIT-AMSCLIENT-AMSMANGER"
    #   protocol                   = "tcp"
    #   destination_port_range     = "TBC"
    #   source_port_range          = "*"
    #   source_address_prefix      = "On Prem TBC"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "4000"
    #   name                       = "Deny-VNET-VNET"
    #   description                = "Deny-VNET-VNET"
    #   destination_port_range     = "*"
    #   protocol                   = "Any"
    #   source_port_range          = "*"
    #   source_address_prefix      = "VirtualNetwork"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "VirtualNetwork"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Deny"
    #   fetch_from_kv              = []
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "400"
    #   name                       = "AOA-AMSMANAGER-ADDS"
    #   description                = "AOA-AMSMANAGER-ADDS"
    #   protocol                   = "Any"
    #   destination_port_range     = "Any"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "hs-mngd-adds-src-address-range-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-AMSMANAGER-LOGA"
      description                                = "AOT-AMSMANAGER-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hs-mngd-gen-uks-comsy-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mngd-adds-src-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "500"
    #   name                       = "AOT-AMSMANAGER-WSUS"
    #   description                = "AOT-AMSMANAGER-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "TBC"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "On Prem TBC"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "550"
    #   name                       = "AOT-AMSMANAGER-AMSDevices"
    #   description                = "AOT-AMSMANAGER-AMSDevices"
    #   protocol                   = "tcp"
    #   destination_port_range     = "TBC"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "On Prem TBC"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-AMSMANAGER-AMSDevices"
      description                                = "AOT-AMSMANAGER-AMSDevices"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "hs-mngd-gen-uks-comsy-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mngd-wsus-src-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2000"
    #   name                       = "AOT-AMSMANAGER-AzureAgent"
    #   description                = "AOT-AMSMANAGER-AzureAgent"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = ""
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2100"
    #   name                       = "AOT-AMSMANAGER-AzureCloud"
    #   description                = "AOT-AMSMANAGER-AzureCloud"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "AzureCloud"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2200"
    #   name                       = "AOT-AMSMANAGER-KMS"
    #   description                = "AOT-AMSMANAGER-KMS"
    #   protocol                   = "tcp"
    #   destination_port_range     = "1688"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "23.102.135.246"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2300"
    #   name                       = "AOT-AMSMANAGER-AzureStorage"
    #   description                = "AOT-AMSMANAGER-AzureStorage"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "hs-mngd-gen-uks-comsy-address-range-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "Storage"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      protocol                                   = "tcp"
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
    }
  ]
}

nsg_subnet_mapping = {
  gen-uks-tst-hs-comsy-nsg-01 = {
    gen-uks-tst-hs-comsy-snet-01 = true
  }
}
