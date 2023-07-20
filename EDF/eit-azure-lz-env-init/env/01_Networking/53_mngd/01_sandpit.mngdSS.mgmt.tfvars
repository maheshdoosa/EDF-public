environment = "Test"

#mgmtss key vault
mngdssKvName   = "emersonvmtest"
mngdssKvRgName = ".security"

###########################################################################

rgs = {
  gen-uks-tst-ss-managed-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}

vnets = {
  gen-uks-tst-ss-managed-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-ss-managed-vnet-rg-01"
    addressSpace  = "mngdss-tst-vnet-address-range" //key vault secret name as value
    dnsServerList = "mngdss-tst-dns-ips"            //key vault secret name as value
    subnets = {
      gen-uks-tst-ss-ams-snet-01 = {
        enable                    = true
        address                   = "mngdSS-tst-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}
################# Vnet Peering ################
vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-ss-managed-vnet-01"
    peer2name = "gen-uks-tst-ss-managed-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"       //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"       //hub network
    vnet2rg   = "gen-uks-tst-ss-managed-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-tst-ss-managed-vnet-01"    //spoke network
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

tenantId            = "tenantId"              //key vault secret name as value
hubSubscriptionId   = "transitSubscriptionId" //key vault secret name as value
spokeSubscriptionId = "subscriptionId"        //key vault secret name as value

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########### UDR #######################
UDR = {
  gen-uks-tst-ss-ams-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-ss-emerson-snet-01-d_On-Prem-Internet", "s_gen-uks-tst-ss-emerson-snet-01-d_eit-alz-ss-adds-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-ss-managed-vnet-01"
    RGName                = "gen-uks-tst-ss-managed-vnet-rg-01"
    kv_secret_udrprefixes = "eam-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "eam-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-tst-ss-ams-udr-01 = ["gen-uks-tst-ss-ams-snet-01"]
}


nsg = {
  gen-uks-tst-ss-ams-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-ss-managed-vnet-rg-01"
  }
}
################## NSG's ####################
nsgrules = {
  gen-uks-tst-ss-ams-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-AMSMANGER"
      description                                = "AIA-ADDS-AMSMANGER"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-tst-subnet-address-range"
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
      source_address_prefix                      = "eit-alz-ss-mgmt-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-ONPREMRDP-AMSMANGER"
      description                                = "AIT-ONPREMRDP-AMSMANGER"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
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
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-AMSMANAGER-ADDS"
      description                                = "AOA-AMSMANAGER-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-AMSMANAGER-LOGA"
      description                                = "AOT-AMSMANAGER-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-loga-01-address-range"
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
    #   description                = "AOT-AMSMANAGER-WSUS"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "mngdSS-tst-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "eit-alz-ss-mgmt-loga-01-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "2000"
      name                                       = "AOT-AMSMANAGER-AzureAgent"
      description                                = "AOT-AMSMANAGER-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2100"
      name                                       = "AOT-AMSMANAGER-AzureCloud"
      description                                = "AOT-AMSMANAGER-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2200"
      name                                       = "AOT-AMSMANAGER-KMS"
      description                                = "AOT-AMSMANAGER-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
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
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-AMSMANAGER-AzureStorage"
      description                                = "AOT-AMSMANAGER-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },

  ]
}

nsg_subnet_mapping = {
  gen-uks-tst-ss-ams-nsg-01 = {
    gen-uks-tst-ss-ams-snet-01 = true
  }
}
