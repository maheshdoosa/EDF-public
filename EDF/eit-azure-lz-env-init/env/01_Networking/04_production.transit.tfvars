# # #transit resource group
# #
environment                         = "Live"
transitKvName                       = "eitlztransitkv"
transitKvRgName                     = ".security"
lzTransitNetworkingRgName           = "eit-uks-alz-transit-vnet-rg"
lzTransitNetworkingResourceLocation = "uksouth"

rgs = {
  eit-uks-alz-transit-vnet-rg = {
    enable   = true
    location = "UK South"
    # tags = {
    #   environment = "High Secured Management"
    # }
  }
}


vnets = {
  eit-uks-alz-transit-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-transit-vnet-rg"
    addressSpace  = "transit-vnet-address-space"
    dnsServerList = "lz-ad-dc-ips" ###need to chgange
    subnets = {
      eit-alz-t2int-snet-01 = {
        enable                    = true
        address                   = "eit-alz-t2int-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-t2mgmt-snet-01 = {
        enable                    = true
        address                   = "eit-uks-t2mgmt-snet"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-t1mgmt-snet-01 = {
        enable                    = true
        address                   = "eit-alz-t1mgmt-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-t1ext-snet-01 = {
        enable                    = true
        address                   = "eit-alz-t1ext-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-t1hasync-snet-01 = {
        enable                    = true
        address                   = "eit-alz-t1hasync-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-t1int-snet-01 = {
        enable                    = true
        address                   = "eit-alz-t1int-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-protected-snet-01 = {
        enable                    = true
        address                   = "protected-snet"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      GatewaySubnet = {
        enable                    = true
        address                   = "GatewaySubnet"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-f5ext-snet-01 = {
        enable                    = true
        address                   = "eit-alz-f5ext-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-f5mgmt-snet-01 = {
        enable                    = true
        address                   = "eit-alz-f5mgmt-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-f5int-snet-01 = {
        enable                    = true
        address                   = "eit-alz-f5int-snet-01"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "AzureBastionSubnet"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
    }
  }
}


UDR = {
  eit-uks-alz-t2fw-int-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-t1int-snet-d_Internet", "s_eit-uks-t2int-snet_d_eit-uks-hssnat-f5a-snet", "s_eit-uks-t2int-snet_d_eit-uks-hssnat-f5b-snet", "s_eit-uks-t2int-snet_d_eit-uks-sssnat-f5a-snet", "s_eit-uks-t2int-snet_d_eit-uks-sssnat-f5b-snet", "s-eit-uks-tsint-snet_d_eit-uks-vm-f5"]
    NextHopTypes               = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "t2fw-int-udr-prefixes"
    kv_secret_nexthopIP        = "t2fw-int-udr-nexthop"
    disableBgpRoutePropagation = "false"
  },
  eit-uks-alz-f5-mgmt-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-f5mgmt-snet_d-eit-uks-alz-hs-secgovprd-vnet", "s_eit-uks-f5mgmt-snet_d_Internet-On_Prem"]
    NextHopTypes               = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "f5-mgmt-udr-prefixes"
    kv_secret_nexthopIP        = "f5-mgmt-udr-nexthop"
    disableBgpRoutePropagation = "false"
  },
  eit-uks-alz-f5-ext-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-f5ext-snet_d_eit-uks-f5mgmt-snet", "s_eit-uks-f5ext-snet_d_eit-uks-t1int-snet", "s_eit-uks-f5ext-snet_d_Internet-On_Prem"]
    NextHopTypes               = ["none", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "f5-ext-udr-prefixes"
    kv_secret_nexthopIP        = "f5-ext-udr-nexthop"
    disableBgpRoutePropagation = "false"
  },
  eit-uks-alz-t1fw-ext-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-t1ext-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1ext-snet-d_eit-uks-t1mgmt-snet"]
    NextHopTypes               = ["none", "none"]
    kv_secret_udrprefixes      = "t1fw-ext-udr-prefixes"
    kv_secret_nexthopIP        = "t1fw-ext-udr-nexthop"
    disableBgpRoutePropagation = "true"
  },
  eit-uks-alz-t1fw-hasync-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-t1hasync-snet-d_eit-uks-alz-vnets", "s_eit-uks-t1hasync-snet-d_eit-uks-protected-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-t1ext-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-t1mgmt-snet"]
    NextHopTypes               = ["none", "none", "none", "none", "none"]
    kv_secret_udrprefixes      = "t1fw-hasync-udr-prefixes"
    kv_secret_nexthopIP        = "t1fw-hasync-udr-nexthop"
    disableBgpRoutePropagation = "true"
  },
  eit-uks-alz-t1fw-int-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["hs_eit-uks-t1int-snet-d_gen-uks-tst-hs-ci-vnet", "s_eit-uks-t1int-snet-d-eit-uks-alz-ss-secgovnprd-vnet", "s_eit-uks-t1int-snet-d-eit-uks-alz-ss-secgovprd-vnet", "s_eit-uks-t1int-snet-d-eit-uks-t1mgmt-snet", "s_eit-uks-t1int-snet-d_cus-uks-prd-ss-mgmt-vnet", "s_eit-uks-t1int-snet-d_eit-uks-alz-hs-cenadt-vnet", "s_eit-uks-t1int-snet-d_eit-uks-prd-ss-wvd-vnet", "s_eit-uks-t1int-snet-d_eit-uks-tst-hs-device", "s_eit-uks-t1int-snet-d_eit-uks-tst-hs-managed-vnet-control-m", "s_eit-uks-t1int-snet-d_eit-uks-tst-ss-device", "s_eit-uks-t1int-snet-d_eit-uks-tst-ss-managed-vnet", "s_eit-uks-t1int-snet-d_eit-uks-tst-ss-managed-vnet-epona", "s_eit-uks-t1int-snet-d_eit-uks-tst-ss-wvd-vnet", "s_eit-uks-t1int-snet-d_gen-uks-dev-hs-managed-vnet", "s_eit-uks-t1int-snet-d_gen-uks-np-hs-mgmt-vnet", "s_eit-uks-t1int-snet-d_gen-uks-prd-hs-m365-vnet", "s_eit-uks-t1int-snet-d_gen-uks-prd-hs-managed-vnet", "s_eit-uks-t1int-snet-d_gen-uks-prd-hs-mgmt-vnet", "s_eit-uks-t1int-snet-d_gen-uks-tst-hs-ci-vnet", "s_eit-uks-t1int-snet-d_gen-uks-tst-hs-managed-vnet", "s_eit-uks-t1int-snet-d_gen-uks-tst-hs-wkload-vnet", "s_eit-uks-t1int-snet-d_gen-uks-uat-hs-apex-snet", "s_eit-uks-t1int-snet_d-eit-uks-alz-hs-secgovnprd-vnet", "s_eit-uks-t1int-snet_d-eit-uks-alz-hs-secgovprd-vnet", "s_eit-uks-t1int-snet_d-eit-uks-alz-ss-vnet", "s_eit-uks-t1int-snet_d-eit-uks-alz-vnets", "s_eit-uks-t1int-snet_d-eit-uks-f5ext-snet", "s_eit-uks-t1int-snet_d-eit-uks-protected-snet", "s_eit-uks-t1int-snet_d-eit-uks-t1ext-snet", "s_eit-uks-t1int-snet_d-eit-uks-t2mgmt-snet", "s_eit-uks-t1int-snet_d-gen-uks-dev-mdw-vnet", "s_eit-uks-t1int-snet_d-gen-uks-prd-hs-ci-vnet", "s_eit-uks-t1int-snet_d-gen-uks-prd-hs-wkload-vnet", "s_eit-uks-t1int-snet_d-gen-uks-prd-mdw-vnet", "s_eit-uks-t1int-snet_d-gen-uks-prd-ss-managed-vnet", "s_eit-uks-t1int-snet_d-gen-uks-tst-mdw-vnet", "s_eit-uks-t1int-snet_d-gen-uks-tst-ss-managed-vnet", "s_eit-uks-t1int-snet_d-gen-uks-uat-mdw-vnet", "s_eit-uks-t1int-snet_d-gen-uks-upr-hs-wkload-vnet", "s_eit-uks-t1int-snet_d-on-prem-server", "s_eit-uks-t1int-snet_d-syslog-server", "s_gatewaysubnet-d_cus-uks-prd-ss-vnet-gold"]
    NextHopTypes               = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "none", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "none", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "t1fw-int-udr-prefixes"
    kv_secret_nexthopIP        = "t1fw-int-udr-nexthop"
    disableBgpRoutePropagation = "true"
  },
  eit-uks-alz-t1fw-mgmt-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-t1mgmt-snet-d_eit-alz-hs-adds-snet-01", "s_eit-uks-t1mgmt-snet-d_eit-uks-alz-vnets", "s_eit-uks-t1mgmt-snet-d_eit-uks-t1ext-snet", "s_eit-uks-t1mgmt-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1mgmt-snet_d-bwdprdsiem1", "s_eit-uks-t1mgmt-snet_d-eit-uks-alz-hs-secgovprd-vnet"]
    NextHopTypes               = ["VirtualAppliance", "none", "none", "none", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "t1fw-mgmt-udr-prefixes"
    kv_secret_nexthopIP        = "t1fw-mgmt-udr-nexthop"
    disableBgpRoutePropagation = "false"
  },
  eit-uks-alz-t2fw-mgmt-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-t2mgmt-snet-d_eit-alz-hs-adds-snet-01", "s_eit-uks-t2mgmt-snet-d_eit-uks-alz-vnets", "s_eit-uks-t2mgmt-snet-d_eit-uks-t1-fw-int-lb", "s_eit-uks-t2mgmt-snet-d_eit-uks-t1-fwa-int", "s_eit-uks-t2mgmt-snet-d_eit-uks-t1-fwb-int", "s_eit-uks-t2mgmt-snet-d_eit-uks-t1-snet", "s_eit-uks-t2mgmt-snet-d_eit-uks-t2int-snet", "s_eit-uks-t2mgmt-snet-d_Internet", "s_eit-uks-t2mgmt-snet_d-eit-uks-alz-hs-secgovprd-vnet"]
    NextHopTypes               = ["VirtualAppliance", "none", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "none", "none", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "t2fw-mgmt-udr-prefixes"
    kv_secret_nexthopIP        = "t2fw-mgmt-udr-nexthop"
    disableBgpRoutePropagation = "false"
  },
  eit-uks-alz-transit-gateway-udr-01 = {
    enable   = true
    VNetName = "eit-uks-alz-transit-vnet-01"
    RGName   = "eit-uks-alz-transit-vnet-rg"
    RouteNames = ["hs_gatewaysubnet-d_gen-uks-dev-hs-kyndryl-vnet", "s_gatewaysubnet-d_cus-uks-prd-ss-mgmt-vnet", "s_gatewaysubnet-d_cus-uks-prd-ss-vnet-gold1", "s_gatewaysubnet-d_cus-uks-prd-ss-vnet-gold2", "s_gatewaysubnet-d_eit-uks-alz-f5-ext-snet", "s_gatewaysubnet-d_eit-uks-alz-hs-mgmt-vnet", "s_gatewaysubnet-d_eit-uks-alz-ss-mgmt-vnet", "s_gatewaysubnet-d_eit-uks-prd-ss-wvd-vnet", "s_gatewaysubnet-d_eit-uks-t1-fw-mgmt-snet",
      "s_gatewaysubnet-d_eit-uks-t1-fw-snet", "s_gatewaysubnet-d_eit-uks-t2-fw-mgmt-snet", "s_gatewaysubnet-d_eit-uks-t2-fw-snet", "s_gatewaysubnet-d_eit-uks-t2-fw-trend-snet", "s_gatewaysubnet-d_eit-uks-tst-ss-wvd-vnet", "s_gatewaysubnet-d_gen-uks-dev-hs-epona-vnet", "s_gatewaysubnet-d_gen-uks-dev-hs-epona2-vnet", "s_gatewaysubnet-d_gen-uks-dev-hs-event-log-collectors", "s_gatewaysubnet-d_gen-uks-dev-hs-managed-vnet", "s_gatewaysubnet-d_gen-uks-dev-mdw-vnet",
    "s_gatewaysubnet-d_gen-uks-np-hs-mgmt-vnet", "s_gatewaysubnet-d_gen-uks-prd-hs-ci-vnet", "s_gatewaysubnet-d_gen-uks-prd-hs-dmz-vnet", "s_gatewaysubnet-d_gen-uks-prd-hs-managed-vnet", "s_gatewaysubnet-d_gen-uks-prd-hs-mgmt-vnet", "s_gatewaysubnet-d_gen-uks-prd-hs-mgmt-vnet-02", "s_gatewaysubnet-d_gen-uks-prd-hs-wkload-vnet", "s_gatewaysubnet-d_gen-uks-prd-mdw-vnet", "s_gatewaysubnet-d_gen-uks-prd-ss-managed-vnet-01", "s_gatewaysubnet-d_gen-uks-tst-hs-ci-vnet", "s_gatewaysubnet-d_gen-uks-tst-hs-dmz-vnet", "s_gatewaysubnet-d_gen-uks-tst-hs-managed-vnet", "s_gatewaysubnet-d_gen-uks-tst-hs-wkload-vnet", "s_gatewaysubnet-d_gen-uks-tst-ss-managed-vnet-01", "s_gatewaysubnet-d_gen-uks-uat-hs-apex-snet", "s_gatewaysubnet-d_gen-uks-uat-mdw-vnet", "s_gatewaysubnet_d-eit-uks-alz-hs-secgovnprd-vnet", "s_gatewaysubnet_d-eit-uks-alz-hs-secgovprd-vnet", "s_gatewaysubnet_d-eit-uks-alz-ss-secgovnprd-vnet", "s_gatewaysubnet_d-eit-uks-alz-ss-secgovprd-vnet", "s_gatewaysubnet_d-gen-uks-tst-mdw-vnet"]
    NextHopTypes               = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VnetLocal", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VnetLocal", "VirtualAppliance", "VnetLocal", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "transit-gateway-udr-prefixes"
    kv_secret_nexthopIP        = "transit-gateway-udr-nexthop"
    disableBgpRoutePropagation = "false"
  },
  eit-uks-alz-f5-int-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-uks-f5int-snet_d-eit-uks-alz-hs-secgovprd-vnet", "s_eit-uks-f5int-snet_d_eit-uks-alz-hs-cenadt-vnet", "s_eit-uks-f5int-snet_d_eit-uks-f5mgmt-snet", "s_eit-uks-f5int-snet_d_eit-uks-hs-mgmt-vnet", "s_eit-uks-f5int-snet_d_eit-uks-ss-mgmt-vnet", "s_eit-uks-f5int-snet_d_gen-tst-hs-wkload-vnet"]
    NextHopTypes               = ["VirtualAppliance", "VirtualAppliance", "none", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "f5-int-udr-prefixes"
    kv_secret_nexthopIP        = "f5-int-udr-nexthop"
    disableBgpRoutePropagation = "true"
  },
  eit-uks-alz-transit-protected-udr-01 = {
    enable                     = true
    VNetName                   = "eit-uks-alz-transit-vnet-01"
    RGName                     = "eit-uks-alz-transit-vnet-rg"
    RouteNames                 = ["s_eit-alz-transit-protected-snet-d_s_eit-alz-hs-adds", "s_eit-alz-transit-protected-snet-d_s_eit-alz-hs-audit", "s_eit-alz-transit-protected-snet-d_s_eit-alz-hs-wac", "s_eit-alz-transit-protected-snet-d_s_eit-alz-hs-wsus", "s_eit-uks-protected-snet-d_eit-uks-t1-fw-lb", "s_eit-uks-protected-snet-d_eit-uks-t1-fwa-int", "s_eit-uks-protected-snet-d_eit-uks-t1-fwb-int", "Default-Route"]
    NextHopTypes               = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes      = "transit-protected-udr-prefixes"
    kv_secret_nexthopIP        = "transit-protected-udr-nexthop"
    disableBgpRoutePropagation = "true"
  }

}


