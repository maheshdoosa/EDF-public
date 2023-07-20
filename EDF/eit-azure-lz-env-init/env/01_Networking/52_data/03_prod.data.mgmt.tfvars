environment = "Production"

#EamCI key vault
prjKvName   = "avmgenprdhsmdwsub01kv"
prjKvRgName = ".security"

rgs = {
  data-uks-prd-vnet-uat-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
  data-uks-prd-vnet-prd-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
  gen-prd-hs-mdw-allnsg-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
  gen-uat-hs-mdw-allnsg-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-prd-hs-mdw-vnet-uat-01 = {
    enable        = true
    rg            = "data-uks-prd-vnet-uat-rg-01"
    addressSpace  = "GEN-MDW-UAT-VNET-SECRET1" //key vault secret name as value
    dnsServerList = "hs-dns-ips"               //key vault secret name as value
    subnets = {
      gen-uks-prd-hs-mdw-snet-uat-mgt = {
        enable                    = true
        address                   = "data-prd-subnet-uat-mgt-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-uat-anl = {
        enable                    = true
        address                   = "data-prd-subnet-uat-anl-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-uat-org = {
        enable                    = true
        address                   = "data-prd-subnet-uat-org-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-uat-acq = {
        enable                    = true
        address                   = "data-prd-subnet-uat-acq-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-uat-del = {
        enable                    = true
        address                   = "data-prd-subnet-uat-del-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "data-prd-subnet-uat-bastion-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-prd-hs-mdw-snet-uat-pep = {
        enable                    = true
        address                   = "GEN-MDW-UAT-PEP-SNET-SECRET" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
    }
  }
  gen-uks-prd-hs-mdw-vnet-prd-01 = {
    enable        = true
    rg            = "data-uks-prd-vnet-prd-rg-01"
    addressSpace  = "GEN-MDW-PRD-VNET-SECRET1" //key vault secret name as value
    dnsServerList = "hs-dns-ips"               //key vault secret name as value
    subnets = {
      gen-uks-prd-hs-mdw-snet-prd-mgt = {
        enable                    = true
        address                   = "data-prd-subnet-prd-mgt-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-prd-anl = {
        enable                    = true
        address                   = "data-prd-subnet-prd-anl-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-prd-org = {
        enable                    = true
        address                   = "data-prd-subnet-prd-org-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-prd-acq = {
        enable                    = true
        address                   = "data-prd-subnet-prd-acq-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-mdw-snet-prd-del = {
        enable                    = true
        address                   = "data-prd-subnet-prd-del-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "data-prd-subnet-prd-bastion-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-prd-hs-mdw-snet-prd-pep = {
        enable                    = true
        address                   = "GEN-MDW-PRD-PEP-SNET-SECRET" //key vault secret name as value
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-uat-01"
    peer2name = "gen-uks-prd-hs-mdw-vnet-uat-01-eit-uks-alz-transit-vnet-01-gen"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-uat-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mdw-vnet-uat-01" //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01" //spoke network
  }
}

tenantId          = "tenantId"              //key vault secret name as value
hubSubscriptionId = "transitSubscriptionId" //key vault secret name as value
# spokeSubscriptionId = "subscriptionId"        //key vault secret name as value
spokeSubscriptionId = "prdsubscriptionId" //key vault secret name as value

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  data-uks-uat-mgt-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-uat-mgt-snet-d_On-Prem-Internet", "s_data-uks-uat-mgt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-uat-mgt-snet-d_eit-uks-alz-t1-snet", "s_data-uks-uat-mgt-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-uat-01"
    RGName                = "data-uks-prd-vnet-uat-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-uat-anl-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-uat-anl-snet-d_On-Prem-Internet", "s_data-uks-uat-anl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-uat-anl-snet-d_eit-uks-alz-t1-snet", "s_data-uks-uat-anl-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-uat-01"
    RGName                = "data-uks-prd-vnet-uat-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-uat-org-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-uat-org-snet-d_On-Prem-Internet", "s_data-uks-uat-org-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-uat-org-snet-d_eit-uks-alz-t1-snet", "s_data-uks-uat-org-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-uat-01"
    RGName                = "data-uks-prd-vnet-uat-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-uat-acq-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-uat-acq-snet-d_On-Prem-Internet", "s_data-uks-uat-acq-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-uat-acq-snet-d_eit-uks-alz-t1-snet", "s_data-uks-uat-acq-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-uat-01"
    RGName                = "data-uks-prd-vnet-uat-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-uat-del-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-uat-del-snet-d_On-Prem-Internet", "s_data-uks-uat-del-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-uat-del-snet-d_eit-uks-alz-t1-snet", "s_data-uks-uat-del-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-uat-01"
    RGName                = "data-uks-prd-vnet-uat-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-prd-mgt-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-prd-mgt-snet-d_On-Prem-Internet", "s_data-uks-prd-mgt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-prd-mgt-snet-d_eit-uks-alz-t1-snet", "s_data-uks-prd-mgt-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-prd-01"
    RGName                = "data-uks-prd-vnet-prd-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-prd-anl-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-prd-anl-snet-d_On-Prem-Internet", "s_data-uks-prd-anl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-prd-anl-snet-d_eit-uks-alz-t1-snet", "s_data-uks-prd-anl-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-prd-01"
    RGName                = "data-uks-prd-vnet-prd-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-prd-org-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-prd-org-snet-d_On-Prem-Internet", "s_data-uks-prd-org-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-prd-org-snet-d_eit-uks-alz-t1-snet", "s_data-uks-prd-org-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-prd-01"
    RGName                = "data-uks-prd-vnet-prd-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-prd-acq-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-prd-acq-snet-d_On-Prem-Internet", "s_data-uks-prd-acq-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-prd-acq-snet-d_eit-uks-alz-t1-snet", "s_data-uks-prd-acq-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-prd-01"
    RGName                = "data-uks-prd-vnet-prd-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-prd-del-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-prd-del-snet-d_On-Prem-Internet", "s_data-uks-prd-del-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-prd-del-snet-d_eit-uks-alz-t1-snet", "s_data-uks-prd-del-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-prd-01"
    RGName                = "data-uks-prd-vnet-prd-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-uat-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-uat-pep-snet-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-uat-01"
    RGName                = "data-uks-prd-vnet-uat-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
  data-uks-prd-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-prd-pep-snet-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-mdw-vnet-prd-01"
    RGName                = "data-uks-prd-vnet-prd-rg-01"
    kv_secret_udrprefixes = "data-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-prd-udr-nexthop"  //key vault secret name as value
  }
}
##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  data-uks-uat-mgt-udr-01 = ["gen-uks-prd-hs-mdw-snet-uat-mgt"]
  data-uks-uat-anl-udr-01 = ["gen-uks-prd-hs-mdw-snet-uat-anl"]
  data-uks-uat-org-udr-01 = ["gen-uks-prd-hs-mdw-snet-uat-org"]
  data-uks-uat-acq-udr-01 = ["gen-uks-prd-hs-mdw-snet-uat-acq"]
  data-uks-uat-del-udr-01 = ["gen-uks-prd-hs-mdw-snet-uat-del"]
  data-uks-prd-mgt-udr-01 = ["gen-uks-prd-hs-mdw-snet-prd-mgt"]
  data-uks-prd-anl-udr-01 = ["gen-uks-prd-hs-mdw-snet-prd-anl"]
  data-uks-prd-org-udr-01 = ["gen-uks-prd-hs-mdw-snet-prd-org"]
  data-uks-prd-acq-udr-01 = ["gen-uks-prd-hs-mdw-snet-prd-acq"]
  data-uks-prd-del-udr-01 = ["gen-uks-prd-hs-mdw-snet-prd-del"]
  data-uks-uat-pep-udr-01 = ["gen-uks-prd-hs-mdw-snet-uat-pep"]
  data-uks-prd-pep-udr-01 = ["gen-uks-prd-hs-mdw-snet-prd-pep"]
}

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
retention_policydays      = 90
category1                 = "VMProtectionAlerts"
category2                 = "AllMetrics"
diag_vnet_name01          = "gen-uks-prd-hs-mdw-vnet-uat-01"
diag_vnet_rg01            = "data-uks-prd-vnet-uat-rg-01"
diag_vnet_name02          = "gen-uks-prd-hs-mdw-vnet-prd-01"
diag_vnet_rg02            = "data-uks-prd-vnet-prd-rg-01"

################### NSG's #############
nsg = {
  gen-uks-prd-hs-mdw-acq-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-prd-hs-mdw-allnsg-rg-01"
  },
  gen-uks-prd-hs-mdw-anl-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-prd-hs-mdw-allnsg-rg-01"
  },
  gen-uks-prd-hs-mdw-del-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-prd-hs-mdw-allnsg-rg-01"
  },
  gen-uks-prd-hs-mdw-mgt-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-prd-hs-mdw-allnsg-rg-01"
  },
  gen-uks-prd-hs-mdw-org-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-prd-hs-mdw-allnsg-rg-01"
  },
  gen-uks-uat-hs-mdw-acq-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uat-hs-mdw-allnsg-rg-01"
  },
  gen-uks-uat-hs-mdw-anl-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uat-hs-mdw-allnsg-rg-01"
  },
  gen-uks-uat-hs-mdw-del-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uat-hs-mdw-allnsg-rg-01"
  },
  gen-uks-uat-hs-mdw-mgt-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uat-hs-mdw-allnsg-rg-01"
  },
  gen-uks-uat-hs-mdw-org-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uat-hs-mdw-allnsg-rg-01"
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
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1010"
      name                                       = "AIA-SECGOV-MID-PRD-ACQ_SNET"
      description                                = "Allow all traffic SNOW MID Svrs to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "SnowMid-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1011"
      name                                       = "AIA-SECGOV-TENABLE-PRD-ACQ_SNET"
      description                                = "Allow all traffic SECGOV TENABLE to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-TENABLE-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1012"
      name                                       = "AIA-SECGOV-PENTEST-PRD-ACQ_SNET"
      description                                = "Allow all traffic SECGOV PENTEST to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-PENABLE-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_PRD-MGT_SNET-PRD-ACQ_SNET"
      description                                = "Allow all traffic PRD Management SNET to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_PRD-ANL_SNET-PRD-ACQ_SNET"
      description                                = "Allow all traffic PRD Analyse SNET to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_PRD-ORG_SNET-PRD-ACQ_SNET"
      description                                = "Allow all traffic PRD Organise SNET to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_PRD-DEL_SNET-PRD-ACQ_SNET"
      description                                = "Allow all traffic PRD Deliver SNET to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1100"
      name                                       = "AIA_ADDS-IR"
      description                                = "AIA_ADDS-IR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1101"
      name                                       = "AIA_WAC-IR"
      description                                = "AIA_WAC-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1102"
      name                                       = "AIT-ADO-IR"
      description                                = "AIT-ADO-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1103"
      name                                       = "AIT-AFS-IR"
      description                                = "AIT-AFS-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1150"
      name                                       = "AIT_RDP-IR"
      description                                = "RDP access to PRD Integration Runtime(IR) server"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1204"
      name                                       = "AIT_PROD_TO_CTRL-M"
      description                                = "Prod Control-M subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "Prod-Control-M-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1300"
      name                                       = "AIT_https-SNET-ACQ_SNET"
      description                                = "https access from Support desktop to Acq subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1301"
      name                                       = "AIT_SQL-SNET-ACQ_SNET"
      description                                = "SQL access from Support desktop to Acq subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1302"
      name                                       = "AIT_SSH-SNET-ACQ_SNET"
      description                                = "SQL access from Support desktop to Acq subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_PRD-ACQ"
      description                                = "Deny Internet Any to PRD Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA_VNET-VNET_in_PRD-ACQ"
      description                                = "DIA_VNET-VNET_in_PRD-ACQ"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-acq_gen-uks-prd-hs-mdw-snet-prd-acq-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on PRD Acquire Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1010"
      name                                       = "AOT-PRD-ACQ_SNET-TENABLEAGENT"
      description                                = "PRD Acquire SNET to hs-mgmt-onprem-tenable-address-range"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "TENABLEAGENT-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_PRD-ACQ_SNET-PRD-MGT_SNET"
      description                                = "Allow all traffic PRD Acquire SNET to PRD Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_PRD-ACQ_SNET-PRD-ANL_SNET"
      description                                = "Allow all traffic PRD Acquire SNET to PRD Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_PRD-ACQ_SNET-PRD-ORG_SNET"
      description                                = "Allow all traffic PRD Acquire SNET to PRD Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_PRD-ACQ_SNET-PRD-DEL_SNET"
      description                                = "Allow all traffic PRD Acquire SNET to PRD Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1100"
      name                                       = "AOA_IR-ADDS"
      description                                = "AOA_IR-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ADDS-IR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      access                                     = "Allow"
      destination_application_security_group_ids = ""
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1101"
      name                                       = "AOT_IR-LOGA"
      description                                = "AOT_IR-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "LAW-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1102"
      name                                       = "AOT_IR-WSUS"
      description                                = "AOT_IR-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "WSUS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1103"
      name                                       = "AOT_IR-AzureAgent"
      description                                = "AOT_IR-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Azure-Agent-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1104"
      name                                       = "AOT_IR-AzureCloud"
      description                                = "AOT_IR-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1105"
      name                                       = "AOT_IR-KMS"
      description                                = "AOT_IR-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "KMS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1106"
      name                                       = "AOT_IR-AzureStorage"
      description                                = "AOT_IR-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1107"
      name                                       = "AOT-PRD-ACQ_SNET-LINUXUPDATES"
      description                                = "Allow LINUX updates from Internet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1108"
      name                                       = "AOU-PRD-ACQ_SNET-NTP"
      description                                = "Allow PRD Acquire NTP queries"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "Tier1FWIPs"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1204"
      name                                       = "AOT_IR-EVNS"
      description                                = "AOT_IR-EVNS"
      protocol                                   = "tcp"
      destination_port_range                     = "1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-EVNS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1206"
      name                                       = "AOT_IR-FLAIR"
      description                                = "Data integration from Integration Runtime server to Flair"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-FLAIR"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1208"
      name                                       = "AOT_IR-SSIDS"
      description                                = "Data integration from Integration Runtime server to SSIDS"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-SSIDS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1029"
      name                                       = "AOT_IR-TORSKF"
      description                                = "Data integration from Integration Runtime server to TORSKF"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-TORSKF"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1212"
      name                                       = "AOT_IR-WORKMGMT3"
      description                                = "Data integration from Integration Runtime server to WorkMgmt"
      protocol                                   = "tcp"
      destination_port_range                     = "1523"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-WORKMGMT3"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1216"
      name                                       = "AOT_IR_BWDAX022"
      description                                = "Data integration from Integration Runtime server to BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-BWDAX022"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1217"
      name                                       = "AOT_IR_BEXA01-PROD-SCAN"
      description                                = "Data integration from integration Runtime server to Prod Exadata"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-Internet-URLs"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1220"
      name                                       = "AOT_ACQ_SNET-Internet_URLs"
      description                                = "Data integration from Integration Runtime server to Internet URLs"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1221"
      name                                       = "AOT_IR_KELMAN"
      description                                = "Data integration from Integration Runtime server to Kelman"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-KELMAN"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1300"
      name                                       = "AOT-ACQ-BO-AFS"
      description                                = "Access to the Azure File Sync services which host folder shares"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEL-BO-AFS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1304"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-BPOPRD_SNET"
      description                                = "AOT_MDW_PRD_ACQ_SNET-BPOPRD_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BPOUAT-SNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1306"
      name                                       = "AOT-MDW_PRD_ACQ_SNET-BWDPRDFMS01"
      description                                = "AOT-MDW_PRD_ACQ_SNET-BWDPRDFMS01"
      protocol                                   = "tcp"
      destination_port_range                     = "135,139,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BWDUATFMS01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1307"
      name                                       = "AOT-MDW_PRD_ACQ_SNET-BWDAX022"
      description                                = "AOT-MDW_PRD_ACQ_SNET-BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BWDAX022"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1308"
      name                                       = "AOT-MDW_PRD_ACQ_SNET-BWDAX031"
      description                                = "AOT-MDW_PRD_ACQ_SNET-BWDAX031"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BWDAX031"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1350"
      name                                       = "AOT_ACQ_SNET-EAM_ST_DB"
      description                                = "AOT_ACQ_SNET-EAM_ST_DB"
      protocol                                   = "tcp"
      destination_port_range                     = "2484-2488"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-EAM-ST-DB"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1360"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-DGB_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-DGB_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-DGB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1361"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-TOR_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-TOR_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-TOR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1362"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-HUN_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-HUN_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HUN"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1363"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-HYA_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-HYA_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HYA"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1364"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-HYB_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-HYB_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HYB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1365"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-HPB_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-HPB_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HPB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1366"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-HAR_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-HAR_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HAR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1367"
      name                                       = "AOT_MDW_PRD_ACQ_SNET-SZB_Settlements"
      description                                = "AOT_MDW_PRD_ACQ_SNET-SZB_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-SZB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1998"
      name                                       = "AZUREAD"
      description                                = "Permit outbound traffic to Azure AD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureActiveDirectory"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1999"
      name                                       = "AZUREAD-DOMAIN-SERVICES"
      description                                = "AZUREAD-DOMAIN-SERVICES"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureActiveDirectoryDomainServices"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DIA-PRD-ACQ_INTERNET_out"
      description                                = "Deny PRD Acquire SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET-VNET_out_ACQ"
      description                                = "Deny_VNET-VNET_out_ACQ"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-anl-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-anl_gen-uks-prd-hs-mdw-snet-prd-anl-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-ANL_SNET"
      description                                = "Allow all traffic Acquire SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ORG_SNET-ANL_SNET"
      description                                = "Allow all traffic Organise SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_MGT_SNET-ANL_SNET"
      description                                = "Allow all traffic Management SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_DEL_SNET-ANL_SNET"
      description                                = "Allow all traffic Deliver SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1300"
      name                                       = "AIT_https-SNET-ANL_SNET"
      description                                = "https access from Support desktop to Anl subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1301"
      name                                       = "AIT_SQL-SNET-ANL_SNET"
      description                                = "SQL access from Support desktop to Anl subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1302"
      name                                       = "AIT_SSH-SNET-ANL_SNET"
      description                                = "SQL access from Support desktop to Anl subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1304"
      name                                       = "PRD_STRIIM_SQL_SNET_ANL_SNET"
      description                                = "PRD STRIMM Server to dev anaylse"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "MDW-PRD-STRIMM-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1305"
      name                                       = "ABA_SSH_HTTPS-SNET_ANL_SNET"
      description                                = "Azure Build Agent to ANL subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_PRD-ANL"
      description                                = "Deny Internet Any to PRD Analyse SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-in_ANL" // updated
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-anl_gen-uks-prd-hs-mdw-snet-prd-anl-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_ANL_SNET-ACQ_SNET"
      description                                = "Allow all traffic Analyse SNET to  Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_ANL_SNET-ORG_SNET"
      description                                = "Allow all traffic Analyse SNET to  Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_ANL_SNET-MGT_SNET"
      description                                = "Allow all traffic Analyse SNET to  Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_ANL_SNET-DEL_SNET"
      description                                = "Allow all traffic Analyse SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_PRD-ANL_INTERNET_out"
      description                                = "Deny PRD Analyse SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-out_ANL"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-del-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-del_gen-uks-prd-hs-mdw-snet-prd-del-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-DEL_SNET"
      description                                = "Allow all traffic Acquire SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ORG_SNET-DEL_SNET"
      description                                = "Allow all traffic Organise SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_ANL_SNET-DEL_SNET"
      description                                = "Allow all traffic Analyse SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_MGT_SNET-DEL_SNET"
      description                                = "Allow all traffic Management SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1100"
      name                                       = "AIA-ADDS-BO"
      description                                = "AIA-ADDS-BO"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1101"
      name                                       = "AIA-WAC-BO"
      description                                = "AIA-WAC-BO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1150"
      name                                       = "AIT_RDP-BO"
      description                                = "AIT_RDP-BO"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1200"
      name                                       = "AIA_User-BO_HTTPS"
      description                                = "Allow Business Objects https traffic from user desktops"
      protocol                                   = "*"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIA_User-BO_Tomcat"
      description                                = "Allow Business Objects Tomcat traffic from user desktops"
      protocol                                   = "*"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-DEL_SNET"
      description                                = "https access from Support desktop to Del subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-DEL_SNET"
      description                                = "SQL access from Support desktop to Del subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1252"
      name                                       = "AIT_SSH-SNET-DEL_SNET"
      description                                = "SSH access from Support desktop to Del subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA _SSH_HTTPS-SNET_DEL_SNET"
      description                                = "ABA _SSH_HTTPS-SNET_DEL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_PRD-DEL"
      description                                = "Deny Internet Any to PRD Deliver SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-in_DEL"
      description                                = "Deny_VNET_VNET-in_DEL"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-del_gen-uks-prd-hs-mdw-snet-prd-del-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_DEL_SNET-ACQ_SNET"
      description                                = "Allow all traffic Deliver SNET to Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_DEL_SNET-ORG_SNET"
      description                                = "Allow all traffic Deliver SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_DEL_SNET-ANL_SNET"
      description                                = "Allow all traffic Deliver SNET to Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_DEL_SNET-MGT_SNET"
      description                                = "Allow all traffic Deliver SNET to Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1100"
      name                                       = "AOA-BO-ADDS"
      description                                = "Default EIT rules for managing mode 1 server Business Objects server to Active Directory Domain Services"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ADDS-IR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1101"
      name                                       = "AOT-BO-LOGA"
      description                                = "Default EIT rules for managing mode 1 server Business Objects server to Log Analytics Workspace"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "LAW-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1102"
      name                                       = "AOT-BO-WSUS"
      description                                = "Business Objects server to Windows Update Service"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "WSUS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1103"
      name                                       = "AOT-BO-AzureAgent"
      description                                = "Business Objects server to Azure Agent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Azure-Agent-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1104"
      name                                       = "AOT-BO-AzureCloud"
      description                                = "Business Objects server to Azure Cloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1105"
      name                                       = "AOT-BO-KMS"
      description                                = "Business Objects server to key management Services"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "KMS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1106"
      name                                       = "AOT-BO-AzureStorage"
      description                                = "Business Objects server to Azure Storage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1150"
      name                                       = "AOT-BO-EPD-dcsdgblv"
      description                                = "AOT-BO-EPD-dcsdgblv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd1"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1151"
      name                                       = "AOT-BO-EPD-dcsharlv"
      description                                = "AOT-BO-EPD-dcsharlv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1152"
      name                                       = "AOT-BO-EPD-dcshnblv"
      description                                = "AOT-BO-EPD-dcshnblv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd3"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1153"
      name                                       = "AOT-BO-EPD-dcshpblv"
      description                                = "AOT-BO-EPD-dcshpblv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd4"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1161"
      name                                       = "AOT-BO-LIMs-Bexa01-prod-scan"
      description                                = "AOT-BO-LIMs-Bexa01-prod-scan"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-LIMs-Bexa01-prod-scan"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1162"
      name                                       = "AOT-BO-LIMs-unknown"
      description                                = "AOT-BO-LIMs-unknown"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-LIMs-UNK"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1164"
      name                                       = "AOT-BO-NuMAS-BWDPRDNMSS01"
      description                                = "AOT-BO-NuMAS-BWDPRDNMSS01"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-NuMAS-BWDPRDNMSS01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1166"
      name                                       = "AOT-BO-SHAREPOINT"
      description                                = "AOT-BO-SHAREPOINT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-GENIS-SharePoint-Prj-Data"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1170"
      name                                       = "AOT-BO-OnPremAD"
      description                                = "AOT-BO-OnPremAD"
      protocol                                   = "*"
      destination_port_range                     = "389,88"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-OnPremAD"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1171"
      name                                       = "AOT-MDWDEV_DEL_SNET-BWDAX022"
      description                                = "AOT-MDWDEV_DEL_SNET-BWDAX022"
      protocol                                   = "*"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEL-DEV-SNET-BWDAX022"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1200"
      name                                       = "AOT-DEL-BO-AFS"
      description                                = "DEL SNET Traffic to Azure File Services"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEL-BO-AFS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_PRD-DEL_INTERNET_out"
      description                                = "Deny PRD Deliver SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET_out_DEL"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-mgt-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-mgt_gen-uks-prd-hs-mdw-snet-prd-mgt-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-MGT_SNET"
      description                                = "Allow all traffic Acquire SNET to  Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ORG_SNET-MGT_SNET"
      description                                = "Allow all traffic Organise SNET to  Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_ANL_SNET-MGT_SNET"
      description                                = "Allow all traffic Analyse SNET to  Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_DEL_SNET-MGT_SNET"
      description                                = "Allow all traffic Deliver SNET to  Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-MGT_SNET"
      description                                = "https access from Support desktop to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-MGT_SNET"
      description                                = "SQL access from Support desktop to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1252"
      name                                       = "AIT_SSH-SNET-MGT_SNET"
      description                                = "SQL access from Support desktop to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA_SSH_HTTPS-SNET_MGT-SNET"
      description                                = "Azure Build Agent to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_PRD-MGT"
      description                                = "Deny Internet Any to PRD Mgmt SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-in_MGT"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-mgt_gen-uks-prd-hs-mdw-snet-prd-mgt-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_MGT_SNET-ACQ_SNET"
      description                                = "Allow all traffic Managment SNET to  Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_MGT_SNET-ORG_SNET"
      description                                = "Allow all traffic Managment SNET to  Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_MGT_SNET-ANL_SNET"
      description                                = "Allow all traffic Managment SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_MGT_SNET-DEL_SNET"
      description                                = "Allow all traffic Managment SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_PRD-MGT_INTERNET_out"
      description                                = "Deny PRD Mgmt SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-out_MG"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-hs-mdw-org-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-org_gen-uks-prd-hs-mdw-snet-prd-org-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-ORG_SNET"
      description                                = "Allow all traffic Acquire SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ANL_SNET-ORG_SNET"
      description                                = "Allow all traffic Analyse SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_MGT_SNET-ORG_SNET"
      description                                = "Allow all traffic Management SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_DEL_SNET-ORG_SNET"
      description                                = "Allow all traffic Deliver SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-ORG_SNET"
      description                                = "https access from support desktop to Org subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-ORG_SNET"
      description                                = "SQL access from Support desktop to Org subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1252"
      name                                       = "AIT_SSH-SNET-ORG_SNET"
      description                                = "SQL access from Support desktop to Org subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA_SSH_HTTPS-SNET_ORG_SNET"
      description                                = "Azure Build Agent to ORG subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_PRD-ORG"
      description                                = "Deny Internet Any to PRD Organise SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET_in_ORG"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-prd-hs-mdw-snet-prd-org_gen-uks-prd-hs-mdw-snet-prd-org-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_ORG_SNET-ACQ_SNET"
      description                                = "Allow all traffic Organise SNET to  Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_ORG_SNET-ANL_SNET"
      description                                = "Allow all traffic Organise SNET to  Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_ORG_SNET-MGT_SNET"
      description                                = "Allow all traffic Organise SNET to  Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_ORG_SNET-DEL_SNET"
      description                                = "Allow all traffic Organise SNET to  Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-ORG-SNET-SECRET2"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-PRD-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_PRD-ORG_INTERNET_out"
      description                                = "Deny PRD Organise SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET_out_ORG"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-uat-hs-mdw-acq-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-acq_gen-uks-uat-hs-mdw-snet-uat-acq-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on UAT Acquire Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1010"
      name                                       = "AIA-SECGOV-MID_UAT-ACQ_SNET"
      description                                = "Allow all traffic SNOW MID Svrs to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-MID-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1011"
      name                                       = "AIA-SECGOV-TENABLE_UAT-ACQ_SNET"
      description                                = "Allow all traffic SECGOV TENABLE to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-TENABLE-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1012"
      name                                       = "AIA-SECGOV-PENTEST_UAT-ACQ_SNET"
      description                                = "Allow all traffic SECGOV PENTEST to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-PENTEST-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_UAT-MGT_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic UAT Management SNET to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_UAT-ANL_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_UAT-ORG_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic UAT Organise SNET to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_UAT-DEL_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic UAT Deliver SNET to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1100"
      name                                       = "AIA_ADDS-IR"
      description                                = "AIA_ADDS-IR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1101"
      name                                       = "AIA_WAC-IR"
      description                                = "AIA_WAC-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1102"
      name                                       = "AIT-ADO-IR"
      description                                = "AIT-ADO-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1103"
      name                                       = "AIT-AFS-IR"
      description                                = "AIT-AFS-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1150"
      name                                       = "AIT_RDP-IR"
      description                                = "RDP access to UAT Integration Runtime(IR) server"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1204"
      name                                       = "AIT_PROD_TO_CTRL-M"
      description                                = "Prod Control-M subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "Prod-Control-M-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1300"
      name                                       = "AIT_https-SNET-ACQ_SNET"
      description                                = "https access from Support desktop to Acq subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1301"
      name                                       = "AIT_SQL-SNET-ACQ_SNET"
      description                                = "SQL access from Support desktop to Acq subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1302"
      name                                       = "AIT_SSH-SNET-ACQ_SNET"
      description                                = "SQL access from Support desktop to Acq subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_UAT-ACQ"
      description                                = "Deny Internet Any to UAT Acquire SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA_VNET-VNET_in_UAT-ACQ"
      description                                = "peered VNets"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-acq_gen-uks-uat-hs-mdw-snet-uat-acq-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on UAT Acquire Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1010"
      name                                       = "AOT_UAT-ACQ_SNET-TENABLEAGENT"
      description                                = "UAT Acquire SNET to hs-mgmt-onprem-tenable-address-range"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "TENABLEAGENT-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_UAT-ACQ_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_UAT-ACQ_SNET_UAT-ANL_SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_UAT-ACQ_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_UAT-ACQ_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1100"
      name                                       = "AOA_ADDS-IR"
      description                                = "Active Directory Domain Services"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ADDS-IR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1101"
      name                                       = "AOT_IR-LOGA"
      description                                = "Log Analytics Workspace"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "LAW-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1102"
      name                                       = "AOT_IR-WSUS"
      description                                = "AOT_IR-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "WSUS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1103"
      name                                       = "AOT_IR-AzureAgent"
      description                                = "AOT_IR-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Azure-Agent-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1104"
      name                                       = "AOT_IR-AzureCloud"
      description                                = "AOT_IR-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1105"
      name                                       = "AOT_IR-KMS"
      description                                = "AOT_IR-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "KMS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1106"
      name                                       = "AOT_IR-AzureStorage"
      description                                = "AOT_IR-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1107"
      name                                       = "AOT_UAT-ACQ_SNET-LINUXUPDATES"
      description                                = "Allow LINUX updates from Internet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1108"
      name                                       = "AOU_UAT-ACQ_SNET-NTP"
      description                                = "Allow UAT Acquire NTP queries"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "Tier1FWIPs"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1204"
      name                                       = "AOT_IR-EVNS"
      description                                = "Data integration from Integration Runtime server to E+2 and EVNS and Plant tours"
      protocol                                   = "tcp"
      destination_port_range                     = "1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-EVNS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1206"
      name                                       = "AOT_IR-FLAIR"
      description                                = "Data integration from Integration Runtime server to Flair"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-FLAIR"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1208"
      name                                       = "AOT_IR-SSIDS"
      description                                = "Data integration from Integration Runtime server to SSIDS"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-SSIDS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1209"
      name                                       = "AOT_IR-TORSKF"
      description                                = "Data integration from Integration Runtime server to TORSKF"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-TORSKF"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1212"
      name                                       = "AOT_IR-WORKMGMT3"
      description                                = "Data integration from Integration Runtime server to WorkMgmt"
      protocol                                   = "tcp"
      destination_port_range                     = "1523"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-WORKMGMT3"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1216"
      name                                       = "AOT_IR_BWDAX022"
      description                                = "Data integration from Integration Runtime server to BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-BWDAX022"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1217"
      name                                       = "AOT_IR_BEXA01-PROD-SCAN"
      description                                = "Data integration from integration Runtime server to Prod Exadata"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-Internet-URLs"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1220"
      name                                       = "AOT_ACQ_SNET-Internet_URLs"
      description                                = "Data integration from Integration Runtime server to Internet URLs"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1221"
      name                                       = "AOT_IR_KELMAN"
      description                                = "Data integration from Integration Runtime server to Kelman"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-IR-KELMAN"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1300"
      name                                       = "AOT-ACQ-BO-AFS"
      description                                = "Access to the Azure File Sync services which host folder shares"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEL-BO-AFS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1304"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-BPOUAT_SNET"
      description                                = "Access to BPO PRD SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BPOUAT-SNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1306"
      name                                       = "AOT-MDW_UAT_ACQ_SNET-BWDUATFMS01"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (Dev) to Kenda shared folder - 'bwdprdfms01/FMS/BEG'"
      protocol                                   = "tcp"
      destination_port_range                     = "135,139,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BWDUATFMS01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1307"
      name                                       = "AOT-MDW_UAT_ACQ_SNET-BWDAX022"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (Dev) to BWDAX022 Dev NG DataWarehouse"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BWDAX022"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1308"
      name                                       = "AOT-MDW_UAT_ACQ_SNET-BWDAX031"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (Dev) to BWDAX031 Prod NG DataWarehouse"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-BWDAX031"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1350"
      name                                       = "AOT_ACQ_SNET-EAM_ST_DB"
      description                                = "Permit outbound traffic to EAM ST database server"
      protocol                                   = "tcp"
      destination_port_range                     = "2484-2488"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ACQ-SNET-EAM-ST-DB"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1360"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-DGB_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Dungeness Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-DGB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1361"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-TOR_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Torness Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-TOR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1362"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-HUN_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Hunterston Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HUN"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1363"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-HYA_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Heysham A Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HYA"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1364"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-HYB_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Heysham B Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HYB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1365"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-HPB_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Hinkley Point B Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HPB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1366"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-HAR_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Hartlepool Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-HAR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1367"
      name                                       = "AOT_MDW_UAT_ACQ_SNET-SZB_Settlements"
      description                                = "EDF Azure Landing Zone Integration Runtime Server (UAT) to Sizewell B Settlement Meters"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-ACQ-SNET-SZB"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1998"
      name                                       = "AZURE-AD"
      description                                = "Permit outbound traffic to Azure AD"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureActiveDirectory"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1999"
      name                                       = "AZURE-AD-DOMAIN-SERVICES"
      description                                = "Permit outbound traffic to Azure AD Domain Services"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureActiveDirectoryDomainServices"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_UAT-ACQ_INTERNET_out"
      description                                = "Deny UAT Acquire SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET-VNET_out_ACQ"
      description                                = "Deny_VNET-VNET_out_ACQ"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-uat-hs-mdw-anl-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-del_gen-uks-uat-hs-mdw-snet-uat-del-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_UAT-MGT_SNET_UAT-ANL-SNET"
      description                                = "Allow all traffic UAT Management SNET to UAT Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_UAT-ORG_SNET_UAT-ANL-SNET"
      description                                = "Allow all traffic UAT Organise SNET to UAT Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_UAT-ACQ_SNET_UAT-ANL-SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_UAT-DEL_SNET_UAT-ANL-SNET"
      description                                = "Allow all traffic UAT Deliver SNET to UAT Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1300"
      name                                       = "AIT_https-SNET-ANL_SNET"
      description                                = "https access from Support desktop to Anl subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1301"
      name                                       = "AIT_SQL-SNET-ANL_SNET"
      description                                = "SQL access from Support desktop to Anl subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1302"
      name                                       = "AIT_SSH-SNET-ANL_SNET"
      description                                = "SQL access from Support desktop to Anl subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1304"
      name                                       = "PRD_STRIIM_SQL_SNET_ANL_SNET"
      description                                = "PRD STRIMM Server to UAT anaylse"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "MDW-PRD-STRIMM-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1305"
      name                                       = "ABA_SSH_HTTPS-SNET_UAT-ANL-SNET"
      description                                = "Azure Build Agent to UAT ANL subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_UAT-ANL"
      description                                = "Deny Internet Any to UAT Analyse SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-in_ANL"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-anl_gen-uks-uat-hs-mdw-snet-uat-anl-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_UAT-ANL_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_UAT-ANL_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_UAT-ANL_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_UAT-ANL_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_UAT-ANL_INTERNET_out"
      description                                = "Deny UAT Analyse SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-out_ANL"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-uat-hs-mdw-del-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-del_gen-uks-uat-hs-mdw-snet-uat-del-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_UAT-MGT_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic UAT Management SNET to UAT Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_UAT-ANL_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_UAT-ORG_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic UAT Organise SNET to UAT Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_UAT-ACQ_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1100"
      name                                       = "AIA-ADDS-BO"
      description                                = "AIA-ADDS-BO"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1101"
      name                                       = "AIA-WAC-BO"
      description                                = "AIA-WAC-BO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1150"
      name                                       = "AIT_RDP-BO"
      description                                = "RDP access to Business Objects (BO) server"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1200"
      name                                       = "AIA_User-BO_HTTPS"
      description                                = "Allow Business Objects https traffic from user desktops"
      protocol                                   = "*"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIA_User-BO_Tomcat"
      description                                = "Allow Business Objects Tomcat traffic from user desktops"
      protocol                                   = "*"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-DEL_SNET"
      description                                = "https access from Support desktop to Del subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-DEL_SNET"
      description                                = "SQL access from Support desktop to Del subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1252"
      name                                       = "AIT_SSH-SNET-DEL_SNET"
      description                                = "SSH access from Support desktop to Del subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA_SSH_HTTPS-SNET_DEL_SNET"
      description                                = "Azure Build Agent to DEL subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_UAT-DEL"
      description                                = "Deny Internet Any to UAT Deliver SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET_in_DEL"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-del_gen-uks-uat-hs-mdw-snet-uat-del-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_UAT-DEL_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic Deliver SNET to Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_UAT-DEL_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic Deliver SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_UAT-DEL_SNET_UAT-ANL_SNET"
      description                                = "Allow all traffic Deliver SNET to Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_UAT-DEL_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic Deliver SNET to Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1100"
      name                                       = "AOA-BO-ADDS"
      description                                = "Business Objects server to Active Directory Domain Services"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ADDS-IR"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1101"
      name                                       = "AOT-BO-LOGA"
      description                                = "Objects server to Log Analytics Workspace"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "LAW-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1102"
      name                                       = "AOT-BO-WSUS"
      description                                = "Business Objects server to Windows Update Service"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "WSUS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1103"
      name                                       = "AOT-BO-AzureAgent"
      description                                = "Business Objects server to Azure Agent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Azure-Agent-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1104"
      name                                       = "AOT-BO-AzureCloud"
      description                                = "Default EIT rules for managing mode 1 server Business Objects server to Azure Cloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1105"
      name                                       = "AOT-BO-KMS"
      description                                = "Business Objects server to key management Services"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "KMS-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1106"
      name                                       = "AOT-BO-AzureStorage"
      description                                = "Objects server to Azure Storage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1150"
      name                                       = "AOT-BO-EPD-dcsdgblv"
      description                                = "Oracle DB for each AGR Station - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd1"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1151"
      name                                       = "AOT-BO-EPD-dcsharlv"
      description                                = "Iividual Oracle DB for each AGR Station - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1152"
      name                                       = "AOT-BO-EPD-dcshnblv"
      description                                = "Dose Control(EPD) Individual Oracle DB for each AGR Station - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd3"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1153"
      name                                       = "AOT-BO-EPD-dcshpblv"
      description                                = "Dose Control(EPD) Individual Oracle DB for each AGR Station - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-OracleDB-AGR-Station-Prd4"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1161"
      name                                       = "AOT-BO-LIMs-Bexa01-prod-scan"
      description                                = "LIMS Oracle DB Connection - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-MDW-LIMs-Bexa01-prod-scan"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1162"
      name                                       = "AOT-BO-LIMs-unknown"
      description                                = "LIMS Oracle DB Connection - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-LIMs-UNK"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1164"
      name                                       = "AOT-BO-NuMAS-BWDPRDNMSS01"
      description                                = "NuMAS MSSQL DB Connection - Production"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-NuMAS-BWDPRDNMSS01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1166"
      name                                       = "AOT-BO-SHAREPOINT"
      description                                = "GENIS SharePoint Project Data ODATA Web Service"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-GENIS-SharePoint-Prj-Data"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1170"
      name                                       = "AOT-BO-OnPremAD"
      description                                = "Access to on premise AD services"
      protocol                                   = "*"
      destination_port_range                     = "389,88"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-OnPremAD"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1171"
      name                                       = "AOT-MDWDEV_DEL_SNET-BWDAX022"
      description                                = "Access to ON premise bwdax022"
      protocol                                   = "*"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEL-DEV-SNET-BWDAX022"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1200"
      name                                       = "AOT-DEL-BO-AFS"
      description                                = "DEL SNET Traffic to Azure File Services"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEL-BO-AFS"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_UAT-DEL_INTERNET_out"
      description                                = "Deny UAT Deliver SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET_out_DEL"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-uat-hs-mdw-mgt-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-mgt_gen-uks-uat-hs-mdw-snet-uat-mgt-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_UAT-ACQ_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic UAT Acquire SNET to UAT Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_UAT-ORG_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic UAT Organise SNET to UAT Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_UAT-ANL_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic UAT Analyse SNET to UAT Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_UAT-DEL_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic UAT Deliver SNET to UAT Managment SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-MGT_SNET"
      description                                = "https access from Support desktop to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-MGT_SNET"
      description                                = "SQL access from Support desktop to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1252"
      name                                       = "AIT_SSH-SNET-MGT_SNET"
      description                                = "SQL access from Support desktop to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA_SSH_HTTPS-SNET_UAT-MGT-SNET"
      description                                = "Azure Build Agent to MGT subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_UAT-MGT"
      description                                = "Deny Internet Any to UAT Mgmt SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-in_MGT"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-mgt_gen-uks-uat-hs-mdw-snet-uat-mgt-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_UAT-MGT_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic Managment SNET to Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_UAT-MGT_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic Managment SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_UAT-MGT_SNET_UAT-ANL_SNET"
      description                                = "Allow all traffic Managment SNET to Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_UAT-MGT_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic Managment SNET to Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_UAT-MGT_INTERNET_out"
      description                                = "Deny UAT Mgmt SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-out_MG"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-uat-hs-mdw-org-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-uat-hs-mdw-snet-uat-org_gen-uks-uat-hs-mdw-snet-uat-org-ANY_in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_UAT-ACQ_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic Acquire SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_UAT-ANL_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic Analyse SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_UAT-MGT_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic Management SNET to Organise SNETT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_UAT-DEL_SNET_UAT-ORG_SNET"
      description                                = "Allow all traffic Deliver SNET to Organise SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-ORG_SNET"
      description                                = "https access from support desktop to Org subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-ORG_SNET"
      description                                = "SQL access from Support desktop to Org subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1252"
      name                                       = "AIT_SSH-SNET-ORG_SNET"
      description                                = "SQL access from Support desktop to Org subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-ORG-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA_SSH_HTTPS-SNET_ORG_SNET"
      description                                = "Azure Build Agent to ORG subnet"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Azure-Build-Agent-Address-Range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4090"
      name                                       = "DIA-INTERNET in_UAT-ORG"
      description                                = "Deny Internet Any to UAT Organise SNET in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET_in_ORG"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-tst-hs-mdw-snet-tst-org_gen-uks-tst-hs-mdw-snet-tst-org-ANY_out"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Analyse Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_UAT-ORG_SNET_UAT-ACQ_SNET"
      description                                = "Allow all traffic Organise SNET to Acquire SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ACQ-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_UAT-ORG_SNET_UAT-ANL_SNET"
      description                                = "Allow all traffic Organise SNET to Analyse SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-ANL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_UAT-ORG_SNET_UAT-MGT_SNET"
      description                                = "Allow all traffic Organise SNET to Management SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-MGT-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_UAT-ORG_SNET_UAT-DEL_SNET"
      description                                = "Allow all traffic Organise SNET to Deliver SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-UAT-ORG-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-UAT-DEL-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4090"
      name                                       = "DOA_UAT-ORG_INTERNET_out"
      description                                = "Deny UAT Organise SNET to Internet out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET_out_ORG"
      description                                = "Deny all traffic from the Virtual Network (and peered VNets)"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
}
nsg_subnet_mapping = {
  gen-uks-prd-hs-mdw-anl-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-prd-anl = true
  }
  gen-uks-prd-hs-mdw-acq-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-prd-acq = true
  }
  gen-uks-prd-hs-mdw-del-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-prd-del = true
  }
  gen-uks-prd-hs-mdw-mgt-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-prd-mgt = true
  }
  gen-uks-prd-hs-mdw-org-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-prd-org = true
  }
  gen-uks-uat-hs-mdw-anl-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-uat-anl = true
  }
  gen-uks-uat-hs-mdw-acq-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-uat-acq = true
  }
  gen-uks-uat-hs-mdw-del-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-uat-del = true
  }
  gen-uks-uat-hs-mdw-mgt-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-uat-mgt = true
  }
  gen-uks-uat-hs-mdw-org-nsg-01 = {
    gen-uks-prd-hs-mdw-snet-uat-org = true
  }
}
