environment = "sandpit"

#gencorenphs key vault
gencoreKvName   = "emersonvmtest"
gencoreKvRgName = ".security"

###########################################################################

rgs = {
  gen-uks-prd-hs-mgmt-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  gen-uks-prd-hs-mgmt-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-hs-mgmt-vnet-rg-01"
    addressSpace  = "gen-core-prod-hs-vnet-address-range" //key vault secret name as value
    dnsServerList = "gen-core-prod-hs-vnet-dns-ips"       //key vault secret name as value
    subnets = {
      gen-uks-prd-hs-adds-snet-01 = {
        enable                    = true
        address                   = "gen-uks-prod-hs-adds-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-sccm-snet-01 = {
        enable                    = true
        address                   = "gen-uks-prod-hs-sccm-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-av-snet-01 = {
        enable                    = true
        address                   = "gen-uks-prod-hs-av-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-wsus-snet-01 = {
        enable                    = true
        address                   = "gen-uks-prod-hs-wsus-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-pep-snet-01 = {
        enable                    = true
        address                   = "gen-uks-prod-hs-pep-snet-address-range" //key vault secret name as value
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mgmt-vnet-01"
    peer2name = "gen-uks-prd-hs-mgmt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "gen-uks-prd-hs-mgmt-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mgmt-vnet-01"    //spoke network
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
  gen-uks-prd-hs-adds-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-adds-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mgmt-vnet-01"
    RGName                = "gen-uks-prd-hs-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-av-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-av-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mgmt-vnet-01"
    RGName                = "gen-uks-prd-hs-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-sccm-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-sccm-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mgmt-vnet-01"
    RGName                = "gen-uks-prd-hs-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-wsus-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-sccm-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mgmt-vnet-01"
    RGName                = "gen-uks-prd-hs-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-pep-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mgmt-vnet-01"
    RGName                = "gen-uks-prd-hs-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-prd-hs-adds-udr-01 = ["gen-uks-prd-hs-adds-snet-01"]
  gen-uks-prd-hs-av-udr-01   = ["gen-uks-prd-hs-av-snet-01"]
  gen-uks-prd-hs-sccm-udr-01 = ["gen-uks-prd-hs-sccm-snet-01"]
  gen-uks-prd-hs-wsus-udr-01 = ["gen-uks-prd-hs-wsus-snet-01"]
  gen-uks-prd-hs-pep-udr-01  = ["gen-uks-prd-hs-pep-snet-01"]
}

############ NSG ########################

nsg = {
  gen-uks-prd-hs-adds-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-hs-mgmt-vnet-rg-01"
  }
  gen-uks-prd-hs-av-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-hs-mgmt-vnet-rg-01"
  }
  gen-uks-prd-hs-sccm-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-hs-mgmt-vnet-rg-01"
  }
  gen-uks-prd-hs-wsus-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-hs-mgmt-vnet-rg-01"
  }
  gen-uks-prd-hs-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-hs-mgmt-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-prd-hs-adds-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIA-ONPREMAD-ADDS"
    #   description                = "AIA-ONPREMAD-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ONPREMAD-KEY-01, GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "750"
    #   name                       = "AIT-HSADO-ADDS"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSADO-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIT-HSADO-ADDS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "800"
    #   name                       = "AIA-SECGOV-HSMID-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSMID-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSMID-ADDS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "850"
    #   name                       = "AIA-SECGOV-HSTENABLE-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSTENABLE-ADDS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "900"
    #   name                       = "AIA-SECGOV-HSPENTEST-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSPENTEST-ADDS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
    # {
    #   direction                  = "Outbound"
    #   priority                   = "400"
    #   name                       = "AOA-ADDS-ONPREMAD"
    #   description                = "AOA-ADDS-ONPREMAD"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ONPREMAD-KEY-01, GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "450"
    #   name                       = "AOT-ADDS-LOGA"
    #   description                = "AOT-ADDS-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HSLOGA-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "500"
    #   name                       = "AOT-ADDS-WSUS"
    #   description                = "AOT-ADDS-WSUS"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8530"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-WSUS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "550"
    #   name                       = "AOT-ADDS-TENABLEAGENT"
    #   description                = "AOT-ADDS-TENABLEAGENT"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8834"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HSTENABLE-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-ADDS-AzureAgent"
      description                                = "AOT-ADDS-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-ADDS-AzureCloud"
      description                                = "AOT-ADDS-AzureCloud"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-ADDS-KMS"
      description                                = "AOT-ADDS-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-ADDS-AzureStorage"
      description                                = "AOT-ADDS-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
  gen-uks-prd-hs-av-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIA-ADDS-AV"
    #   description                = "AIA-ADDS-AV"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "750"
    #   name                       = "AIT-HSADO-AV"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSADO-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIT-HSADO-AV"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "800"
    #   name                       = "AIA-SECGOV-HSMID-AV"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSMID-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSMID-AV"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "850"
    #   name                       = "AIA-SECGOV-HSTENABLE-AV"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSTENABLE-AV"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "900"
    #   name                       = "AIA-SECGOV-HSPENTEST-AV"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSPENTEST-AV"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
    # {
    #   direction                  = "Outbound"
    #   priority                   = "400"
    #   name                       = "AOA-AV-ONPREMAD"
    #   description                = "AOA-AV-ONPREMAD"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "450"
    #   name                       = "AOT-AV-LOGA"
    #   description                = "AOT-AV-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HSLOGA-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "500"
    #   name                       = "AOT-AV-VNET"
    #   description                = "AOT-AV-VNET"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8530"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "550"
    #   name                       = "AOT-AV-TENABLEAGENT"
    #   description                = "AOT-AV-TENABLEAGENT"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8834"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-AV-AzureAgent"
      description                                = "AOT-AV-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-av-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-AV-AzureCloud"
      description                                = "AOT-AV-AzureCloud"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-av-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-AV-KMS"
      description                                = "AOT-AV-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-av-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-AV-AzureStorage"
      description                                = "AOT-AV-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-av-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
  gen-uks-prd-hs-sccm-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIA-ONPREMAD-SCCM"
    #   description                = "AIA-ONPREMAD-SCCM"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-SCCM-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "750"
    #   name                       = "AIT-HSADO-SCCM"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSADO-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-SCCM-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIT-HSADO-SCCM"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "800"
    #   name                       = "AIA-SECGOV-HSMID-SCCM"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSMID-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-SCCM-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSMID-SCCM"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "850"
    #   name                       = "AIA-SECGOV-HSTENABLE-SCCM"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-SCCM-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSTENABLE-SCCM"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "900"
    #   name                       = "AIA-SECGOV-HSPENTEST-SCCM"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-SCCM-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSPENTEST-SCCM"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
    # {
    #   direction                  = "Outbound"
    #   priority                   = "400"
    #   name                       = "AOA-SCCM-ADDS"
    #   description                = "AOA-SCCM-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-SCCM-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "450"
    #   name                       = "AOT-SCCM-LOGA"
    #   description                = "AOT-SCCM-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-SCCM-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HSLOGA-HEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "500"
    #   name                       = "AOT-SCCM-VNET"
    #   description                = "AOT-SCCM-VNET"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8530"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-SCCM-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "550"
    #   name                       = "AOT-SCCM-TENABLEAGENT"
    #   description                = "AOT-SCCM-TENABLEAGENT"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8834"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-SCCM-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-SCCM-AzureAgent"
      description                                = "AOT-SCCM-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-sccm-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-SCCM-AzureCloud"
      description                                = "AOT-SCCM-AzureCloud"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-sccm-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-SCCM-KMS"
      description                                = "AOT-SCCM-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-sccm-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-SCCM-AzureStorage"
      description                                = "AOT-SCCM-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-sccm-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
  gen-uks-prd-hs-wsus-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIA-ONPREMAD-WSUS"
    #   description                = "AIA-ONPREMAD-WSUS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-WSUS-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "750"
    #   name                       = "AIT-HSADO-WSUS"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSADO-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-WSUS-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIT-HSADO-WSUS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "800"
    #   name                       = "AIA-SECGOV-HSMID-WSUS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSMID-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-WSUS-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSMID-WSUS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "850"
    #   name                       = "AIA-SECGOV-HSTENABLE-WSUS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-WSUS-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSTENABLE-WSUS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "900"
    #   name                       = "AIA-SECGOV-HSPENTEST-WSUS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-WSUS-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSPENTEST-WSUS"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
    # {
    #   direction                  = "Outbound"
    #   priority                   = "400"
    #   name                       = "AOA-WSUS-ADDS"
    #   description                = "AOA-WSUS-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-WSUS-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "450"
    #   name                       = "AOT-WSUS-LOGA"
    #   description                = "AOT-WSUS-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-WSUS-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HSLOGA-HEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "500"
    #   name                       = "AOT-WSUS-VNET"
    #   description                = "AOT-WSUS-VNET"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8530"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-WSUS-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "550"
    #   name                       = "AOT-WSUS-TENABLEAGENT"
    #   description                = "AOT-WSUS-TENABLEAGENT"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8834"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-WSUS-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-WSUS-AzureAgent"
      description                                = "AOT-WSUS-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-wsus-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-WSUS-AzureCloud"
      description                                = "AOT-WSUS-AzureCloud"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-wsus-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-WSUS-KMS"
      description                                = "AOT-WSUS-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-wsus-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-WSUS-AzureStorage"
      description                                = "AOT-WSUS-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-wsus-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
  gen-uks-prd-hs-pep-nsg-01 = [
    # {
    #   direction                  = "Inbound"
    #   priority                   = "400"
    #   name                       = "AIA-ONPREMAD-PEP"
    #   description                = "AIA-ONPREMAD-PEP"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-ADDS-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-PEP-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "750"
    #   name                       = "AIT-HSADO-PEP"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSADO-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-PEP-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIT-HSADO-PEP"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "800"
    #   name                       = "AIA-SECGOV-HSMID-PEP"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSMID-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-PEP-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSMID-PEP"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "850"
    #   name                       = "AIA-SECGOV-HSTENABLE-PEP"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-PEP-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSTENABLE-PEP"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "900"
    #   name                       = "AIA-SECGOV-HSPENTEST-PEP"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-AV-PEP-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   description                = "AIA-SECGOV-HSPENTEST-PEP"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
    # {
    #   direction                  = "Outbound"
    #   priority                   = "400"
    #   name                       = "AOA-PEP-ADDS"
    #   description                = "AOA-PEP-ADDS"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-PEP-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "450"
    #   name                       = "AOT-PEP-LOGA"
    #   description                = "AOT-PEP-LOGA"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-PEP-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HSLOGA-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "500"
    #   name                       = "AOT-PEP-VNET"
    #   description                = "AOT-PEP-VNET"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8530"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-PEP-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "GEN-ADDS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "550"
    #   name                       = "AOT-PEP-TENABLEAGENT"
    #   description                = "AOT-PEP-TENABLEAGENT"
    #   protocol                   = "tcp"
    #   destination_port_range     = "8834"
    #   source_port_range          = "*"
    #   source_address_prefix      = "GEN-AV-PEP-01"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "ALZ-HS-KEY-01"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-PEP-AzureAgent"
      description                                = "AOT-PEP-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-pep-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-PEP-AzureCloud"
      description                                = "AOT-PEP-AzureCloud"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-pep-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-PEP-KMS"
      description                                = "AOT-PEP-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-pep-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-PEP-AzureStorage"
      description                                = "AOT-PEP-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-prod-hs-pep-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
  gen-uks-prd-hs-adds-nsg-01 = {
    gen-uks-prd-hs-adds-snet-01 = true
  }
  gen-uks-prd-hs-av-nsg-01 = {
    gen-uks-prd-hs-av-snet-01 = true
  }
  gen-uks-prd-hs-sccm-nsg-01 = {
    gen-uks-prd-hs-sccm-snet-01 = true
  }
  gen-uks-prd-hs-wsus-nsg-01 = {
    gen-uks-prd-hs-wsus-snet-01 = true
  }
  gen-uks-prd-hs-pep-nsg-01 = {
    gen-uks-prd-hs-pep-snet-01 = true
  }
}