##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  eit-uks-alz-t2fw-int-udr-01 = ["eit-alz-t2int-snet-01"]
  eit-uks-alz-f5-ext-udr-01   = ["eit-alz-f5ext-snet-01"]
  eit-uks-alz-f5-mgmt-udr-01  = ["eit-alz-f5mgmt-snet-01"]
  eit-uks-alz-t1fw-ext-udr-01 = ["eit-alz-t1ext-snet-01"]
  eit-uks-alz-t1fw-hasync-udr-01 = ["eit-alz-t1hasync-snet-01"]
  eit-uks-alz-t1fw-int-udr-01 = ["eit-alz-t1int-snet-01"]
  eit-uks-alz-t1fw-mgmt-udr-01 = ["eit-alz-t1mgmt-snet-01"]
  eit-uks-alz-t2fw-mgmt-udr-01 = ["eit-alz-t2mgmt-snet-01"]
  eit-uks-alz-transit-gateway-udr-01 = ["GatewaySubnet"]
  eit-uks-alz-f5-int-udr-01  = ["eit-alz-f5int-snet-01"]
  eit-uks-alz-transit-protected-udr-01  = ["eit-alz-protected-snet-01"]
}

lzTransitExpressrouteRgName = "eit-alz-alz-transit-expressroute-rg"

