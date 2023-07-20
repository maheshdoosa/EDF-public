environment = "High Secured Lower"

#gendiamondhs key vault
gendiamondhsKvName   = "avmgenlwrhswkloadsub01kv"
gendiamondhsKvRgName = ".security"

subnetName      = "AzureBastionSubnet"
vnetRgName      = "gen-uks-tb-hs-wkload-vnet-rg-01"
bastionvnetName = "gen-uks-tb-hs-wkload-vnet-01"

###########################################################################

rgs = {
  gen-uks-lwr-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Lower"
    }
  }
  gen-uks-tb-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Lower"
    }
  }
}

vnets = {
  gen-uks-lwr-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    addressSpace  = "gen-uks-lwr-hs-vnet-address-range" //key vault secret name as value
    dnsServerList = "gen-uks-lwr-hs-vnet-dns-ips"       //key vault secret name as value
    subnets = {
      gen-uks-lwr-hs-replicate-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-rep-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "azbastion-lwr-hs-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-lwr-hs-genwiki-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-genwiki-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-lwr-hs-asbestosdb-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-asbestosdb-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-pre-hs-fls-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-fls-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
#        service_endpoints         = ["Microsoft.Storage", "Microsoft.KeyVault"]
      }
      gen-uks-lwr-hs-sqlinsights-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-sqlinsights-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-lwr-hs-riskandam-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-riskandam-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-lwr-hs-lzendpoints-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-lzendpoints-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-lwr-hs-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-pre-hs-lmgr-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-lmgr-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-pre-hs-sql2k16-snet-01 = {
        enable                    = true
        address                   = "gen-uks-pre-hs-sql2k16-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-pre-hs-sql2k08-snet-01 = {
        enable                    = true
        address                   = "gen-uks-pre-hs-sql2k08-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
  gen-uks-tb-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tb-hs-wkload-vnet-rg-01"
    addressSpace  = "gen-uks-tb-hs-vnet-address-range" //key vault secret name as value
    dnsServerList = "gen-uks-tb-hs-vnet-dns-ips"       //key vault secret name as value
    subnets = {
      gen-uks-tb-hs-assetguardian-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tb-hs-assetguardian-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tb-hs-sqlinsights-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tb-hs-sqlinsights-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tb-hs-lzendpoints-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tb-hs-lzendpoints-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tb-hs-pep-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tb-hs-pep-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

########### UDR #######################
UDR = {
  gen-uks-lwr-hs-replicate-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-replicate-snet-01-d_On-Prem-Internet", "s_gen-uks-lwr-hs-replicate-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-lwr-hs-genwiki-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-genwiki-snet-01-d_On-Prem-Internet", "s_gen-uks-lwr-hs-genwiki-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-lwr-hs-asbestosdb-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-asbestosdb-snet-01-d_On-Prem-Internet", "s_gen-uks-lwr-hs-asbestosdb-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-pre-hs-fls-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-pre-hs-fls-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-fls-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"      //key vault secret name as value//
  },
  gen-uks-lwr-hs-sqlinsights-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-sqlinsights-snet-01-d_On-Prem-InternetAddress"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-sql-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"      //key vault secret name as value//
  },
  gen-uks-lwr-hs-riskandam-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-riskandam-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-risk-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  },
  gen-uks-lwr-hs-lzendpoints-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-lzendpoints-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-lzep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  },
  gen-uks-lwr-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-lwr-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-pre-hs-lmgr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-pre-hs-lmgr-snet-01-d_On-Prem-Internet", "s_gen-uks-lwr-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-pre-hs-sql2k16-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-pre-hs-sql2k16-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-tb-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-tb-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-tb-hs-assetguardian-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-assetguardian-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-tb-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-tb-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-tb-hs-sqlinsights-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-sqlinsights-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-tb-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-tb-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-tb-hs-lzendpoints-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-lzendpoints-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-tb-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-tb-udr-nexthop"  //key vault secret name as value//
  },
  gen-uks-tb-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-pep-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-tb-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-tb-udr-nexthop"      //key vault secret name as value//
  },
  gen-uks-pre-hs-sql2k08-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-pre-hs-sql2k08-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-lwr-hs-wkload-vnet-01"
    RGName                = "gen-uks-lwr-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-tb-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-tb-udr-nexthop"      //key vault secret name as value//
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-lwr-hs-replicate-udr-01   = ["gen-uks-lwr-hs-replicate-snet-01"]
  gen-uks-lwr-hs-genwiki-udr-01     = ["gen-uks-lwr-hs-genwiki-snet-01"]
  gen-uks-lwr-hs-asbestosdb-udr-01  = ["gen-uks-lwr-hs-asbestosdb-snet-01"]
  gen-uks-pre-hs-fls-udr-01         = ["gen-uks-pre-hs-fls-snet-01"]
  gen-uks-lwr-hs-sqlinsights-udr-01 = ["gen-uks-lwr-hs-sqlinsights-snet-01"]
  gen-uks-lwr-hs-riskandam-udr-01   = ["gen-uks-lwr-hs-riskandam-snet-01"]
  gen-uks-lwr-hs-lzendpoints-udr-01 = ["gen-uks-lwr-hs-lzendpoints-snet-01"]
  gen-uks-lwr-hs-pep-udr-01         = ["gen-uks-lwr-hs-pep-snet-01"]
  gen-uks-pre-hs-lmgr-udr-01        = ["gen-uks-pre-hs-lmgr-snet-01"]
  gen-uks-pre-hs-sql2k16-udr-01     = ["gen-uks-pre-hs-sql2k16-snet-01"]
  gen-uks-tb-hs-assetguardian-udr-01  = ["gen-uks-tb-hs-assetguardian-snet-01"]
  gen-uks-tb-hs-sqlinsights-udr-01    = ["gen-uks-tb-hs-sqlinsights-snet-01"]
  gen-uks-tb-hs-lzendpoints-udr-01    = ["gen-uks-tb-hs-lzendpoints-snet-01"]
  gen-uks-tb-hs-pep-udr-01            = ["gen-uks-tb-hs-pep-snet-01"]
  gen-uks-pre-hs-sql2k08-udr-01       = ["gen-uks-pre-hs-sql2k08-snet-01"]
}
################# Vnet Peering ################
vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-lwr-hs-wkload-vnet-01"
    peer2name = "gen-uks-lwr-hs-wkload-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"      //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"      //hub network
    vnet2rg   = "gen-uks-lwr-hs-wkload-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-lwr-hs-wkload-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = true //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tb-hs-wkload-vnet-01"
    peer2name = "gen-uks-tb-hs-wkload-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"     //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"     //hub network
    vnet2rg   = "gen-uks-tb-hs-wkload-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-tb-hs-wkload-vnet-01"    //spoke network
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
#   gen-uks-lwr-hs-pep-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-lwr-hs-replicate-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-lwr-hs-genwiki-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-lwr-hs-asbestosdb-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-pre-hs-fls-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-lwr-hs-sqlinsights-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-lwr-hs-riskandam-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   },
#   gen-uks-lwr-hs-lzendpoints-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-lwr-hs-wkload-vnet-rg-01"
#   }
# }