###################### gen core non prod #######################
# environment = "Sandpit"

# #gencorehs key vault
# gencoreKvName   = "emersonvmtest"
# gencoreKvRgName = ".security"

# ###########################################################################

# rgs = {
#   gen-uks-np-hs-mgmt-vnet-rg-01 = {
#     enable   = true
#     location = "UK South"
#     tags = {
#       environment = "Production"
#     }
#   }
# }

# vnets = {
# gen-uks-np-hs-mgmt-vnet-01 = {
#     enable        = true
#     rg            = "gen-uks-np-hs-mgmt-vnet-rg-01"
#     addressSpace  = "gen-core-np-hs-vnet-address-range"     //key vault secret name as value
#     dnsServerList = "gen-core-np-hs-vnet-dns-ips"                    //key vault secret name as value
#     subnets = {
#       gen-uks-np-hs-adds-snet-01  = {
#         enable  = true
#         address = "gen-uks-np-hs-adds-snet-address-range" //key vault secret name as value
#         enablePrivateLinkEndPoint = true
#         enablePrivateLinkService = true
#       }
#       gen-uks-np-hs-sccm-snet-01  = {
#         enable  = true
#         address = "gen-uks-np-hs-sccm-snet-address-range" //key vault secret name as value
#         enablePrivateLinkEndPoint = true
#         enablePrivateLinkService = true
#       }
#       gen-uks-np-hs-av-snet-01  = {
#         enable  = true
#         address = "gen-uks-np-hs-av-snet-address-range" //key vault secret name as value
#         enablePrivateLinkEndPoint = true
#         enablePrivateLinkService = true
#       }
#       gen-uks-np-hs-wsus-snet-01  = {
#         enable  = true
#         address = "gen-uks-np-hs-wsus-snet-address-range" //key vault secret name as value
#         enablePrivateLinkEndPoint = true
#         enablePrivateLinkService = true
#       }
#       gen-uks-np-hs-pep-snet-01  = {
#         enable  = true
#         address = "gen-uks-np-hs-pep-snet-address-range" //key vault secret name as value
#         enablePrivateLinkEndPoint = true
#         enablePrivateLinkService = true
#       }
#     }
#   }
# }
# ################# Vnet Peering ################
# vnet_peering = {
#     peer-hub-spoke = {
#       enable       = true
#       peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-np-hs-mgmt-vnet-01"
#       peer2name = "gen-uks-np-hs-mgmt-vnet-01-eit-uks-alz-transit-vnet-01"
#       vnet1rg   = "eit-uks-alz-transit-vnet-rg"     //hub network resource group
#       vnet1name = "eit-uks-alz-transit-vnet-01" //hub network
#       vnet2rg   = "gen-uks-np-hs-mgmt-vnet-rg-01"           //spoke network resource group
#       vnet2name = "gen-uks-np-hs-mgmt-vnet-01"    //spoke network
#      },
#     peer-hub-spoke-01 = {
#       enable       = false //dummy
#       peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-prd-01"
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

