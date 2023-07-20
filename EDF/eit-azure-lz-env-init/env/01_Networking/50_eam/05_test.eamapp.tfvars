environment = "Test"

#EamApp key vault
eamAppKvName   = "avmgentsthswkloadsub01kv"
eamAppKvRgName = ".security"

rgs = {
  gen-uks-tst-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-tst-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-hs-wkload-vnet-rg-01"
    addressSpace  = "eam-tst-wkhs-vnet-address-range"
    dnsServerList = "hs-tst-dns-ips"
    subnets = {
      gen-uks-tst-hs-eam-dv-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tst-hs-eam-dv-snet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-eam-st-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tst-hs-eam-st-snet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-eam-shared-snet-01 = {
        enable                    = true
        address                   = "gen-uks-tst-hs-eam-shared-snet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-eam-dv-snet-02 = {
        enable                    = true
        address                   = "gen-uks-tst-hs-eam-dv-snet-02-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-eam-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-WKLOAD-TEST-PEP-SNET-SECRET"
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-hs-wkload-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    peer2name = "gen-uks-tst-hs-wkload-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-tst-hs-wkload-vnet-01"
    vnet2rg   = "gen-uks-tst-hs-wkload-vnet-rg-01"
  },
  peer-ci-spoke = {
    enable    = true
    peer1name = "gen-uks-tst-hs-ci-vnet-01-gen-uks-tst-hs-wkload-vnet-01"
    vnet1name = "gen-uks-tst-hs-ci-vnet-01"
    vnet1rg   = "gen-uks-tst-hs-ci-vnet-rg-01"
    peer2name = "gen-uks-tst-hs-wkload-vnet-01-gen-uks-tst-hs-ci-vnet-01"
    vnet2name = "gen-uks-tst-hs-wkload-vnet-01"
    vnet2rg   = "gen-uks-tst-hs-wkload-vnet-rg-01"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-prd-transit-SubscriptionId"
spokeSubscriptionId = "eam-tst-wkhs-SubscriptionId"
ciSubscriptionId    = "eam-tst-ci-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-tst-hs-eam-dv-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-eam-dv-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-f5int-snet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-f5snat-snet", "s_gen-uks-tst-hs-eam-dv-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-eam-dv-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-f5int-snet", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-tst-hs-eam-dv-snet-d_eit-uks-f5snat-snet", "s_gen-uks-tst-hs-eam-dv-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-wkload-vnet-01"
    RGName                = "gen-uks-tst-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-eam-st-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-eam-st-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-f5int-snet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-f5int1-snet", "s_gen-uks-tst-hs-eam-st-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-eam-st-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-f5int-snet", "s_gen-uks-tst-hs-eam-st-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-tst-hs-eam-st-snet-d_eit-uks-f5int1-snet", "s_gen-uks-tst-hs-eam-st-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-wkload-vnet-01"
    RGName                = "gen-uks-tst-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-eam-shared-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-eam-shared-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-f5int-snet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-f5int1-snet", "s_gen-uks-tst-hs-eam-shared-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-eam-shared-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-f5int-snet", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-tst-hs-eam-shared-snet-d_eit-uks-f5int1-snet", "s_gen-uks-tst-hs-eam-shared-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-wkload-vnet-01"
    RGName                = "gen-uks-tst-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-eam-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-eam-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-tst-hs-eam-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-wkload-vnet-01"
    RGName                = "gen-uks-tst-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-pep-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
}

##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-tst-hs-eam-dv-udr-01     = ["gen-uks-tst-hs-eam-dv-snet-01", "gen-uks-tst-hs-eam-dv-snet-02"]
  gen-uks-tst-hs-eam-st-udr-01     = ["gen-uks-tst-hs-eam-st-snet-01"]
  gen-uks-tst-hs-eam-shared-udr-01 = ["gen-uks-tst-hs-eam-shared-snet-01"]
  gen-uks-tst-hs-eam-pep-udr-01    = ["gen-uks-tst-hs-eam-pep-snet-01"]
}

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
retention_policydays      = 90
category1                 = "VMProtectionAlerts"
category2                 = "AllMetrics"
diag_vnet_name            = "gen-uks-tst-hs-wkload-vnet-01"
diag_vnet_rg              = "gen-uks-tst-hs-wkload-vnet-rg-01"