#####Old Code ###########


# environment = "Live"

# #transit resource group
# lzTransitNetworkingRgName = "eit-uks-alz-transit-vnet-rg"

# #transit key vault
# transitKvName   = "eitlztransitkv"
# transitKvRgName = ".security"

# #transit networking
# lzTransitVnetName                   = "eit-uks-alz-transit-vnet-01"
# lzTransitNetworkingResourceLocation = "uksouth"

# transitSubnets = [
#   {
#     subnetName = "eit-alz-t1ext-snet-01"
#     newBits    = 4
#     netNum     = 0
#   },
#   {
#     subnetName = "eit-alz-t1int-snet-01"
#     newBits    = 4
#     netNum     = 1
#   },
#   {
#     subnetName = "eit-alz-t1hasync-snet-01"
#     newBits    = 4
#     netNum     = 2
#   },
#   {
#     subnetName = "eit-alz-t1mgmt-snet-01"
#     newBits    = 4
#     netNum     = 3
#   },
#   {
#     subnetName = "eit-alz-t2int-snet-01"
#     newBits    = 4
#     netNum     = 4
#   },
#   {
#     subnetName = "eit-alz-t2mgmt-snet-01"
#     newBits    = 4
#     netNum     = 5
#   },
#   {
#     subnetName = "eit-alz-protected-snet-01"
#     newBits    = 4
#     netNum     = 6
#   },
#   {
#     subnetName = "GatewaySubnet"
#     newBits    = 5
#     netNum     = 31
#   },
#   {
#     subnetName = "eit-alz-f5ext-snet-01"
#     newBits    = 6
#     netNum     = 31
#   }
# ]