# ########### UDR #######################
# UDR = {
#   gen-uks-np-hs-adds-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-np-hs-adds-snet-01-d_On-Prem-Internet"]
#     NextHopTypes          = ["VirtualAppliance"]
#     VNetName              = "gen-uks-np-hs-mgmt-vnet-01"
#     RGName                = "gen-uks-np-hs-mgmt-vnet-rg-01"
#     kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
#     kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
#   },
#   gen-uks-np-hs-av-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-np-hs-av-snet-01-d_On-Prem-Internet"]
#     NextHopTypes          = ["VirtualAppliance"]
#     VNetName              = "gen-uks-np-hs-mgmt-vnet-01"
#     RGName                = "gen-uks-np-hs-mgmt-vnet-rg-01"
#     kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
#     kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
#   },
#   gen-uks-np-hs-sccm-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-np-hs-sccm-snet-01-d_On-Prem-Internet"]
#     NextHopTypes          = ["VirtualAppliance"]
#     VNetName              = "gen-uks-np-hs-mgmt-vnet-01"
#     RGName                = "gen-uks-np-hs-mgmt-vnet-rg-01"
#     kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
#     kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
#   },
#   gen-uks-np-hs-wsus-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-np-hs-sccm-snet-01-d_On-Prem-Internet"]
#     NextHopTypes          = ["VirtualAppliance"]
#     VNetName              = "gen-uks-np-hs-mgmt-vnet-01"
#     RGName                = "gen-uks-np-hs-mgmt-vnet-rg-01"
#     kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
#     kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
#   },
#   gen-uks-np-hs-pep-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-np-hs-pep-snet-01-d_On-Prem-Internet"]
#     NextHopTypes          = ["VirtualAppliance"]
#     VNetName              = "gen-uks-np-hs-mgmt-vnet-01"
#     RGName                = "gen-uks-np-hs-mgmt-vnet-rg-01"
#     kv_secret_udrprefixes = "gencore-udr-prefixes" //key vault secret name as value
#     kv_secret_nexthopIP   = "gencore-udr-nexthop"  //key vault secret name as value
#   }
# }

