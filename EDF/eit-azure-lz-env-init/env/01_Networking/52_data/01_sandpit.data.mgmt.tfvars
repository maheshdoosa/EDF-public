environment = "Staging"

#EamCI key vault
prjKvName   = "datastrategystgkv"
prjKvRgName = ".security"

rgs = {
  data-uks-stg-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Staging"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-dev-hs-mdw-vnet-dev-01 = {
    enable        = true
    rg            = "data-uks-stg-vnet-rg-01"
    addressSpace  = "data-stg-vnet-dev-address-range" //key vault secret name as value
    dnsServerList = "data-stg-dns-ips"                //key vault secret name as value
    subnets = {
      gen-uks-dev-hs-mdw-snet-dev-mgt = {
        enable                    = true
        address                   = "data-stg-subnet-dev-mgt-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-anl = {
        enable                    = true
        address                   = "data-stg-subnet-dev-anl-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-org = {
        enable                    = true
        address                   = "data-stg-subnet-dev-org-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-acq = {
        enable                    = true
        address                   = "data-stg-subnet-dev-acq-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-del = {
        enable                    = true
        address                   = "data-stg-subnet-dev-del-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "data-stg-subnet-dev-bastion-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
    }
  }
}

####################### VNet-Peering #################################

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "hub-spoke"
    peer2name = "spoke-hub"
    vnet1rg   = "eit-uks-alz-hs-mgmt-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-hs-mgmt-vnet-01"    //hub network
    vnet2rg   = "data-uks-stg-vnet-rg-01"        //spoke network resource group
    vnet2name = "gen-uks-dev-hs-mdw-vnet-dev-01" //spoke network
  },
  peer-hub-spoke-01 = { //dummy one only - do not enable
    enable    = false
    peer1name = "hub-spoke"
    peer2name = "spoke-hub"
    vnet1rg   = "hub-spoke-test-tfmodule"
    vnet1name = "hub-vnet"
    vnet2rg   = "prj-uks-snd-vnet-rg-01"
    vnet2name = "prj-uks-snd-vnet-01"
  }
}

tenantId            = "tenantId"              //key vault secret name as value
hubSubscriptionId   = "transitSubscriptionId" //key vault secret name as value
spokeSubscriptionId = "subscriptionId"        //key vault secret name as value

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  data-uks-stg-mgt-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-stg-mgt-snet-d_On-Prem-Internet", "s_data-uks-stg-mgt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-stg-mgt-snet-d_eit-uks-alz-t1-snet", "s_data-uks-stg-mgt-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-stg-vnet-rg-01"
    kv_secret_udrprefixes = "data-stg-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-stg-udr-nexthop"  //key vault secret name as value
  }
  data-uks-stg-anl-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-stg-anl-snet-d_On-Prem-Internet", "s_data-uks-stg-anl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-stg-anl-snet-d_eit-uks-alz-t1-snet", "s_data-uks-stg-anl-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-stg-vnet-rg-01"
    kv_secret_udrprefixes = "data-stg-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-stg-udr-nexthop"  //key vault secret name as value
  }
  data-uks-stg-org-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-stg-org-snet-d_On-Prem-Internet", "s_data-uks-stg-org-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-stg-org-snet-d_eit-uks-alz-t1-snet", "s_data-uks-stg-org-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-stg-vnet-rg-01"
    kv_secret_udrprefixes = "data-stg-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-stg-udr-nexthop"  //key vault secret name as value
  }
  data-uks-stg-acq-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-stg-acq-snet-d_On-Prem-Internet", "s_data-uks-stg-acq-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-stg-acq-snet-d_eit-uks-alz-t1-snet", "s_data-uks-stg-acq-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-stg-vnet-rg-01"
    kv_secret_udrprefixes = "data-stg-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-stg-udr-nexthop"  //key vault secret name as value
  }
  data-uks-stg-del-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-stg-del-snet-d_On-Prem-Internet", "s_data-uks-stg-del-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-stg-del-snet-d_eit-uks-alz-t1-snet", "s_data-uks-stg-del-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-stg-vnet-rg-01"
    kv_secret_udrprefixes = "data-stg-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-stg-udr-nexthop"  //key vault secret name as value
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  data-uks-stg-mgt-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-mgt"]
  data-uks-stg-anl-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-anl"]
  data-uks-stg-org-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-org"]
  data-uks-stg-acq-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-acq"]
  data-uks-stg-del-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-del"]
}

nsg = {
  gen-uks-prd-hs-mdw-acq-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-stg-vnet-rg-01"
  },
  gen-uks-prd-hs-mdw-anl-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-stg-vnet-rg-01"
  },
  gen-uks-prd-hs-mdw-del-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-stg-vnet-rg-01"
  },
  gen-uks-prd-hs-mdw-mgt-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-stg-vnet-rg-01"
  },
  gen-uks-prd-hs-mdw-org-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-stg-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-prd-hs-mdw-acq-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-acq_gen-uks-prd-hs-mdw-snet-prd-acq-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on PRD Acquire Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-stg-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-anl-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIA_ORG_SNET-ANL_SNET"
      description                                = "Allow all traffic Organise SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-stg-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-del-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIA_ACQ_SNET-DEL_SNET"
      description                                = "Allow all traffic Acquire SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-stg-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-mgt-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIA_ACQ_SNET-MGT_SNET"
      description                                = "AIA_ACQ_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-stg-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-org-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_SQL-SNET-ORG_SNET"
      description                                = "AIT_SQL-SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
}
nsg_subnet_mapping = {
  gen-uks-prd-hs-mdw-anl-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-dev-anl = true
  }
  gen-uks-prd-hs-mdw-acq-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-dev-acq = true
  }
  gen-uks-prd-hs-mdw-del-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-dev-del = true
  }
  gen-uks-prd-hs-mdw-mgt-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-dev-mgt = true
  }
  gen-uks-prd-hs-mdw-org-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-dev-org = true
  }
}
