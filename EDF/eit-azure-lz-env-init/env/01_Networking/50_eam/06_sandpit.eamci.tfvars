environment = "Test"

#EamCI key vault
eamCIKvName   = "eaminfrasecrets"
eamCIKvRgName = ".security"

rgs = {
  gen-uks-stg-hs-ci-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}


###################################### Looping through VNets #####################################
vnets = {
  gen-uks-stg-hs-ci-vnet-01 = {
    enable        = true
    rg            = "gen-uks-stg-hs-ci-vnet-rg-01"
    addressSpace  = "eam-stg-ci-vnet-address-range"
    dnsServerList = "eam-stg-ci-dns-ips"
    subnets = {
      gen-uks-stg-hs-ci-ag-snet-01 = {
        enable                    = true
        address                   = "eam-stg-ci-ag-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-ci-jbox-snet-01 = {
        enable                    = true
        address                   = "eam-stg-ci-jb-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-ci-ds-snet-01 = {
        enable                    = true
        address                   = "eam-stg-ci-ds-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

####################### VNet-Peering #################################

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-stg-hs-ci-vnet-01"
    peer2name = "gen-uks-stg-hs-ci-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-stg-hs-ci-vnet-01"
    vnet2rg   = "gen-uks-stg-hs-ci-vnet-rg-01"
    vnet1name = "az-lz-test-transit-networking-hub"
    vnet1rg   = "az-lz-test-transit-networking"
  }
}

tenantId            = "stagingTenantId"
hubSubscriptionId   = "sandpitSubscriptionId"
spokeSubscriptionId = "stagingSubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-stg-hs-ci-ag-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-ci-ag-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-ci-ag-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-ci-ag-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-ci-ag-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-ci-vnet-01"
    RGName                = "gen-uks-stg-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-ci-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-ci-udr-nexthop"
  }
  gen-uks-stg-hs-ci-jbox-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-ci-jbox-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-ci-jbox-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-ci-jbox-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-ci-vnet-01"
    RGName                = "gen-uks-stg-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-ci-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-ci-udr-nexthop"
  }
  gen-uks-stg-hs-ci-ds-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-ci-ds-snet-d_On-Prem-Internet", "s_gen-uks-stg-hs-ci-ds-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-stg-hs-ci-ds-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-stg-hs-ci-ds-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-stg-hs-ci-vnet-01"
    RGName                = "gen-uks-stg-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-stg-ci-udr-prefixes"
    kv_secret_nexthopIP   = "eam-stg-ci-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-stg-hs-ci-ag-udr-01   = ["gen-uks-stg-hs-ci-ag-snet-01"]
  gen-uks-stg-hs-ci-jbox-udr-01 = ["gen-uks-stg-hs-ci-jbox-snet-01"]
  gen-uks-stg-hs-ci-ds-udr-01   = ["gen-uks-stg-hs-ci-ds-snet-01"]
}