# ##################### UDR association with Subnets #######################
# UDR_Subnet_Mapping = {
#   gen-uks-np-hs-adds-udr-01 = ["gen-uks-np-hs-adds-snet-01"]
#   gen-uks-np-hs-av-udr-01 = ["gen-uks-np-hs-av-snet-01"]
#   gen-uks-np-hs-sccm-udr-01 = ["gen-uks-np-hs-sccm-snet-01"]
#   gen-uks-np-hs-wsus-udr-01 = ["gen-uks-np-hs-wsus-snet-01"]
#   gen-uks-np-hs-pep-udr-01 = ["gen-uks-np-hs-pep-snet-01"]
# }

# ############ NSG ########################

# nsg = {
#   gen-uks-np-hs-adds-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-np-hs-mgmt-vnet-rg-01"
#   }
#   gen-uks-np-hs-av-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-np-hs-mgmt-vnet-rg-01"
#   }
#   gen-uks-np-hs-sccm-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-np-hs-mgmt-vnet-rg-01"
#   }
#   gen-uks-np-hs-wsus-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-np-hs-mgmt-vnet-rg-01"
#   }
#   gen-uks-np-hs-pep-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-np-hs-mgmt-vnet-rg-01"
#   }
# }

# nsgrules = {
#   gen-uks-np-hs-adds-nsg-01 = [
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "400"
#     #   name                       = "AIA-ONPREMAD-ADDS"
#     #   description                = "AIA-ONPREMAD-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ONPREMAD-KEY-01, GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "750"
#     #   name                       = "AIT-HSADO-ADDS"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443,445"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSADO-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIT-HSADO-ADDS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "800"
#     #   name                       = "AIA-SECGOV-HSMID-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSMID-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSMID-ADDS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "850"
#     #   name                       = "AIA-SECGOV-HSTENABLE-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSTENABLE-ADDS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "900"
#     #   name                       = "AIA-SECGOV-HSPENTEST-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSPENTEST-ADDS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Inbound"
#       priority                   = "4000"
#       name                       = "Deny-VNET-VNET"
#       description                = "Deny-VNET-VNET"
#       protocol                   = "*"
#       destination_port_range     = "*"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "400"
#     #   name                       = "AOA-ADDS-ONPREMAD"
#     #   description                = "AOA-ADDS-ONPREMAD"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ONPREMAD-KEY-01, GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "450"
#     #   name                       = "AOT-ADDS-LOGA"
#     #   description                = "AOT-ADDS-LOGA"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HSLOGA-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "500"
#     #   name                       = "AOT-ADDS-WSUS"
#     #   description                = "AOT-ADDS-WSUS"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8530"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-WSUS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "550"
#     #   name                       = "AOT-ADDS-TENABLEAGENT"
#     #   description                = "AOT-ADDS-TENABLEAGENT"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8834"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HSTENABLE-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Outbound"
#       priority                   = "3000"
#       name                       = "AOT-ADDS-AzureAgent"
#       description                = "AOT-ADDS-AzureAgent"
#       destination_port_range     = "443"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-adds-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "168.63.129.16/32"   // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3100"
#       name                       = "AOT-ADDS-AzureCloud"
#       description                = "AOT-ADDS-AzureCloud"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-adds-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3200"
#       name                       = "AOT-ADDS-KMS"
#       description                = "AOT-ADDS-KMS"
#       destination_port_range     = "1688"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-adds-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "23.102.135.246"   // hardcoded as this is a Azure public address
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "3300"
#       name                       = "AOT-ADDS-AzureStorage"
#       description                = "AOT-ADDS-AzureStorage"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-adds-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "4000"
#       name                       = "Deny_VNET-VNET"
#       description                = "Deny_VNET-VNET"
#       destination_port_range     = "*"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     },
#   ]
#   gen-uks-np-hs-av-nsg-01 = [
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "400"
#     #   name                       = "AIA-ADDS-AV"
#     #   description                = "AIA-ADDS-AV"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "750"
#     #   name                       = "AIT-HSADO-AV"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443,445"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSADO-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIT-HSADO-AV"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "800"
#     #   name                       = "AIA-SECGOV-HSMID-AV"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSMID-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSMID-AV"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "850"
#     #   name                       = "AIA-SECGOV-HSTENABLE-AV"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSTENABLE-AV"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "900"
#     #   name                       = "AIA-SECGOV-HSPENTEST-AV"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSPENTEST-AV"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Inbound"
#       priority                   = "4000"
#       name                       = "Deny-VNET-VNET"
#       description                = "Deny-VNET-VNET"
#       protocol                   = "*"
#       destination_port_range     = "*"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "400"
#     #   name                       = "AOA-AV-ONPREMAD"
#     #   description                = "AOA-AV-ONPREMAD"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "450"
#     #   name                       = "AOT-AV-LOGA"
#     #   description                = "AOT-AV-LOGA"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HSLOGA-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "500"
#     #   name                       = "AOT-AV-VNET"
#     #   description                = "AOT-AV-VNET"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8530"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "550"
#     #   name                       = "AOT-AV-TENABLEAGENT"
#     #   description                = "AOT-AV-TENABLEAGENT"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8834"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Outbound"
#       priority                   = "3000"
#       name                       = "AOT-AV-AzureAgent"
#       description                = "AOT-AV-AzureAgent"
#       destination_port_range     = "443"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-av-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "168.63.129.16/32"   // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3100"
#       name                       = "AOT-AV-AzureCloud"
#       description                = "AOT-AV-AzureCloud"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-av-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3200"
#       name                       = "AOT-AV-KMS"
#       description                = "AOT-AV-KMS"
#       destination_port_range     = "1688"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-av-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "23.102.135.246"   // hardcoded as this is a Azure public address
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "3300"
#       name                       = "AOT-AV-AzureStorage"
#       description                = "AOT-AV-AzureStorage"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-av-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "4000"
#       name                       = "Deny_VNET-VNET"
#       description                = "Deny_VNET-VNET"
#       destination_port_range     = "*"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     }
#   ]
#   gen-uks-np-hs-sccm-nsg-01 = [
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "400"
#     #   name                       = "AIA-ONPREMAD-SCCM"
#     #   description                = "AIA-ONPREMAD-SCCM"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-SCCM-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "750"
#     #   name                       = "AIT-HSADO-SCCM"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443,445"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSADO-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-SCCM-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIT-HSADO-SCCM"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "800"
#     #   name                       = "AIA-SECGOV-HSMID-SCCM"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSMID-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-SCCM-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSMID-SCCM"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "850"
#     #   name                       = "AIA-SECGOV-HSTENABLE-SCCM"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-SCCM-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSTENABLE-SCCM"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "900"
#     #   name                       = "AIA-SECGOV-HSPENTEST-SCCM"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-SCCM-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSPENTEST-SCCM"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Inbound"
#       priority                   = "4000"
#       name                       = "Deny-VNET-VNET"
#       description                = "Deny-VNET-VNET"
#       protocol                   = "*"
#       destination_port_range     = "*"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "400"
#     #   name                       = "AOA-SCCM-ADDS"
#     #   description                = "AOA-SCCM-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-SCCM-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "450"
#     #   name                       = "AOT-SCCM-LOGA"
#     #   description                = "AOT-SCCM-LOGA"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-SCCM-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HSLOGA-HEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "500"
#     #   name                       = "AOT-SCCM-VNET"
#     #   description                = "AOT-SCCM-VNET"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8530"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-SCCM-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "550"
#     #   name                       = "AOT-SCCM-TENABLEAGENT"
#     #   description                = "AOT-SCCM-TENABLEAGENT"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8834"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-SCCM-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Outbound"
#       priority                   = "3000"
#       name                       = "AOT-SCCM-AzureAgent"
#       description                = "AOT-SCCM-AzureAgent"
#       destination_port_range     = "443"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-sccm-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "168.63.129.16/32"   // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3100"
#       name                       = "AOT-SCCM-AzureCloud"
#       description                = "AOT-SCCM-AzureCloud"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-sccm-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3200"
#       name                       = "AOT-SCCM-KMS"
#       description                = "AOT-SCCM-KMS"
#       destination_port_range     = "1688"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-sccm-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "23.102.135.246"   // hardcoded as this is a Azure public address
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "3300"
#       name                       = "AOT-SCCM-AzureStorage"
#       description                = "AOT-SCCM-AzureStorage"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-sccm-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "4000"
#       name                       = "Deny_VNET-VNET"
#       description                = "Deny_VNET-VNET"
#       destination_port_range     = "*"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     }
#   ]
#   gen-uks-np-hs-wsus-nsg-01 = [
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "400"
#     #   name                       = "AIA-ONPREMAD-WSUS"
#     #   description                = "AIA-ONPREMAD-WSUS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-WSUS-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "750"
#     #   name                       = "AIT-HSADO-WSUS"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443,445"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSADO-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-WSUS-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIT-HSADO-WSUS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "800"
#     #   name                       = "AIA-SECGOV-HSMID-WSUS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSMID-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-WSUS-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSMID-WSUS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "850"
#     #   name                       = "AIA-SECGOV-HSTENABLE-WSUS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-WSUS-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSTENABLE-WSUS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "900"
#     #   name                       = "AIA-SECGOV-HSPENTEST-WSUS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-WSUS-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSPENTEST-WSUS"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Inbound"
#       priority                   = "4000"
#       name                       = "Deny-VNET-VNET"
#       description                = "Deny-VNET-VNET"
#       protocol                   = "*"
#       destination_port_range     = "*"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "400"
#     #   name                       = "AOA-WSUS-ADDS"
#     #   description                = "AOA-WSUS-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-WSUS-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "450"
#     #   name                       = "AOT-WSUS-LOGA"
#     #   description                = "AOT-WSUS-LOGA"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-WSUS-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HSLOGA-HEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "500"
#     #   name                       = "AOT-WSUS-VNET"
#     #   description                = "AOT-WSUS-VNET"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8530"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-WSUS-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "550"
#     #   name                       = "AOT-WSUS-TENABLEAGENT"
#     #   description                = "AOT-WSUS-TENABLEAGENT"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8834"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-WSUS-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Outbound"
#       priority                   = "3000"
#       name                       = "AOT-WSUS-AzureAgent"
#       description                = "AOT-WSUS-AzureAgent"
#       destination_port_range     = "443"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-wsus-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "168.63.129.16/32"   // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3100"
#       name                       = "AOT-WSUS-AzureCloud"
#       description                = "AOT-WSUS-AzureCloud"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-wsus-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3200"
#       name                       = "AOT-WSUS-KMS"
#       description                = "AOT-WSUS-KMS"
#       destination_port_range     = "1688"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-wsus-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "23.102.135.246"   // hardcoded as this is a Azure public address
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "3300"
#       name                       = "AOT-WSUS-AzureStorage"
#       description                = "AOT-WSUS-AzureStorage"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-wsus-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "4000"
#       name                       = "Deny_VNET-VNET"
#       description                = "Deny_VNET-VNET"
#       destination_port_range     = "*"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     }
#   ]
#   gen-uks-np-hs-pep-nsg-01 = [
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "400"
#     #   name                       = "AIA-ONPREMAD-PEP"
#     #   description                = "AIA-ONPREMAD-PEP"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-ADDS-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-PEP-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "750"
#     #   name                       = "AIT-HSADO-PEP"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443,445"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSADO-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-PEP-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIT-HSADO-PEP"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "800"
#     #   name                       = "AIA-SECGOV-HSMID-PEP"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSMID-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-PEP-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSMID-PEP"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "850"
#     #   name                       = "AIA-SECGOV-HSTENABLE-PEP"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSTENABLE-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-PEP-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSTENABLE-PEP"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Inbound"
#     #   priority                   = "900"
#     #   name                       = "AIA-SECGOV-HSPENTEST-PEP"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "ALZ-HSPENTEST-KEY-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-AV-PEP-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   description                = "AIA-SECGOV-HSPENTEST-PEP"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Inbound"
#       priority                   = "4000"
#       name                       = "Deny-VNET-VNET"
#       description                = "Deny-VNET-VNET"
#       protocol                   = "*"
#       destination_port_range     = "*"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "400"
#     #   name                       = "AOA-PEP-ADDS"
#     #   description                = "AOA-PEP-ADDS"
#     #   protocol                   = "*"
#     #   destination_port_range     = "*"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-PEP-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ONPREMAD-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "450"
#     #   name                       = "AOT-PEP-LOGA"
#     #   description                = "AOT-PEP-LOGA"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "443"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-PEP-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HSLOGA-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "500"
#     #   name                       = "AOT-PEP-VNET"
#     #   description                = "AOT-PEP-VNET"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8530"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-PEP-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "GEN-ADDS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     # {
#     #   direction                  = "Outbound"
#     #   priority                   = "550"
#     #   name                       = "AOT-PEP-TENABLEAGENT"
#     #   description                = "AOT-PEP-TENABLEAGENT"
#     #   protocol                   = "tcp"
#     #   destination_port_range     = "8834"
#     #   source_port_range          = "*"
#     #   source_address_prefix      = "GEN-AV-PEP-01"
#     #   source_address_prefixes    = ""
#     #   destination_address_prefixes = ""
#     #   destination_address_prefix = "ALZ-HS-KEY-01"
#     #   source_application_security_group_ids      = ""
#     #   destination_application_security_group_ids = ""
#     #   access                     = "Allow"
#     #   fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
#     #   fetch_from_asg             = []
#     # },
#     {
#       direction                  = "Outbound"
#       priority                   = "3000"
#       name                       = "AOT-PEP-AzureAgent"
#       description                = "AOT-PEP-AzureAgent"
#       destination_port_range     = "443"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-pep-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "168.63.129.16/32"   // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3100"
#       name                       = "AOT-PEP-AzureCloud"
#       description                = "AOT-PEP-AzureCloud"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-pep-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
# 		{
#       direction                  = "Outbound"
#       priority                   = "3200"
#       name                       = "AOT-PEP-KMS"
#       description                = "AOT-PEP-KMS"
#       destination_port_range     = "1688"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-pep-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "23.102.135.246"   // hardcoded as this is a Azure public address
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "3300"
#       name                       = "AOT-PEP-AzureStorage"
#       description                = "AOT-PEP-AzureStorage"
#       destination_port_range     = "443,445"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "gen-uks-np-hs-pep-snet-address-range"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Allow"
#       fetch_from_kv              = ["source_address_prefix"]
#       fetch_from_asg             = []
#     },
#     {
#       direction                  = "Outbound"
#       priority                   = "4000"
#       name                       = "Deny_VNET-VNET"
#       description                = "Deny_VNET-VNET"
#       destination_port_range     = "*"
#       protocol                   = "tcp"
#       source_port_range          = "*"
#       source_address_prefix      = "VirtualNetwork"
#       source_address_prefixes    = ""
#       destination_address_prefixes = ""
#       destination_address_prefix = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                     = "Deny"
#       fetch_from_kv              = []
#       fetch_from_asg             = []
#     }
#   ]
# }

# nsg_subnet_mapping = {
#   gen-uks-np-hs-adds-nsg-01 = {
#     gen-uks-np-hs-adds-snet-01 = true
#   }
#   gen-uks-np-hs-av-nsg-01 = {
#     gen-uks-np-hs-av-snet-01 = true
#   }
#   gen-uks-np-hs-sccm-nsg-01 = {
#     gen-uks-np-hs-sccm-snet-01 = true
#   }
#   gen-uks-np-hs-wsus-nsg-01 = {
#     gen-uks-np-hs-wsus-snet-01 = true
#   }
#   gen-uks-np-hs-pep-nsg-01 = {
#     gen-uks-np-hs-pep-snet-01 = true
#   }
# }
