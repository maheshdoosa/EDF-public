environment = "High Secured Lower"

#gendiamondhs key vault
gendiamondhsKvName   = "emersonvmtest"
gendiamondhsKvRgName = ".security"

###########################################################################

rgs = {
  gen-uks-tb-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Lower"
    }
  },
  gen-uks-tb-hs-wkload-vnet-rg-02 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Lower"
    }
  }
}

vnets = {
  gen-uks-tb-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tb-hs-wkload-vnet-rg-01"
    addressSpace  = "gen-uks-lwr-hs-tbench-vnet-address-range" //key vault secret name as value
    dnsServerList = "gen-uks-lwr-hs-tbench-vnet-dns-ips"       //key vault secret name as value
    subnets = {
      gen-uks-tb-hs-lzendpoints-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-lzendpoints-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tb-hs-sqlinsights-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-sqlinsights-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tb-hs-assetguardian-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-assetguardian-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tb-hs-pep-snet-01 = {
        enable                    = true
        address                   = "gen-uks-lwr-hs-pep-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "bastion-lwr-hs-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
  gen-uks-tb-hs-wkload-vnet-02 = {
    enable        = true
    rg            = "gen-uks-tb-hs-wkload-vnet-rg-02"
    addressSpace  = "apex-dev-vnet-address-range"        //key vault secret name as value
    dnsServerList = "gen-uks-lwr-hs-tbench-vnet-dns-ips" //key vault secret name as value
    subnets = {
      gen-uks-tb-hs-lzendpoints-snet-02 = {
        enable                    = true
        address                   = "apex-dev-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
        service_endpoints         = ["Microsoft.Storage", "Microsoft.KeyVault"]
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "AzureBastionSubnet" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

########### UDR #######################
UDR = {
  gen-uks-tb-hs-assetguardian-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-assetguardian-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-lzep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  },
  gen-uks-tb-hs-sqlinsights-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-sqlinsights-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-lzep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  },
  gen-uks-tb-hs-lzendpoints-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-lzendpoints-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-lzep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  },
  gen-uks-tb-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tb-hs-pep-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-01"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-lzep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  },
  gen-uks-lwr-hs-lzendpoints-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-lwr-hs-lzendpoints-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-tb-hs-wkload-vnet-02"
    RGName                = "gen-uks-tb-hs-wkload-vnet-rg-02"
    kv_secret_udrprefixes = "gendiamondhs-lzep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"       //key vault secret name as value//
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-tb-hs-assetguardian-udr-01 = ["gen-uks-tb-hs-assetguardian-snet-01"]
  gen-uks-tb-hs-sqlinsights-udr-01   = ["gen-uks-tb-hs-sqlinsights-snet-01"]
  gen-uks-tb-hs-lzendpoints-udr-01   = ["gen-uks-tb-hs-lzendpoints-snet-01"]
  gen-uks-tb-hs-pep-udr-01           = ["gen-uks-tb-hs-pep-snet-01"]
  gen-uks-lwr-hs-lzendpoints-udr-01  = ["gen-uks-tb-hs-lzendpoints-snet-02"]
}
