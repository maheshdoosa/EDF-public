environment = "Test"

#EamCI key vault
#eamCIKvName = "avmgentsthscisub01kv"
eamCIKvName   = "eitlzmanagementhsk"
eamCIKvRgName = ".security"

rgs = {
  gen-uks-prd-hs-ci-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
  gen-uks-prd-hs-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-prd-hs-ci-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-hs-ci-vnet-rg-01"
    addressSpace  = "eamhs-vnet-address-space"
    dnsServerList = "eamhs-ci-dns-ips"
    subnets = {
      gen-uks-prd-hs-ci-ag-snet-01 = {
        enable  = true
        address = "eamhs-ci-ag-snet-address"
      }
      gen-uks-prd-hs-ci-jbox-snet-01 = {
        enable  = true
        address = "eamhs-ci-jbox-snet-address"
      }
      gen-uks-prd-hs-ci-ds-snet-01 = {
        enable  = true
        address = "eamhs-ci-ds-snet-address"
      }
    }
  }
  gen-uks-prd-hs-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-hs-wkload-vnet-rg-01"
    addressSpace  = "eamWkload-vnet-address-space"
    dnsServerList = "eamWkload-dns-ips"
    subnets = {
      gen-uks-prd-hs-eam-shared-snet-01 = {
        enable  = true
        address = "eamWkload-shared-snet-address"
      }
      gen-uks-prd-hs-eam-cc-snet-01 = {
        enable  = true
        address = "eamWkload-cc-snet-address"
      }
      gen-uks-prd-hs-eam-md-snet-01 = {
        enable  = true
        address = "eamWkload-md-snet-address"
      }
      gen-uks-prd-hs-eam-tr-snet-01 = {
        enable  = true
        address = "eamWkload-tr-snet-address"
      }
      gen-uks-prd-hs-eam-ua-snet-01 = {
        enable  = true
        address = "eamWkload-ua-snet-address"
      }
      gen-uks-prd-hs-eam-pr-snet-01 = {
        enable  = true
        address = "eamWkload-pr-snet-address"
      }
    }
  }
}

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-prd-hs-ci-ag-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-ag-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-ag-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-ag-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-ag-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eamhs-udr-nexthop"
  }
  gen-uks-prd-hs-ci-jbox-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eamhs-udr-nexthop"
  }
  gen-uks-prd-hs-ci-ds-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-ds-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-ds-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-ds-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-ds-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eamhs-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-shared-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-shared-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-shared-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-shared-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-shared-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamWkload-udr-prefixes"
    kv_secret_nexthopIP   = "eamWkload-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-cc-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-cc-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-cc-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-cc-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-cc-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamWkload-udr-prefixes"
    kv_secret_nexthopIP   = "eamWkload-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-md-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-md-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-md-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-md-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-md-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamWkload-udr-prefixes"
    kv_secret_nexthopIP   = "eamWkload-udr-nexthop"
  },
  gen-uks-prd-hs-wkload-eam-tr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-tr-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-tr-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-tr-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-tr-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamWkload-udr-prefixes"
    kv_secret_nexthopIP   = "eamWkload-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-ua-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-ua-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-ua-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-ua-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-ua-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamWkload-udr-prefixes"
    kv_secret_nexthopIP   = "eamWkload-udr-nexthop"
  }
  gen-uks-prd-hs-wkload-eam-pr-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-eam-pr-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-eam-pr-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-eam-pr-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-eam-pr-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-wkload-vnet-01"
    RGName                = "gen-uks-prd-hs-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eamWkload-udr-prefixes"
    kv_secret_nexthopIP   = "eamWkload-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-prd-hs-ci-ag-udr-01             = ["gen-uks-prd-hs-ci-ag-snet-01"]
  gen-uks-prd-hs-ci-jbox-udr-01           = ["gen-uks-prd-hs-ci-jbox-snet-01"]
  gen-uks-prd-hs-ci-ds-udr-01             = ["gen-uks-prd-hs-ci-ds-snet-01"]
  gen-uks-prd-hs-wkload-eam-shared-udr-01 = ["gen-uks-prd-hs-eam-shared-snet-01"]
  gen-uks-prd-hs-wkload-eam-cc-udr-01     = ["gen-uks-prd-hs-eam-cc-snet-01"]
  gen-uks-prd-hs-wkload-eam-md-udr-01     = ["gen-uks-prd-hs-eam-md-snet-01"]
  gen-uks-prd-hs-wkload-eam-tr-udr-01     = ["gen-uks-prd-hs-eam-tr-snet-01"]
  gen-uks-prd-hs-wkload-eam-ua-udr-01     = ["gen-uks-prd-hs-eam-ua-snet-01"]
  gen-uks-prd-hs-wkload-eam-pr-udr-01     = ["gen-uks-prd-hs-eam-pr-snet-01"]
}
