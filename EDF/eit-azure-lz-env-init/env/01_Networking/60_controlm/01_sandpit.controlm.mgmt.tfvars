environment = "Sandpit"

# Control-m HS key vault
controlmhsKvName   = "emersonvmtest"
controlmhsKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-prd-hs-ctrlm-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Sandpit"
    }
  }
}

vnets = {
  eit-uks-prd-hs-mngd-vnet-01 = {
    enable        = true
    rg            = "eit-uks-prd-hs-ctrlm-rg-01"
    addressSpace  = "eit-prd-hs-mngd-vnet-address-range" //key vault secret name as value
    dnsServerList = "eit-prd-hs-mngd-dns-ips"            //key vault secret name as value
    subnets = {
      eit-uks-prd-hs-ctrlm-snet-01 = {
        enable                    = true
        address                   = "eit-uks-prd-hs-ctrlm-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-uks-prd-hs-pep-snet-01 = {
        enable                    = true
        address                   = "eit-uks-prd-hs-pep-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

########### UDR #######################
UDR = {
  eit-uks-prd-hs-ctrlm-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-ctrlm-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "eit-uks-prd-hs-mngd-vnet-01"
    RGName                = "eit-uks-prd-hs-ctrlm-rg-01"
    kv_secret_udrprefixes = "controlm-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "controlm-udr-nexthop"  //key vault secret name as value
  },
  eit-uks-prd-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-uks-prd-hs-pep-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "eit-uks-prd-hs-mngd-vnet-01"
    RGName                = "eit-uks-prd-hs-ctrlm-rg-01"
    kv_secret_udrprefixes = "controlm-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "controlm-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  eit-uks-prd-hs-ctrlm-udr-01 = ["eit-uks-prd-hs-ctrlm-snet-01"]
  eit-uks-prd-hs-pep-udr-01   = ["eit-uks-prd-hs-pep-snet-01"]
}

# ################# Vnet Peering ################
# vnet_peering = {
#   peer-hub-spoke = {
#     enable    = true
#     peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-prd-hs-mngd-vnet-01"
#     peer2name = "eit-uks-prd-hs-mngd-vnet-01-eit-uks-alz-transit-vnet-01"
#     vnet1rg   = "eit-uks-alz-transit-vnet-rg"      //hub network resource group
#     vnet1name = "eit-uks-alz-transit-vnet-01"      //hub network
#     vnet2rg   = "eit-uks-prd-hs-ctrlm-rg-01" //spoke network resource group
#     vnet2name = "eit-uks-prd-hs-mngd-vnet-01"    //spoke network
#   },
#   peer-hub-spoke-01 = {
#     enable    = false //dummy
#     peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-ss-mdw-vnet-prd-01"
#     peer2name = "gen-uks-prd-ss-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
#     vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
#     vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
#     vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
#     vnet2name = "gen-uks-prd-ss-mdw-vnet-prd-01" //spoke network
#   }
# }

# tenantId            = "tenantId"              //key vault secret name as value
# hubSubscriptionId   = "transitSubscriptionId" //key vault secret name as value
# spokeSubscriptionId = "subscriptionId"        //key vault secret name as value

# AllowVirtualNetworkAccess = true
# AllowForwardedTraffic     = true
# AllowGatewayTransitVNet12 = true
# AllowGatewayTransitVNet21 = false
# UseRemoteGateways         = false

############ NSG's ##############
nsg = {
  eit-uks-prd-hs-crtlm-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-prd-hs-ctrlm-rg-01"
  }
}

nsgrules = {
  eit-uks-prd-hs-crtlm-nsg-01 = [
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "400"
    #   name                                       = "AIA-ADDS-CRTLM"
    #   description                                = "AIA-ADDS-CRTLM"
    #   destination_port_range                     = "*"
    #   protocol                                   = "*"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "eit-adds-alz-subnet-01"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "450"
    #   name                                       = "AIT-WACASG-CTRLM"
    #   description                                = "AIT-WACASG-CTRLM"
    #   destination_port_range                     = "3389,5985,22"
    #   protocol                                   = "tcp"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "eit-wac-alz-subnet-01"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "750"
    #   name                                       = "AIT-HSADO-CTRLM"
    #   description                                = "AIT-HSADO-CTRLM"
    #   destination_port_range                     = "443,445"
    #   protocol                                   = "tcp"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "eit-ado-alz-subnet-01"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "800"
    #   name                                       = "AIA-SECGOV-HSMID-CTRLM"
    #   description                                = "AIA-SECGOV-HSMID-CTRLM"
    #   protocol                                   = "*"
    #   destination_port_range                     = "*"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "sssecgov-prd-subnet-address-range"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "850"
    #   name                                       = "AIA-SECGOV-HSTENABLE-CTRLM"
    #   description                                = "AIA-SECGOV-HSTENABLE-CTRLM"
    #   protocol                                   = "*"
    #   destination_port_range                     = "*"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "900"
    #   name                                       = "AIA-SECGOV-HSPENTEST-CTRLM"
    #   description                                = "AIA-SECGOV-HSPENTEST-CTRLM"
    #   protocol                                   = "*"
    #   destination_port_range                     = "*"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    # {
    #   direction                                  = "Inbound"
    #   priority                                   = "2000"
    #   name                                       = "AIT-SSH-CTRML"
    #   description                                = "AIT-SSH-CTRML"
    #   protocol                                   = "tcp"
    #   destination_port_range                     = "22"
    #   source_port_range                          = "*"
    #   source_address_prefix                      = "gen-vpn-subnets-01"
    #   source_address_prefixes                    = ""
    #   destination_address_prefixes               = ""
    #   destination_address_prefix                 = "eit-uks-prd-hs-ctrlm-snet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                                     = "Allow"
    #   fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg                             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      priority                                   = "4000"
      name                                       = "DOA-VNET-VNET"
      description                                = "DOA-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      priority                                   = "4050"
      name                                       = "DenyAllOutbound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DenyAllOutbound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DOA-VNET-INTERNETT"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
}

nsg_subnet_mapping = {
  eit-uks-prd-hs-crtlm-nsg-01 = {
    eit-uks-prd-hs-ctrlm-snet-01 = true
  }
}
