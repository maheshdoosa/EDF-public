environment = "Live"

#EamApp key vault
eamAppKvName   = "eaminfrasecrets"
eamAppKvRgName = ".security"

rgs = {
  gen-uks-stg-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-stg-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-stg-hs-wkload-vnet-rg-01"
    addressSpace  = "eam-stg-wkhs-vnet-address-range"
    dnsServerList = "eam-stg-wkhs-dns-ips"
    subnets = {
      gen-uks-stg-hs-eam-shared-snet-01 = {
        enable                    = true
        address                   = "eam-stg-wkhs-sh-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-eam-cc-snet-01 = {
        enable                    = true
        address                   = "eam-stg-wkhs-cc-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-eam-md-snet-01 = {
        enable                    = true
        address                   = "eam-stg-wkhs-md-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-eam-tr-snet-01 = {
        enable                    = true
        address                   = "eam-stg-wkhs-tr-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-eam-ua-snet-01 = {
        enable                    = true
        address                   = "eam-stg-wkhs-ua-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-eam-pr-snet-01 = {
        enable                    = true
        address                   = "eam-stg-wkhs-pr-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-stg-hs-wkload-eam-shared-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-eam-shared-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-eam-shared-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-eam-shared-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-eam-shared-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-wkload-vnet-01"
    RGName                = "gen-uks-stg-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-wkhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-wkhs-udr-nexthop"
  }
  gen-uks-stg-hs-wkload-eam-cc-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-eam-cc-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-eam-cc-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-eam-cc-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-eam-cc-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-wkload-vnet-01"
    RGName                = "gen-uks-stg-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-wkhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-wkhs-udr-nexthop"
  }
  gen-uks-stg-hs-wkload-eam-md-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-eam-md-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-eam-md-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-eam-md-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-eam-md-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-wkload-vnet-01"
    RGName                = "gen-uks-stg-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-wkhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-wkhs-udr-nexthop"
  },
  gen-uks-stg-hs-wkload-eam-tr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-eam-tr-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-eam-tr-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-eam-tr-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-eam-tr-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-wkload-vnet-01"
    RGName                = "gen-uks-stg-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-wkhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-wkhs-udr-nexthop"
  }
  gen-uks-stg-hs-wkload-eam-ua-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-eam-ua-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-eam-ua-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-eam-ua-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-eam-ua-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-wkload-vnet-01"
    RGName                = "gen-uks-stg-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-wkhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-wkhs-udr-nexthop"
  }
  gen-uks-stg-hs-wkload-eam-pr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-eam-pr-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-eam-pr-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-eam-pr-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-eam-pr-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-wkload-vnet-01"
    RGName                = "gen-uks-stg-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-wkhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-wkhs-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-stg-hs-wkload-eam-shared-udr-01 = ["gen-uks-stg-hs-eam-shared-snet-01"]
  gen-uks-stg-hs-wkload-eam-cc-udr-01     = ["gen-uks-stg-hs-eam-cc-snet-01"]
  gen-uks-stg-hs-wkload-eam-md-udr-01     = ["gen-uks-stg-hs-eam-md-snet-01"]
  gen-uks-stg-hs-wkload-eam-tr-udr-01     = ["gen-uks-stg-hs-eam-tr-snet-01"]
  gen-uks-stg-hs-wkload-eam-ua-udr-01     = ["gen-uks-stg-hs-eam-ua-snet-01"]
  gen-uks-stg-hs-wkload-eam-pr-udr-01     = ["gen-uks-stg-hs-eam-pr-snet-01"]
}