# #transit networking
# t1intfwTransitSubnetName    = "eit-alz-t1int-snet-01"
# t1extfwTransitSubnetName    = "eit-alz-t1ext-snet-01"
# t1mgmtfwTransitSubnetName   = "eit-alz-t1mgmt-snet-01"
# t2intfwTransitSubnetName    = "eit-alz-t2int-snet-01"
# t2mgmtfwTransitSubnetName   = "eit-alz-t2mgmt-snet-01"
# t1HaSyncfwTransitSubnetName = "eit-alz-t1hasync-snet-01"
# t1fwIlbIp                   = "t1fw-ilb-ip"
# t2fwIlbIp                   = "t2fw-ilb-ip"

# #t1fw-internal
# t1fwIntRouteTableName        = "eit-uks-alz-t1fw-int-udr-01"
# t1fwIntRouteNames            = ["s_eit-uks-t1int-snet-d-eit-uks-t1mgmt-snet", "s_eit-uks-t1int-snet_d-eit-uks-t1ext-snet", "s_eit-uks-t1int-snet_d-eit-uks-alz-vnets"]
# t1fwIntRoutesNextHopTypes    = ["None", "None", "VirtualAppliance"]
# t1fwIntRouteNextHopIpSecrets = ["", "", "t2fw-ilb-ip"]