# nsgrules = {
#   gen-uks-lwr-hs-pep-nsg-01 = [
#     {
#       direction                                  = "Inbound"
#       priority                                   = "400"
#       name                                       = "AIA-VNET-PEP"
#       description                                = "AIA-VNET-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-VNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#   gen-uks-lwr-hs-replicate-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-replicate-PEP"
#       description                                = "AOA-replicate-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-REPLICATE-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-REPLICATE-SECRET"
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
#   gen-uks-lwr-hs-genwiki-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-GENWIKI-PEP"
#       description                                = "AOA-GENWIKI-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-GENWIKI-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-GENWIKI-SECRET"
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
#   gen-uks-lwr-hs-asbestosdb-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-asbestosdb-PEP"
#       description                                = "AOA-asbestosdb-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-ASBETOSDB-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-ASBETOSDB-SECRET"
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
#   gen-uks-pre-hs-fls-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-FLS-PEP"
#       description                                = "AOA-FLS-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-FLS-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-FLS-ICA"
#       description                                = "AOT-FLS-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-FLS-SECRET"
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
#   gen-uks-lwr-hs-sqlinsights-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-SQLInsights-PEP"
#       description                                = "AOA-SQLInsights-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-SQLInsights-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-SQLInsights-ICA"
#       description                                = "AOT-SQLInsights-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-SQLInsights-SECRET"
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
#   gen-uks-lwr-hs-riskandam-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-riskandam-PEP"
#       description                                = "AOA-riskandam-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-RISKANDEM-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-riskandam-ICA"
#       description                                = "AOT-riskandam-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-RISKANDEM-SECRET"
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
#   gen-uks-lwr-hs-lzendpoints-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-LZENDPOINTS-PEP"
#       description                                = "AOA-LZENDPOINTS-PEP"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-LZENDPOINTS-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-WKLOAD-LOWER-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "430"
#       name                                       = "AOT-LZENDPOINTS-ICA"
#       description                                = "AOT-LZENDPOINTS-ICA"
#       protocol                                   = "TCP"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-WKLOAD-LOWER-LZENDPOINTS-SECRET"
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
#   gen-uks-lwr-hs-pep-nsg-01 = {
#     gen-uks-lwr-hs-pep-snet-01 = true
#   }
#   gen-uks-lwr-hs-replicate-nsg-01 = {
#     gen-uks-lwr-hs-replicate-snet-01 = true
#   }
#   gen-uks-lwr-hs-genwiki-nsg-01 = {
#     gen-uks-lwr-hs-genwiki-snet-01 = true
#   }
#   gen-uks-lwr-hs-asbestosdb-nsg-01 = {
#     gen-uks-lwr-hs-asbestosdb-snet-01 = true
#   }
#   gen-uks-pre-hs-fls-nsg-01 = {
#     gen-uks-pre-hs-fls-snet-01 = true
#   }
#   gen-uks-lwr-hs-sqlinsights-nsg-01 = {
#     gen-uks-lwr-hs-sqlinsights-snet-01 = true
#   }
#   gen-uks-lwr-hs-riskandam-nsg-01 = {
#     gen-uks-lwr-hs-riskandam-snet-01 = true
#   }
#   gen-uks-lwr-hs-lzendpoints-nsg-01 = {
#     gen-uks-lwr-hs-lzendpoints-snet-01 = true
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
diag_vnet_name01          = "gen-uks-lwr-hs-wkload-vnet-01"
diag_vnet_rg01            = "gen-uks-lwr-hs-wkload-vnet-rg-01"
diag_vnet_name02          = "gen-uks-tb-hs-wkload-vnet-01"
diag_vnet_rg02            = "gen-uks-tb-hs-wkload-vnet-rg-01"
