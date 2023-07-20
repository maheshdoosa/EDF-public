environment = "Production"

#WVD key vault

wvdKvName   = "avmeitprdsswvdsub01kv"
wvdKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-prd-ss-wvd-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  eit-uks-prd-ss-wvd-vnet-01 = {
    enable        = true
    rg            = "eit-uks-prd-ss-wvd-vnet-rg-01"
    addressSpace  = "wvd-prd-vnet-address-range"
    dnsServerList = "wvd-prd-dns-ips"
    subnets = {
      eit-uks-prd-ss-wvd-int-snet-01 = {
        enable  = true
        address = "wvd-prd-int-subnet-address-range"
      }
      eit-uks-prd-ss-wvd-ext-snet-01 = {
        enable  = true
        address = "wvd-prd-ext-subnet-address-range"
      }

    }
  }
}

UDR = {
  eit-uks-prd-ss-wvd-int-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-uks-prd-ss-wvd-int-snet-d_On-Prem-Internet", "s_eit-uks-prd-ss-wvd-int-snet-d_eit-uks-alz-t2-mgmt-snet", "s_eit-uks-prd-ss-wvd-int-snet-d_eit-uks-alz-t1-snet", "s_eit-uks-prd-ss-wvd-int-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_eit-uks-prd-ss-wvd-int-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "eit-uks-prd-ss-wvd-vnet-01"
    RGName                = "eit-uks-prd-ss-wvd-vnet-rg-01"
    kv_secret_udrprefixes = "wvd-prd-int-udr-prefixes"
    kv_secret_nexthopIP   = "wvd-prd-int-udr-nexthop"
  },
  eit-uks-prd-ss-wvd-ext-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-uks-prd-ss-wvd-ext-snet-d_On-Prem-Internet", "s_eit-uks-prd-ss-wvd-ext-snet-d_eit-uks-alz-t2-mgmt-snet", "s_eit-uks-prd-ss-wvd-ext-snet-d_eit-uks-alz-t1-snet", "s_eit-uks-prd-ss-wvd-ext-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_eit-uks-prd-ss-wvd-ext-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "eit-uks-prd-ss-wvd-vnet-01"
    RGName                = "eit-uks-prd-ss-wvd-vnet-rg-01"
    kv_secret_udrprefixes = "wvd-prd-ext-udr-prefixes"
    kv_secret_nexthopIP   = "wvd-prd-ext-udr-nexthop"
  }

}

UDR_Subnet_Mapping = {
  eit-uks-prd-ss-wvd-int-udr-01 = ["eit-uks-prd-ss-wvd-int-snet-01"]
  eit-uks-prd-ss-wvd-ext-udr-01 = ["eit-uks-prd-ss-wvd-ext-snet-01"]
}

############# VNET Peering #############

############# Here Transit is Hub and WVD Prod is spoke #################

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-prd-ss-wvd-vnet-01"
    peer2name = "eit-uks-prd-ss-wvd-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "eit-uks-prd-ss-wvd-vnet-01"
    vnet2rg   = "eit-uks-prd-ss-wvd-vnet-rg-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-prd-transit-SubscriptionId" // name reversed
spokeSubscriptionId = "wvd-prd-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false
