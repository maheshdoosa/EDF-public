environment = "High Secured Upper"

#gendiamondhs key vault
gendiamondhsKvName   = "avmgenuprhswkloadsub01kv"
gendiamondhsKvRgName = ".security"

###########################################################################

rgs = {
  gen-uks-upr-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Upper"
    }
  }
}

vnets = {
  gen-uks-upr-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-upr-hs-wkload-vnet-rg-01"
    addressSpace  = "gen-uks-upr-hs-vnet-address-range" //key vault secret name as value
    dnsServerList = "gen-uks-upr-hs-vnet-dns-ips"       //key vault secret name as value
    subnets = {
      gen-uks-upr-hs-replicate-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-rep-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "azbastion-upr-hs-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-genwiki-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-genwiki-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-asbestosdb-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-asbestosdb-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-sqlinsights-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-sqlinsights-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-riskandam-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-riskandam-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-asg-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-asg-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-baer-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-baer-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-fls-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-fls-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-upr-hs-lzendpoints-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-lzendpoints-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-pads-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-pads-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-lmgr-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-lmgr-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-beran-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-beran-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-sql2k16-snet-01 = {
        enable                    = true
        address                   = "gen-uks-upr-hs-sql2k16-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-sql2k08-snet-01 = {
        enable                    = true
        address                   = "gen-uks-prd-hs-sql2k08-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

########### UDR #######################
UDR = {
  gen-uks-upr-hs-replicate-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-replicate-snet-01-d_On-Prem-Internet", "s_gen-uks-upr-hs-replicate-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-upr-hs-genwiki-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-genwiki-snet-01-d_On-Prem-Internet", "s_gen-uks-upr-hs-genwiki-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-upr-hs-asbestosdb-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-asbestosdb-snet-01-d_On-Prem-Internet", "s_gen-uks-upr-hs-asbestosdb-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-upr-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-upr-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-upr-hs-sqlinsights-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-sqlinsights-snet-01-d_On-Prem-InternetAddress"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  # gen-uks-upr-hs-riskandam-udr-01 = {
  #   enable                = true
  #   RouteNames            = ["s_gen-uks-upr-hs-riskandam-snet-01-d_On-Prem-Internet"]
  #   NextHopTypes          = ["VirtualAppliance"]
  #   VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
  #   RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
  #   kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
  #   kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  # },
  # gen-uks-upr-hs-asg-udr-01 = {
  #   enable                = true
  #   RouteNames            = ["s_gen-uks-upr-hs-asg-snet-01-d_On-Prem-Internet"]
  #   NextHopTypes          = ["VirtualAppliance"]
  #   VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
  #   RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
  #   kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
  #   kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  # }
  # gen-uks-upr-hs-baer-udr-01 = {
  #   enable                = true
  #   RouteNames            = ["s_gen-uks-upr-hs-baer-snet-01-d_On-Prem-Internet"]
  #   NextHopTypes          = ["VirtualAppliance"]
  #   VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
  #   RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
  #   kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
  #   kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  # }
  gen-uks-upr-hs-fls-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-fls-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-upr-hs-lzendpoints-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-upr-hs-lzendpoints-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-pads-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-pads-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-lmgr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-lmgr-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-beran-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-beran-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-sql2k16-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-sql2k16-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-prd-hs-sql2k08-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-sql2k08-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-upr-hs-wkload-vnet-01"
    RGName                = "gen-uks-upr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamond-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamond-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-upr-hs-replicate-udr-01  = ["gen-uks-upr-hs-replicate-snet-01"]
  gen-uks-upr-hs-genwiki-udr-01    = ["gen-uks-upr-hs-genwiki-snet-01"]
  gen-uks-upr-hs-asbestosdb-udr-01 = ["gen-uks-upr-hs-asbestosdb-snet-01"]
  gen-uks-upr-hs-pep-udr-01        = ["gen-uks-upr-hs-pep-snet-01"]
  gen-uks-upr-hs-sqlinsights-udr-01 = ["gen-uks-upr-hs-sqlinsights-snet-01"]
  # gen-uks-upr-hs-riskandam-udr-01 = ["gen-uks-upr-hs-riskandam-snet-01"]
  # gen-uks-upr-hs-asg-udr-01       = ["gen-uks-upr-hs-asg-snet-01"]
  # gen-uks-upr-hs-baer-udr-01      = ["gen-uks-upr-hs-baer-snet-01"]
  gen-uks-upr-hs-fls-udr-01         = ["gen-uks-upr-hs-fls-snet-01"]
  gen-uks-upr-hs-lzendpoints-udr-01 = ["gen-uks-upr-hs-lzendpoints-snet-01"]
  gen-uks-prd-hs-pads-udr-01        = ["gen-uks-prd-hs-pads-snet-01"]
  gen-uks-prd-hs-lmgr-udr-01        = ["gen-uks-prd-hs-lmgr-snet-01"]
  gen-uks-prd-hs-beran-udr-01       = ["gen-uks-prd-hs-beran-snet-01"]
  gen-uks-prd-hs-sql2k16-udr-01       = ["gen-uks-prd-hs-sql2k16-snet-01"]
  gen-uks-prd-hs-sql2k08-udr-01       = ["gen-uks-prd-hs-sql2k08-snet-01"]
}
################# Vnet Peering ################
vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-upr-hs-wkload-vnet-01"
    peer2name = "gen-uks-upr-hs-wkload-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"      //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"      //hub network
    vnet2rg   = "gen-uks-upr-hs-wkload-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-upr-hs-wkload-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-ss-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-ss-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-ss-mdw-vnet-prd-01" //spoke network
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

# ############### NSG's ##############
# nsg = {
#   gen-uks-upr-hs-pep-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-upr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-upr-hs-replicate-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-upr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-upr-hs-genwiki-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-upr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-upr-hs-asbestosdb-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-upr-hs-wkload-vnet-rg-01"
#   }
# }

# nsgrules = {
#   gen-uks-upr-hs-pep-nsg-01 = [
#     {
#       direction                                  = "Inbound"
#       priority                                   = "400"
#       name                                       = "AIA-VNET-PEP"
#       description                                = "AIA-VNET-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-VNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "800"
#       name                                       = "AIA-SECGOV-MID-PEP"
#       description                                = "AIA-SECGOV-MID-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "SECGOV-MID-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "850"
#       name                                       = "AIA-SECGOV-TENABLE-PEP"
#       description                                = "AIA-SECGOV-TENABLE-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "SECGOV-TENABLE-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "900"
#       name                                       = "AIA-SECGOV-PENTEST-PEP"
#       description                                = "AIA-SECGOV-PENTEST-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "SECGOV-PENTEST-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "4000"
#       name                                       = "DIA-VNET-VNET"
#       description                                = "DIA-VNET-VNET"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "4096"
#       name                                       = "DIA-INTERNET-VNET"
#       description                                = "DIA-INTERNET-VNET"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "Internet"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "550"
#       name                                       = "AOA-PEP-TENABLEAGENT"
#       description                                = "AOA-PEP-TENABLEAGENT"
#       protocol                                   = "tcp"
#       destination_port_range                     = "8834"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "TENABLEAGENT-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "3000"
#       name                                       = "AOT-PEP-AzureAgent"
#       description                                = "AOT-PEP-AzureAgent"
#       destination_port_range                     = "443"
#       protocol                                   = "TCP"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "AZUREAGENT-SECRET" // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix","destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "3050"
#       name                                       = "AOT-PEP-AZURECLOUD"
#       description                                = "AOT-PEP-AZURECLOUD"
#       destination_port_range                     = "443,445"
#       protocol                                   = "TCP"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "3100"
#       name                                       = "AOT-PEP-AzureStorage"
#       description                                = "AOT-PEP-AzureStorage"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "4000"
#       name                                       = "DOA-VNET-VNET"
#       description                                = "DOA-VNET-VNET"
#       destination_port_range                     = "*"
#       protocol                                   = "*"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "4096"
#       name                                       = "DOA-VNET-INTERNET"
#       protocol                                   = "*"
#       destination_port_range                     = "*"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "Internet"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       description                                = "DOA-VNET-INTERNETT"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-PEP-ICA"
#       description                                = "AOT-PEP-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = "hs-ica-subnet-address-range"
#       destination_address_prefix                 = ""
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-upr-hs-replicate-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-replicate-PEP"
#       description                                = "AOA-replicate-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-REPLICATE-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-replicate-ICA"
#       description                                = "AOT-replicate-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-REPLICATE-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = "hs-ica-subnet-address-range"
#       destination_address_prefix                 = ""
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-upr-hs-genwiki-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-GENWIKI-PEP"
#       description                                = "AOA-GENWIKI-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-GENWIKI-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-GENWIKI-ICA"
#       description                                = "AOT-GENWIKI-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-GENWIKI-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = "hs-ica-subnet-address-range"
#       destination_address_prefix                 = ""
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-upr-hs-asbestosdb-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-asbestosdb-PEP"
#       description                                = "AOA-asbestosdb-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-ASBETOSDB-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-UPPER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-asbestosdb-ICA"
#       description                                = "AOT-asbestosdb-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-UPPER-ASBETOSDB-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = "hs-ica-subnet-address-range"
#       destination_address_prefix                 = ""
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
#       fetch_from_asg                             = []
#     }
#   ]
# }

# nsg_subnet_mapping = {
#   gen-uks-upr-hs-pep-nsg-01 = {
#     gen-uks-upr-hs-pep-snet-01 = true
#   }
#   gen-uks-upr-hs-replicate-nsg-01 = {
#     gen-uks-upr-hs-replicate-snet-01 = true
#   }
#   gen-uks-upr-hs-genwiki-nsg-01 = {
#     gen-uks-upr-hs-genwiki-snet-01 = true
#   }
#   gen-uks-upr-hs-asbestosdb-nsg-01 = {
#     gen-uks-upr-hs-asbestosdb-snet-01 = true
#   }
# }

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
retention_policydays      = 90
category1                 = "VMProtectionAlerts"
category2                 = "AllMetrics"
diag_vnet_name            = "gen-uks-upr-hs-wkload-vnet-01"
diag_vnet_rg              = "gen-uks-upr-hs-wkload-vnet-rg-01"
