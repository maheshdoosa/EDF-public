environment = "staging"

#WVD key vault

wvdKvName   = "wvdinfrasecrets"
wvdKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-stg-ss-wvd-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Staging"
    }
  }
}

vnets = {
  eit-uks-stg-ss-wvd-vnet-01 = {
    enable        = true
    rg            = "eit-uks-stg-ss-wvd-vnet-rg-01"
    addressSpace  = "wvd-stg-vnet-address-range"
    dnsServerList = "wvd-stg-dns-ips"
    subnets = {
      eit-uks-stg-ss-wvd-int-snet-01 = {
        enable  = true
        address = "wvd-stg-int-subnet-address-range"
      }
      eit-uks-stg-ss-wvd-ext-snet-01 = {
        enable  = true
        address = "wvd-stg-ext-subnet-address-range"
      }

    }
  }
}

UDR = {
  eit-uks-stg-ss-wvd-int-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-uks-stg-ss-wvd-int-snet-d_On-Prem-Internet", "s_eit-uks-stg-ss-wvd-int-snet-d_eit-uks-alz-t2-mgmt-snet", "s_eit-uks-stg-ss-wvd-int-snet-d_eit-uks-alz-t1-snet", "s_eit-uks-stg-ss-wvd-int-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "eit-uks-stg-ss-wvd-vnet-01"
    RGName                = "eit-uks-stg-ss-wvd-vnet-rg-01"
    kv_secret_udrprefixes = "wvd-stg-int-udr-prefixes"
    kv_secret_nexthopIP   = "wvd-stg-int-udr-nexthop"
  },
  eit-uks-stg-ss-wvd-ext-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-uks-stg-ss-wvd-ext-snet-d_On-Prem-Internet", "s_eit-uks-stg-ss-wvd-ext-snet-d_eit-uks-alz-t2-mgmt-snet", "s_eit-uks-stg-ss-wvd-ext-snet-d_eit-uks-alz-t1-snet", "s_eit-uks-stg-ss-wvd-ext-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "eit-uks-stg-ss-wvd-vnet-01"
    RGName                = "eit-uks-stg-ss-wvd-vnet-rg-01"
    kv_secret_udrprefixes = "wvd-stg-ext-udr-prefixes"
    kv_secret_nexthopIP   = "wvd-stg-ext-udr-nexthop"
  }

}

UDR_Subnet_Mapping = {
  eit-uks-stg-ss-wvd-int-udr-01 = ["eit-uks-stg-ss-wvd-int-snet-01"]
  eit-uks-stg-ss-wvd-ext-udr-01 = ["eit-uks-stg-ss-wvd-ext-snet-01"]
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-stg-ss-wvd-vnet-01-eit-uks-alz-transit-vnet-01"
    peer2name = "eit-uks-alz-transit-vnet-01-eit-uks-stg-ss-wvd-vnet-01"
    vnet1name = "az-lz-test-transit-networking-hub"
    vnet1rg   = "az-lz-test-transit-networking"
    vnet2name = "eit-uks-stg-ss-wvd-vnet-01"
    vnet2rg   = "eit-uks-stg-ss-wvd-vnet-rg-01"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-stg-transit-SubscriptionId"
spokeSubscriptionId = "wvd-stg-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false