# #t1fw-external
# t1fwExtRouteTableName        = "eit-uks-alz-t1fw-ext-udr-01"
# t1fwExtRouteNames            = ["s_eit-uks-t1ext-snet-d_eit-uks-t1mgmt-snet", "s_eit-uks-t1ext-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1ext-snet-d_eit-uks-alz-vnets"]
# t1fwExtRoutesNextHopTypes    = ["None", "None", "None"]
# t1fwExtRouteNextHopIpSecrets = ["", "", ""]

# #t1fw-management
# t1fwMgmtRouteTableName     = "eit-uks-alz-t1fw-mgmt-udr-01"
# t1fwMgmtRouteNames         = ["s_eit-uks-t1mgmt-snet-d_eit-uks-t1ext-snet", "s_eit-uks-t1mgmt-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1mgmt-snet-d_eit-uks-alz-vnets", "s_eit-uks-t1mgmt-snet-d_eit-FortiManager"]
# t1fwMgmtRoutesNextHopTypes = ["None", "None", "None", "VirtualNetworkGateway"]

# #t2fw-internal
# t2fwIntRouteTableName        = "eit-uks-alz-t2fw-int-udr-01"
# t2fwIntRouteNames            = ["s_eit-uks-t2int-snet-d_eit-uks-t2mgmt-snet", "s_eit-uks-t1int-snet-d_Internet"]
# t2fwIntRoutesNextHopTypes    = ["None", "VirtualAppliance"]
# t2fwIntRouteNextHopIpSecrets = ["", "t1fw-ilb-ip"]

# #t2fw-management
# t2fwMgmtRouteTableName        = "eit-uks-alz-t2fw-mgmt-udr-01"
# t2fwMgmtRouteNames            = ["s_eit-uks-t2mgmt-snet-d_eit-uks-t2int-snet", "s_eit-uks-t2mgmt-snet-d_eit-uks-alz-vnets", "s_eit-uks-t2mgmt-snet-d_Internet", "s_eit-uks-t2mgmt-snet-d_eit-panarama"]
# t2fwMgmtRoutesNextHopTypes    = ["None", "None", "VirtualAppliance", "VirtualNetworkGateway"]
# t2fwMgmtRouteNextHopIpSecrets = ["", "", "t1fw-ilb-ip", ""]

# #t1fw-hasync
# t1fwHaSyncRouteTableName     = "eit-uks-alz-t1fw-hasync-udr-01"
# t1fwHaSyncRouteNames         = ["s_eit-uks-t1hasync-snet-d_eit-uks-t1ext-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-alz-vnets", "s_eit-uks-t1hasync-snet-d_eit-uks-t1mgmt-snet"]
# t1fwHaSyncRoutesNextHopTypes = ["None", "None", "None", "None"]
