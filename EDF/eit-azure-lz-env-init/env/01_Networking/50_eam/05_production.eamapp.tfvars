environment = "Live"

#EamApp key vault
eamAppKvName   = "avmgenprdhswkloadsub01kv"
eamAppKvRgName = ".security"

rgs = {
  gen-uks-prd-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Live"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-prd-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-hs-wkload-vnet-rg-01"
    addressSpace  = "eam-prd-wkhs-vnet-address-range"
    dnsServerList = "hs-dns-ips" // Ip has been updated based on Private DNS Config
    # dnsServerList = "eam-prd-wkhs-dns-ips" // Ip has been updated based on Private DNS Config
    subnets = {
      gen-uks-prd-hs-eam-shared-snet-01 = {
        enable                    = true
        address                   = "eam-prd-wkhs-sh-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-eam-cc-snet-01 = {
        enable                    = true
        address                   = "eam-prd-wkhs-cc-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-eam-md-snet-01 = {
        enable                    = true
        address                   = "eam-prd-wkhs-md-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-eam-tr-snet-01 = {
        enable                    = true
        address                   = "eam-prd-wkhs-tr-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-eam-ua-snet-01 = {
        enable                    = true
        address                   = "eam-prd-wkhs-ua-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-eam-pr-snet-01 = {
        enable                    = true
        address                   = "eam-prd-wkhs-pr-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-eam-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-WKLOAD-PROD-PEP-SNET-SECRET"
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-wkload-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    peer2name = "gen-uks-prd-hs-wkload-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-prd-hs-wkload-vnet-01"
    vnet2rg   = "gen-uks-prd-hs-wkload-vnet-rg-01"
  },
  peer-ci-spoke = {
    enable    = true
    peer1name = "gen-uks-prd-hs-ci-vnet-01-gen-uks-prd-hs-wkload-vnet-01"
    vnet1name = "gen-uks-prd-hs-ci-vnet-01"
    vnet1rg   = "gen-uks-prd-hs-ci-vnet-rg-01"
    peer2name = "gen-uks-prd-hs-wkload-vnet-01-gen-uks-prd-hs-ci-vnet-01"
    vnet2name = "gen-uks-prd-hs-wkload-vnet-01"
    vnet2rg   = "gen-uks-prd-hs-wkload-vnet-rg-01"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-prd-transit-SubscriptionId"
spokeSubscriptionId = "eam-prd-wkhs-SubscriptionId"
ciSubscriptionId    = "eam-prd-ci-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-prd-hs-wkload-eam-shared-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-shared-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-shared-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-shared-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-shared-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-prd-hs-eam-shared-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-prd-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-cc-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-cc-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-cc-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-cc-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-cc-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-prd-hs-eam-cc-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-prd-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-md-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-md-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-md-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-md-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-md-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-prd-hs-eam-md-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-prd-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  },
  gen-uks-prd-hs-wkload-eam-tr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-tr-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-tr-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-tr-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-tr-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-prd-hs-eam-tr-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-prd-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-ua-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-ua-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-ua-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-ua-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-ua-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-prd-hs-eam-ua-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-prd-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-pr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-pr-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-pr-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-pr-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-pr-snet-d_eit-alz-t1int-snet-01", "s_gen-uks-prd-hs-eam-pr-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-prd-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  }
  gen-uks-prd-hs-eam-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-prd-hs-eam-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-pep-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-wkhs-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-prd-hs-wkload-eam-shared-udr-01 = ["gen-uks-prd-hs-eam-shared-snet-01"]
  gen-uks-prd-hs-wkload-eam-cc-udr-01     = ["gen-uks-prd-hs-eam-cc-snet-01"]
  gen-uks-prd-hs-wkload-eam-md-udr-01     = ["gen-uks-prd-hs-eam-md-snet-01"]
  gen-uks-prd-hs-wkload-eam-tr-udr-01     = ["gen-uks-prd-hs-eam-tr-snet-01"]
  gen-uks-prd-hs-wkload-eam-ua-udr-01     = ["gen-uks-prd-hs-eam-ua-snet-01"]
  gen-uks-prd-hs-wkload-eam-pr-udr-01     = ["gen-uks-prd-hs-eam-pr-snet-01"]
  gen-uks-prd-hs-eam-pep-udr-01           = ["gen-uks-prd-hs-eam-pep-snet-01"]
}

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
retention_policydays      = 90
category1                 = "VMProtectionAlerts"
category2                 = "AllMetrics"
diag_vnet_name            = "gen-uks-prd-hs-wkload-vnet-01"
diag_vnet_rg              = "gen-uks-prd-hs-wkload-vnet-rg-01"
