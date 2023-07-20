environment = "Test"

#EamCI key vault
eamCISsKvName   = "emersonvmtest"
eamCISsKvRgName = ".security"

rgs = {
  gen-uks-tst-ss-ci-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}


###################################### Looping through VNets #####################################
vnets = {
  gen-uks-tst-ss-ci-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-ss-ci-vnet-rg-01"
    addressSpace  = "eam-ciss-vnet-address-range"
    dnsServerList = "eamciss-dns-ips"
    subnets = {

      gen-uks-tst-ss-ci-law-snet-01 = {
        enable                    = true
        address                   = "eam-ci-law-subnet-address-range"
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-ss-ci-vnet-01"
    peer2name = "gen-uks-tst-ss-ci-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-tst-ss-ci-vnet-01"
    vnet2rg   = "gen-uks-tst-ss-ci-vnet-rg-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-transit-SubscriptionId"
spokeSubscriptionId = "eam-ci-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

# ########################### UDRs,Routes ###############################
# UDR = {
#   gen-uks-tst-hs-ci-ag-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-tst-hs-ci-ag-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ag-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-ag-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-ag-snet-d_eit-uks-alz-hs-mgmt-vnet"]
#     NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
#     VNetName              = "gen-uks-tst-hs-ci-vnet-01"
#     RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
#     kv_secret_udrprefixes = "eam-udr-prefixes"
#     kv_secret_nexthopIP   = "eam-udr-nexthop"
#   }
#   gen-uks-tst-hs-ci-jbox-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-tst-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-jbox-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-jbox-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-jbox-snet-d_eit-uks-alz-hs-mgmt-vnet"]
#     NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
#     VNetName              = "gen-uks-tst-hs-ci-vnet-01"
#     RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
#     kv_secret_udrprefixes = "eam-udr-prefixes"
#     kv_secret_nexthopIP   = "eam-udr-nexthop"
#   }
#   gen-uks-tst-hs-ci-ds-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-tst-hs-ci-ds-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ds-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-ds-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-ds-snet-d_eit-uks-alz-hs-mgmt-vnet"]
#     NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
#     VNetName              = "gen-uks-tst-hs-ci-vnet-01"
#     RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
#     kv_secret_udrprefixes = "eam-udr-prefixes"
#     kv_secret_nexthopIP   = "eam-udr-nexthop"
#   }
#   gen-uks-tst-hs-ci-pt-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_gen-uks-tst-hs-ci-pt-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-pt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-pt-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-pt-snet-d_eit-uks-alz-hs-mgmt-vnet"]
#     NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
#     VNetName              = "gen-uks-tst-hs-ci-vnet-01"
#     RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
#     kv_secret_udrprefixes = "eam-udr-prefixes"
#     kv_secret_nexthopIP   = "eam-udr-nexthop"
#   }
# }
# ##################### UDR association with Subnets #######################

# UDR_Subnet_Mapping = {
#   gen-uks-tst-hs-ci-ag-udr-01 = ["gen-uks-tst-hs-ci-ag-snet-01"]
#   gen-uks-tst-hs-ci-jbox-udr-01 = ["gen-uks-tst-hs-ci-jbox-snet-01"]
#   gen-uks-tst-hs-ci-ds-udr-01 = ["gen-uks-tst-hs-ci-ds-snet-01"]
#   gen-uks-tst-hs-ci-pt-udr-01 = ["gen-uks-tst-hs-ci-pt-snet-01"]
# }
