environment = "Development"

#EamCI key vault
prjKvName   = "avmgendevhsmdwsub01kv"
prjKvRgName = ".security"

rgs = {
  data-uks-dev-vnet-dev-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Development"
    }
  }
  data-uks-dev-vnet-tst-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
  gen-dev-hs-mdw-allnsg-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Development"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-dev-hs-mdw-vnet-dev-01 = {
    enable        = true
    rg            = "data-uks-dev-vnet-dev-rg-01"
    addressSpace  = "GEN-MDW-DEV-VNET-SECRET1" //key vault secret name as value
    dnsServerList = "hs-tst-dns-ips"           //key vault secret name as value
    subnets = {
      gen-uks-dev-hs-mdw-snet-dev-mgt = {
        enable                    = true
        address                   = "data-dev-subnet-dev-mgt-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-anl = {
        enable                    = true
        address                   = "data-dev-subnet-dev-anl-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-org = {
        enable                    = true
        address                   = "data-dev-subnet-dev-org-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-acq = {
        enable                    = true
        address                   = "data-dev-subnet-dev-acq-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-dev-del = {
        enable                    = true
        address                   = "data-dev-subnet-dev-del-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "data-dev-subnet-dev-bastion-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-dev-hs-mdw-snet-dev-pep = {
        enable                    = true
        address                   = "GEN-MDW-DEV-PEP-SNET-SECRET" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
    }
  }
  gen-uks-dev-hs-mdw-vnet-tst-01 = {
    enable        = true
    rg            = "data-uks-dev-vnet-tst-rg-01"
    addressSpace  = "GEN-MDW-TST-VNET-SECRET1" //key vault secret name as value
    dnsServerList = "hs-tst-dns-ips"           //key vault secret name as value
    subnets = {
      gen-uks-dev-hs-mdw-snet-tst-mgt = {
        enable                    = true
        address                   = "data-dev-subnet-tst-mgt-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-tst-anl = {
        enable                    = true
        address                   = "data-dev-subnet-tst-anl-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-tst-org = {
        enable                    = true
        address                   = "data-dev-subnet-tst-org-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-tst-acq = {
        enable                    = true
        address                   = "data-dev-subnet-tst-acq-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-mdw-snet-tst-del = {
        enable                    = true
        address                   = "data-dev-subnet-tst-del-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "data-dev-subnet-tst-bastion-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-dev-hs-mdw-snet-tst-pep = {
        enable                    = true
        address                   = "GEN-MDW-TST-PEP-SNET-SECRET" //key vault secret name as value
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-dev-hs-mdw-vnet-dev-01"
    peer2name = "gen-uks-dev-hs-mdw-vnet-dev-01-eit-uks-alz-transit-vnet-01-gen"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-dev-vnet-dev-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-dev-hs-mdw-vnet-dev-01" //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-dev-hs-mdw-vnet-tst-01"
    peer2name = "gen-uks-dev-hs-mdw-vnet-tst-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-dev-vnet-tst-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-dev-hs-mdw-vnet-tst-01" //spoke network
  }
}

tenantId            = "tenantId"              //key vault secret name as value
hubSubscriptionId   = "transitSubscriptionId" //key vault secret name as value
spokeSubscriptionId = "tstsubscriptionId"     //key vault secret name as value

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  data-uks-dev-mgt-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-dev-mgt-snet-d_On-Prem-Internet", "s_data-uks-dev-mgt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-dev-mgt-snet-d_eit-uks-alz-t1-snet", "s_data-uks-dev-mgt-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-dev-vnet-dev-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-dev-anl-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-dev-anl-snet-d_On-Prem-Internet", "s_data-uks-dev-anl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-dev-anl-snet-d_eit-uks-alz-t1-snet", "s_data-uks-dev-anl-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-dev-vnet-dev-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-dev-org-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-dev-org-snet-d_On-Prem-Internet", "s_data-uks-dev-org-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-dev-org-snet-d_eit-uks-alz-t1-snet", "s_data-uks-dev-org-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-dev-vnet-dev-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-dev-acq-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-dev-acq-snet-d_On-Prem-Internet", "s_data-uks-dev-acq-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-dev-acq-snet-d_eit-uks-alz-t1-snet", "s_data-uks-dev-acq-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-dev-vnet-dev-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-dev-del-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-dev-del-snet-d_On-Prem-Internet", "s_data-uks-dev-del-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-dev-del-snet-d_eit-uks-alz-t1-snet", "s_data-uks-dev-del-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-dev-vnet-dev-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-tst-mgt-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-tst-mgt-snet-d_On-Prem-Internet", "s_data-uks-tst-mgt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-tst-mgt-snet-d_eit-uks-alz-t1-snet", "s_data-uks-tst-mgt-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-tst-01"
    RGName                = "data-uks-dev-vnet-tst-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-tst-anl-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-tst-anl-snet-d_On-Prem-Internet", "s_data-uks-tst-anl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-tst-anl-snet-d_eit-uks-alz-t1-snet", "s_data-uks-tst-anl-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-tst-01"
    RGName                = "data-uks-dev-vnet-tst-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-tst-org-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-tst-org-snet-d_On-Prem-Internet", "s_data-uks-tst-org-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-tst-org-snet-d_eit-uks-alz-t1-snet", "s_data-uks-tst-org-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-tst-01"
    RGName                = "data-uks-dev-vnet-tst-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-tst-acq-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-tst-acq-snet-d_On-Prem-Internet", "s_data-uks-tst-acq-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-tst-acq-snet-d_eit-uks-alz-t1-snet", "s_data-uks-tst-acq-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-tst-01"
    RGName                = "data-uks-dev-vnet-tst-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-tst-del-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-tst-del-snet-d_On-Prem-Internet", "s_data-uks-tst-del-snet-d_eit-uks-alz-t2-mgmt-snet", "s_data-uks-tst-del-snet-d_eit-uks-alz-t1-snet", "s_data-uks-tst-del-snet-d_eit-uks-alz-hs-mgmt-vnet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-tst-01"
    RGName                = "data-uks-dev-vnet-tst-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-dev-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-dev-pep-snet-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-dev-01"
    RGName                = "data-uks-dev-vnet-dev-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
  data-uks-tst-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_data-uks-tst-pep-snet-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-mdw-vnet-tst-01"
    RGName                = "data-uks-dev-vnet-tst-rg-01"
    kv_secret_udrprefixes = "data-dev-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "data-dev-udr-nexthop"  //key vault secret name as value
  }
}
##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  data-uks-dev-mgt-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-mgt"]
  data-uks-dev-anl-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-anl"]
  data-uks-dev-org-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-org"]
  data-uks-dev-acq-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-acq"]
  data-uks-dev-del-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-del"]
  data-uks-tst-mgt-udr-01 = ["gen-uks-dev-hs-mdw-snet-tst-mgt"]
  data-uks-tst-anl-udr-01 = ["gen-uks-dev-hs-mdw-snet-tst-anl"]
  data-uks-tst-org-udr-01 = ["gen-uks-dev-hs-mdw-snet-tst-org"]
  data-uks-tst-acq-udr-01 = ["gen-uks-dev-hs-mdw-snet-tst-acq"]
  data-uks-tst-del-udr-01 = ["gen-uks-dev-hs-mdw-snet-tst-del"]
  data-uks-dev-pep-udr-01 = ["gen-uks-dev-hs-mdw-snet-dev-pep"]
  data-uks-tst-pep-udr-01 = ["gen-uks-dev-hs-mdw-snet-tst-pep"]
}

nsg = {
  gen-uks-dev-hs-mdw-acq-nsg01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-dev-vnet-dev-rg-01"
  },
  gen-uks-dev-hs-mdw-mgt-nsg01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-dev-vnet-dev-rg-01"
  },
  gen-uks-dev-hs-mdw-anl-nsg01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-dev-vnet-dev-rg-01"
  },
  gen-uks-dev-hs-mdw-org-nsg01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-dev-vnet-dev-rg-01"
  },
  gen-uks-dev-hs-mdw-del-nsg01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-dev-vnet-dev-rg-01"
  },
  gen-uks-dev-hs-mdw-pep-nsg01 = {
    enable   = true
    location = "UK South"
    rg       = "data-uks-dev-vnet-dev-rg-01"
  },
  gen-uks-dev-hs-mdw-acq-nsg-01  = {
    enable   = true
    location = "UK South"
    rg       = "gen-dev-hs-mdw-allnsg-rg-01"
  },
  gen-uks-dev-hs-mdw-anl-nsg-01  = {
    enable   = true
    location = "UK South"
    rg       = "gen-dev-hs-mdw-allnsg-rg-01"
  },
  gen-uks-dev-hs-mdw-del-nsg-01  = {
    enable   = true
    location = "UK South"
    rg       = "gen-dev-hs-mdw-allnsg-rg-01"
  },
  gen-uks-dev-hs-mdw-mgt-nsg-01  = {
    enable   = true
    location = "UK South"
    rg       = "gen-dev-hs-mdw-allnsg-rg-01"
  },
  gen-uks-dev-hs-mdw-org-nsg-01  = {
    enable   = true
    location = "UK South"
    rg       = "gen-dev-hs-mdw-allnsg-rg-01"
  }
}

nsgrules = {
  gen-uks-dev-hs-mdw-acq-nsg01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MDW"
      description                                = "AIA-ADDS-MDW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-MDW"
      description                                = "AIT-WAC-MDW"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-MDW"
      description                                = "AIT-AFS-MDW"
      destination_port_range                     = "445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-HSADO-MDW"
      description                                = "AIT-HSADO-MDW"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-MDW"
      description                                = "AIA-SECGOV-HSMID-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-MDW"
      description                                = "AIA-SECGOV-HSTENABLE-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-MDW"
      description                                = "AIA-SECGOV-HSPENTEST-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
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
      priority                                   = "400"
      name                                       = "AOA-MDW-ADDS"
      description                                = "AOA-MDW-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-MDW-LOGA"
      description                                = "AOT-MDW-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "alz-hs-loga-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-MDW-WSUS"
      description                                = "AOT-MDW-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-MDW-TENABLEAGENT"
      description                                = "AOT-MDW-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-tenable-agent-onprmise"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "650"
      name                                       = "AOT-MDW-AFS"
      description                                = "AOT-MDW-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-MDW-AzureAgent"
      description                                = "AOT-MDW-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-MDW-AzureCloud"
      description                                = "AOT-MDW-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
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
      priority                                   = "3100"
      name                                       = "AOT-MIMDB-AzureKMS"
      description                                = "AOT-MIMDB-AzureKMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "kms-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-MIMDB-AzureStorage"
      description                                = "AOT-MIMDB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
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
      priority                                   = "4050"
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      description                                = "DOA-VNET-INTERNET"
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
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_MGT_SNET-ACQ_SNET"
      description                                = "AIA_MGT_SNET-ACQ_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_DEL_SNET-ACQ_SNET"
      description                                = "AIA_DEL_SNET-ACQ_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIA_ACQ_SNET-ACQ_SNET"
      description                                = "AIA_ACQ_SNET-ACQ_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AIT_RDP-IR"
      destination_port_range                     = "3389"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-onpriem-rdp-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ANL_SNET-ACQ_SNET"
      description                                = "AIA_ANL_SNET-ACQ_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ORG_SNET-ACQ_SNET"
      description                                = "AIA_ORG_SNET-ACQ_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIT_SQL-SNET-ACQ_SNET"
      description                                = "AIT_SQL-SNET-ACQ_SNET"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1202"
      name                                       = "AIT_SSH-SNET-ACQ_SNET"
      description                                = "AIT_SSH-SNET-ACQ_SNET"
      destination_port_range                     = "22"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1200"
      name                                       = "AIT_https-SNET-ACQ_SNET"
      description                                = "AIT_https-SNET-ACQ_SNET"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1203"
      name                                       = "ABA _SSH_HTTPS-SNET-ACQ-SNET"
      description                                = "ABA _SSH_HTTPS-SNET-ACQ-SNET"
      destination_port_range                     = "22,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-acq-snet-ado-key-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1204"
      name                                       = "AIT_NON-PROD_SANDPIT_TO_CTRL-M"
      description                                = "AIT_NON-PROD_SANDPIT_TO_CTRL-M"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-acq-snet-ctrl-m"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1210"
      name                                       = "AOT_IR-WORKMGMT1"
      description                                = "AOT_IR-WORKMGMT1"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-workmgmt1-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1214"
      name                                       = "AOT_IR-DB2UAT"
      description                                = "AOT_IR-DB2UAT"
      protocol                                   = "tcp"
      destination_port_range                     = "54001"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-d2buat-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_ACQ_SNET-ORG_SNET"
      description                                = "AOA_ACQ_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOT_IR-SSIDS"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-ssids-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT_mdw-snet-dev-acq-mdw-snet-dev-acq-ANY-out"
      description                                = "AIT_mdw-snet-dev-acq-mdw-snet-dev-acq-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_ACQ_SNET-ANL_SNET"
      description                                = "AOA_ACQ_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1207"
      name                                       = "AOT_IR-OVERTIME"
      description                                = "AOT_IR-OVERTIME"
      protocol                                   = "tcp"
      destination_port_range                     = "1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-overtime-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1206"
      name                                       = "AOT_IR-KNODB"
      description                                = "AOT_IR-KNODB"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-knodb-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-evns-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1211"
      name                                       = "AOT_IR-WORKMGMT2"
      description                                = "AOT_IR-WORKMGMT2"
      protocol                                   = "tcp"
      destination_port_range                     = "1523"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-workmgmt2-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_ACQ_SNET-MGT_SNET"
      description                                = "AOA_ACQ_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1215"
      name                                       = "AOT_IR-DB2PRD"
      description                                = "AOT_IR-DB2PRD"
      protocol                                   = "tcp"
      destination_port_range                     = "54001"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-db2-prd-key-01"
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
      description                                = "AOT_IR-WORKMGMT3"
      protocol                                   = "tcp"
      destination_port_range                     = "1523"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-workmgmt3-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1205"
      name                                       = "AOT_IR-FLAIR"
      description                                = "AOT_IR-FLAIR"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-flair-key-01"
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
      description                                = "AOT_IR-TORSKF"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-torskf-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1202"
      name                                       = "AOT_IR-AUTOTOUR2"
      description                                = "AOT_IR-AUTOTOUR2"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-autotour2-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1213"
      name                                       = "AOT_IR-DB2DEV"
      description                                = "AOT_IR-DB2DEV"
      protocol                                   = "tcp"
      destination_port_range                     = "54006"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-db2-dev-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_ACQ_SNET-DEL_SNET"
      description                                = "AOA_ACQ_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1203"
      name                                       = "AOT_IR-E2"
      description                                = "AOT_IR-E2"
      protocol                                   = "tcp"
      destination_port_range                     = "1522"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-e2-dev-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1201"
      name                                       = "AOT_IR-AUTOTOUR1"
      description                                = "AOT_IR-AUTOTOUR1"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-autotour1-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1200"
      name                                       = "AOT_IR-AER"
      description                                = "AOT_IR-AER"
      protocol                                   = "tcp"
      destination_port_range                     = "1522"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-aer-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-eam-stdb-key-01"
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
      description                                = "AOT_IR_BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdax022-key-01"
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
      description                                = "AOT_IR_BEXA01-PROD-SCAN"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mdw-dev-acq-snet-bexa01-prod-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1219"
      name                                       = "AOT_IR_Toolpouch_dev"
      description                                = "AOT_IR_Toolpouch_dev"
      protocol                                   = "tcp"
      destination_port_range                     = "1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-toolpouch-dev-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1218"
      name                                       = "AOT_IR_BEXA01-NONPROD-SCAN"
      description                                = "AOT_IR_BEXA01-NONPROD-SCAN"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mdw-dev-acq-snet-bexa01-nprod-keys-01"
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
      description                                = "AOT_ACQ_SNET-Internet_URLs"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1999"
      name                                       = "AZUREAD"
      description                                = "AZUREAD"
      protocol                                   = "*"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
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
      priority                                   = "1221"
      name                                       = "AOA_IR-SAPFIles"
      description                                = "AOA_IR-SAPFIles"
      protocol                                   = "*"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-sap-files-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1303"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-BPOPRD_SNET"
      description                                = "AOT_MDW_DEV_ACQ_SNET-BPOPRD_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bpo-prd-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1305"
      name                                       = "AOT-MDW_DEV_ACQ_SNET-BWDPRDFMS01"
      description                                = "AOT-MDW_DEV_ACQ_SNET-BWDPRDFMS01"
      protocol                                   = "tcp"
      destination_port_range                     = "445,135,139"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdprdfms-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1304"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-DGB_Settlements"
      description                                = "AOT_MDW_DEV_ACQ_SNET-DGB_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mdw-dev-acq-snet-dgb-settle-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1301"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-BPODEV_SNET"
      description                                = "AOT_MDW_DEV_ACQ_SNET-BPODEV_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bpodev-snet-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1302"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-BPOTST_SNET"
      description                                = "AOT_MDW_DEV_ACQ_SNET-BPOTST_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bpotst-snet-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1307"
      name                                       = "AOT-MDW_DEV_ACQ_SNET-BWDAX031"
      description                                = "AOT-MDW_DEV_ACQ_SNET-BWDAX031"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-sap-files-key-01"  // updated
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1306"
      name                                       = "AOT-MDW_DEV_ACQ_SNET-BWDAX022"
      description                                = "AOT-MDW_DEV_ACQ_SNET-BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdax022-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
	]
  gen-uks-dev-hs-mdw-mgt-nsg01 = [
	  {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MDW"
      description                                = "AIA-ADDS-MDW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-MDW"
      description                                = "AIT-WAC-MDW"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-MDW"
      description                                = "AIT-AFS-MDW"
      destination_port_range                     = "445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-HSADO-MDW"
      description                                = "AIT-HSADO-MDW"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-MDW"
      description                                = "AIA-SECGOV-HSMID-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-MDW"
      description                                = "AIA-SECGOV-HSTENABLE-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-MDW"
      description                                = "AIA-SECGOV-HSPENTEST-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
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
      priority                                   = "400"
      name                                       = "AOA-MDW-ADDS"
      description                                = "AOA-MDW-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-MDW-LOGA"
      description                                = "AOT-MDW-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "alz-hs-loga-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-MDW-WSUS"
      description                                = "AOT-MDW-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-MDW-TENABLEAGENT"
      description                                = "AOT-MDW-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-tenable-agent-onprmise"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "650"
      name                                       = "AOT-MDW-AFS"
      description                                = "AOT-MDW-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-MDW-AzureAgent"
      description                                = "AOT-MDW-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-MDW-AzureCloud"
      description                                = "AOT-MDW-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
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
      priority                                   = "3100"
      name                                       = "AOT-MIMDB-AzureKMS"
      description                                = "AOT-MIMDB-AzureKMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "kms-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-MIMDB-AzureStorage"
      description                                = "AOT-MIMDB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
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
      priority                                   = "4050"
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      description                                = "DOA-VNET-INTERNET"
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
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT-mdw-snet-dev-mgt-mdw-snet-dev-mgt-ANY-in"
      description                                = "AIT-mdw-snet-dev-mgt-mdw-snet-dev-mgt-ANY-in"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_DEL_SNET-MGT_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_ORG_SNET-MGT_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_ACQ_SNET-MGT_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_ANL_SNET-MGT_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-MGT_SNET"
      description                                = "AIT_SQL-SNET-MGT_SNET"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-MGT_SNET"
      description                                = "AIT_https-SNET-MGT_SNET"
      destination_port_range                     = "433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIT_SSH-SNET-MGT_SNET"
      destination_port_range                     = "22"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA _SSH_HTTPS-SNET_MGT-SNET"
      description                                = "ABA _SSH_HTTPS-SNET_MGT-SNET"
      destination_port_range                     = "22,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA_MGT_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AOA_MGT_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT-mdw-snet-dev-mgt-mdw-snet-dev-mgt-ANY-out"
      description                                = "AIT-mdw-snet-dev-mgt-mdw-snet-dev-mgt-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA_MGT_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_MGT_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
	]
  gen-uks-dev-hs-mdw-anl-nsg01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MDW"
      description                                = "AIA-ADDS-MDW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-MDW"
      description                                = "AIT-WAC-MDW"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-MDW"
      description                                = "AIT-AFS-MDW"
      destination_port_range                     = "445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-HSADO-MDW"
      description                                = "AIT-HSADO-MDW"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-MDW"
      description                                = "AIA-SECGOV-HSMID-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-MDW"
      description                                = "AIA-SECGOV-HSTENABLE-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-MDW"
      description                                = "AIA-SECGOV-HSPENTEST-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
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
      priority                                   = "400"
      name                                       = "AOA-MDW-ADDS"
      description                                = "AOA-MDW-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-MDW-LOGA"
      description                                = "AOT-MDW-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "alz-hs-loga-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-MDW-WSUS"
      description                                = "AOT-MDW-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-MDW-TENABLEAGENT"
      description                                = "AOT-MDW-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-tenable-agent-onprmise"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "650"
      name                                       = "AOT-MDW-AFS"
      description                                = "AOT-MDW-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-MDW-AzureAgent"
      description                                = "AOT-MDW-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-MDW-AzureCloud"
      description                                = "AOT-MDW-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
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
      priority                                   = "3100"
      name                                       = "AOT-MIMDB-AzureKMS"
      description                                = "AOT-MIMDB-AzureKMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "kms-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-MIMDB-AzureStorage"
      description                                = "AOT-MIMDB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
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
      priority                                   = "4050"
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      description                                = "DOA-VNET-INTERNET"
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
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ORG_SNET-ANL_SNET"
      description                                = "AIA_ORG_SNET-ANL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIA_DEL_SNET-ANL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIA_ACQ_SNET-ANL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT-mdw-snet-dev-anl-mdw-snet-dev-anl-ANY-in"
      description                                = "AIT-mdw-snet-dev-anl-mdw-snet-dev-anl-ANY-in"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIA_MGT_SNET-ANL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1301"
      name                                       = "AIT_SQL-SNET-ANL_SNET"
      description                                = "AIT_SQL-SNET-ANL_SNET"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIT_SSH-SNET-ANL_SNET"
      destination_port_range                     = "22"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1300"
      name                                       = "AIT_https-SNET-ANL_SNET"
      description                                = "AIT_https-SNET-ANL_SNET"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1306"
      name                                       = "BPO_DEV_SQL_ANL_SNET"
      description                                = "BPO_DEV_SQL_ANL_SNET"
      destination_port_range                     = "1443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "bpo-dev-sql-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "PRD_STRIIM_SQL_SNET_ANL_SNET"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "prd-striim-sql-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1303"
      name                                       = "TST_STRIIM_SQL_SNET_ANL_SNET"
      description                                = "TST_STRIIM_SQL_SNET_ANL_SNET"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "tst-striim-sql-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1305"
      name                                       = "ABA _SSH_HTTPS-SNET_ANL_SNET"
      description                                = "ABA _SSH_HTTPS-SNET_ANL_SNET"
      destination_port_range                     = "22,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_ANL_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AOA_ANL_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_ANL_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA_ANL_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AIT-mdw-snet-dev-anl-mdw-snet-dev-anl-ANY-out"
      description                                = "AIT-mdw-snet-dev-anl-mdw-snet-dev-anl-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
	]
  gen-uks-dev-hs-mdw-org-nsg01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MDW"
      description                                = "AIA-ADDS-MDW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-MDW"
      description                                = "AIT-WAC-MDW"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-MDW"
      description                                = "AIT-AFS-MDW"
      destination_port_range                     = "445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-HSADO-MDW"
      description                                = "AIT-HSADO-MDW"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-MDW"
      description                                = "AIA-SECGOV-HSMID-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-MDW"
      description                                = "AIA-SECGOV-HSTENABLE-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-MDW"
      description                                = "AIA-SECGOV-HSPENTEST-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
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
      priority                                   = "400"
      name                                       = "AOA-MDW-ADDS"
      description                                = "AOA-MDW-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-MDW-LOGA"
      description                                = "AOT-MDW-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "alz-hs-loga-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-MDW-WSUS"
      description                                = "AOT-MDW-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-MDW-TENABLEAGENT"
      description                                = "AOT-MDW-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-tenable-agent-onprmise"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "650"
      name                                       = "AOT-MDW-AFS"
      description                                = "AOT-MDW-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-MDW-AzureAgent"
      description                                = "AOT-MDW-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-MDW-AzureCloud"
      description                                = "AOT-MDW-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
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
      priority                                   = "3100"
      name                                       = "AOT-MIMDB-AzureKMS"
      description                                = "AOT-MIMDB-AzureKMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "kms-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-MIMDB-AzureStorage"
      description                                = "AOT-MIMDB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
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
      priority                                   = "4050"
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      description                                = "DOA-VNET-INTERNET"
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
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ANL_SNET-ORG_SNET"
      description                                = "AIA_ANL_SNET-ORG_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIA_DEL_SNET-ORG_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIA_MGT_SNET-ORG_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIA_ORD_SNET-ORG_SNET"
      description                                = "AIA_ORD_SNET-ORG_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIA_ACQ_SNET-ORG_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1251"
      name                                       = "AIT_SQL-SNET-ORG_SNET"
      description                                = "AIT_SQL-SNET-ORG_SNET"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIT_SSH-SNET-ORG_SNET"
      destination_port_range                     = "22"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1250"
      name                                       = "AIT_https-SNET-ORG_SNET"
      description                                = "AIT_https-SNET-ORG_SNET"
      destination_port_range                     = "433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1253"
      name                                       = "ABA _SSH_HTTPS-SNET_ORG_SNET"
      description                                = "ABA _SSH_HTTPS-SNET_ORG_SNET"
      destination_port_range                     = "22,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1203"
      name                                       = "AIT-BWDPRDCOGD01-MDWDEV-ORG-SNET"
      description                                = "AIT-BWDPRDCOGD01-MDWDEV-ORG-SNET"
      destination_port_range                     = "1443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "BWDPRDCOGD01-key-01" #\\ need to update secret
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIA-TSTBPO_MDWDEV-SNET-ORG-SNET"
      description                                = "AIA-TSTBPO_MDWDEV-SNET-ORG-SNET"
      destination_port_range                     = "1443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-bpotst-snet-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1202"
      name                                       = "AIT-BWDAX023_MDWDEV-ORG-SNET"
      description                                = "AIT-BWDAX023_MDWDEV-ORG-SNET"
      destination_port_range                     = "1443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "bwdax23-key-01" #//need to update secret
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1200"
      name                                       = "AIA-DEVBPO_MDWDEV-SNET-ORG-SNET"
      description                                = "AIA-DEVBPO_MDWDEV-SNET-ORG-SNET"
      destination_port_range                     = "1443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-bpodev-snet-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_ORG_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AOA_ORG_SNET-ORG_SNET"
      description                                = "AOA_ORG_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_ORG_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_ORG_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AOA_ORG_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
	]
  gen-uks-dev-hs-mdw-del-nsg01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MDW"
      description                                = "AIA-ADDS-MDW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-MDW"
      description                                = "AIT-WAC-MDW"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-MDW"
      description                                = "AIT-AFS-MDW"
      destination_port_range                     = "445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-HSADO-MDW"
      description                                = "AIT-HSADO-MDW"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-MDW"
      description                                = "AIA-SECGOV-HSMID-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-MDW"
      description                                = "AIA-SECGOV-HSTENABLE-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-MDW"
      description                                = "AIA-SECGOV-HSPENTEST-MDW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
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
      priority                                   = "400"
      name                                       = "AOA-MDW-ADDS"
      description                                = "AOA-MDW-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-MDW-LOGA"
      description                                = "AOT-MDW-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "alz-hs-loga-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-MDW-WSUS"
      description                                = "AOT-MDW-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-MDW-TENABLEAGENT"
      description                                = "AOT-MDW-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-tenable-agent-onprmise"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "650"
      name                                       = "AOT-MDW-AFS"
      description                                = "AOT-MDW-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-MDW-AzureAgent"
      description                                = "AOT-MDW-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-MDW-AzureCloud"
      description                                = "AOT-MDW-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
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
      priority                                   = "3100"
      name                                       = "AOT-MIMDB-AzureKMS"
      description                                = "AOT-MIMDB-AzureKMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "kms-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3200"
      name                                       = "AOT-MIMDB-AzureStorage"
      description                                = "AOT-MIMDB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
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
      priority                                   = "4050"
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      description                                = "DOA-VNET-INTERNET"
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
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_MGT_SNET-DEL_SNET"
      description                                = "AIA_MGT_SNET-DEL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_ORG_SNET-DEL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_ANL_SNET-DEL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_ANL_SNET-DEL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_mdw-snet-dev-del-mdw-snet-dev-del-ANY-in"
      description                                = "AIT_mdw-snet-dev-del-mdw-snet-dev-del-ANY-in"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_ACQ_SNET-DEL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIA_User-BO_Tomcat"
      description                                = "AIA_User-BO_Tomcat"
      destination_port_range                     = "8443"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "User-BO-Tomcat-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_User-BO_HTTPS"
      destination_port_range                     = "443"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "User-BO-Tomcat-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIT_SSH-SNET-DEL_SNET"
      destination_port_range                     = "22"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIT_https-SNET-DEL_SNET"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIT_SQL-SNET-DEL_SNET"
      destination_port_range                     = "1443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-desktop-acq-snet-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1150"
      name                                       = "AIT_RDP-BO"
      description                                = "AIT_RDP-BO"
      destination_port_range                     = "3389"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "User-BO-Tomcat-keys-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      destination_port_range                     = "22,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mdw-dev-acq-snet-ado-key-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_DEL_SNET-ACQ_SNET"
      description                                = "AOA_DEL_SNET-ACQ_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AOA_DEL_SNET-ORG_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_DEL_SNET-ANL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_DEL_SNET-MGT_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AOA_DEL_SNET-DEL_SNET"
      description                                = "AOA_DEL_SNET-DEL_SNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsharlv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1169"
      name                                       = "AOT-BO-EPD-dcstorlv"
      description                                = "AOT-BO-EPD-dcstorlv"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcstorlv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1165"
      name                                       = "AOT-BO-NuMAS-BWDUATNMSS01"
      description                                = "AOT-BO-NuMAS-BWDUATNMSS01"
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-NuMAS-BWDUATNMSS01-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1168"
      name                                       = "AOT-BO-EPD-dcshy2lv"
      description                                = "AOT-BO-EPD-dcshy2lv"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy2lv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1150"
      name                                       = "AOT-BO-EPD-dcsdgblv"
      description                                = "AOT-BO-EPD-dcsdgblv"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsdgblv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1158"
      name                                       = "AOT-BO-EPD-dcsharac"
      description                                = "AOT-BO-EPD-dcsharac"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsharac-key-01"
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
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-SHAREPOINT-key-01"
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
      destination_port_range                     = "1433"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-NuMAS-BWDPRDNMSS01-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1159"
      name                                       = "AOT-BO-EPD-dcshnbac"
      description                                = "AOT-BO-EPD-dcshnbac"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshnbac-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1157"
      name                                       = "AOT-BO-EPD-dcsdgbac"
      description                                = "AOT-BO-EPD-dcsdgbac"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsdgbac-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1162"
      name                                       = "AOT-BO-LIMs-unknown"
      description                                = "AOT-BO-LIMs-unknown"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-LIMs-unknown-key-01"
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
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshpblv-key-01"
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
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshnblv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1160"
      name                                       = "AOT-BO-EPD-dcshpbac"
      description                                = "AOT-BO-EPD-dcshpbac"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshpbac-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1167"
      name                                       = "AOT-BO-EPD-dcshy1lv"
      description                                = "AOT-BO-EPD-dcshy1lv"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy1lv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1163"
      name                                       = "AOT-BO-LIMs-Bexa01-nonprod-scan"
      description                                = "AOT-BO-LIMs-Bexa01-nonprod-scan"
      destination_port_range                     = "1521-1524 "
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-LIMs-Bexa01-nonprod-scan-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1161"
      name                                       = "AOT-BO-LIMs-Bexa01-prod-scan"
      description                                = "AOT-BO-LIMs-Bexa01-prod-scan"
      destination_port_range                     = "1521-1524 "
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-LIMs-Bexa01-prod-scan-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1154"
      name                                       = "AOT-BO-EPD-dcshy1lv-old"
      description                                = "AOT-BO-EPD-dcshy1lv-old"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy1lv-old-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1155"
      name                                       = "AOT-BO-EPD-dcshy2lv-old"
      description                                = "AOT-BO-EPD-dcshy2lv-old"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy2lv-old-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1156"
      name                                       = "AOT-BO-EPD-dcstorlv-old"
      description                                = "AOT-BO-EPD-dcstorlv-old"
      destination_port_range                     = "1521"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcstorlv-old-key-01"
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
      destination_port_range                     = "389,88"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-OnPremAD-keys-01"
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
      name                                       = "AOT-MDWDEV_DEL_SNET-BWDAX"
      description                                = "AOT-MDWDEV_DEL_SNET-BWDAX"
      destination_port_range                     = "1521-1524"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "MDWDEV-DEL-SNET-BWDAX022-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-dev-hs-mdw-pep-nsg01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-VNET-PEP"
      description                                = "AIA-VNET-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "GEN-MDW-DEV-VNET-SECRET1"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-PEP"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-PEP"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-PEP"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DIA-VNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DIA-INTERNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOA-PEP-TENABLEAGENT"
      description                                = "AOA-PEP-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-tenable-agent-onprmise"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-PEP-AZUREAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PEP-AZUREAGENT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-PEP-AZURECLOUD"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-TENABLE-AZURECLOUD"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-PEP-AzureStorage"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PEP-AzureStorage"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET-VNET"
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
      description                                = "DOA-VNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
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
      description                                = "DOA-VNET-INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-PEP-LOGA"
      description                                = "AOT-PEP-LOGA"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "alz-hs-loga-key-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIA-ADO-PEP"
      description                                = "AIA-ADO-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]  
  gen-uks-dev-hs-mdw-acq-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-acq-gen-uks-dev-hs-mdw-snet-dev-acq-ANY -in"
      description                                = "Permit ANY/ANY Intra-Subnet traffic on Acquire Subnet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ORG_SNET-ACQ_SNET"
      description                                = "AIA_ORG_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA_ANL_SNET-ACQ_SNET"
      description                                = "AIA_ANL_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1052"
      name                                       = "AIA_MGT_SNET-ACQ_SNET"
      description                                = "AIA_MGT_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1053"
      name                                       = "AIA_DEL_SNET-ACQ_SNET"
      description                                = "AIA_DEL_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AIT_RDP-IR"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1200"
      name                                       = "AIT_https-SNET-ACQ_SNET"
      description                                = "AIT_https-SNET-ACQ_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIT_SQL-SNET-ACQ_SNET"
      description                                = "AIT_SQL-SNET-ACQ_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1202"
      name                                       = "AIT_SSH-SNET-ACQ_SNET"
      description                                = "AIT_SSH-SNET-ACQ_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1203"
      name                                       = "ABA_SSH_HTTPS-SNET-ACQ-SNET"
      description                                = "ABA_SSH_HTTPS-SNET-ACQ-SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1204"
      name                                       = "AIT_NON-PROD_SANDPIT_TO_CTRL-M"
      description                                = "AIT_NON-PROD_SANDPIT_TO_CTRL-M"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "Non-prod-and-Sandpit"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET-VNET_in_ACQ"
      description                                = "Deny_VNET-VNET_in_ACQ"
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
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-acq-gen-uks-dev-hs-mdw-snet-dev-acq-ANY-out"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-acq-gen-uks-dev-hs-mdw-snet-dev-acq-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOA_ACQ_SNET-ORG_SNET"
      description                                = "AOA_ACQ_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1051"
      name                                       = "AOA_ACQ_SNET-ANL_SNET"
      description                                = "AOA_ACQ_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1052"
      name                                       = "AOA_ACQ_SNET-MGT_SNET"
      description                                = "AOA_ACQ_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1053"
      name                                       = "AOA_ACQ_SNET-DEL_SNET"
      description                                = "AOA_ACQ_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "AD-Subnets"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "IR-LOGA"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "IR-WSUS"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "IR-KMS"
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
      source_address_prefix                      = "IR-AzureStorage"
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
      priority                                   = "1200"
      name                                       = "AOT_IR-AER"
      description                                = "AOT_IR-AER"
      protocol                                   = "tcp"
      destination_port_range                     = "1522"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""  
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-aer-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1201"
      name                                       = "AOT_IR-AUTOTOUR1"
      description                                = "AOT_IR-AUTOTOUR1"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-autotour1-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1202"
      name                                       = "AOT_IR-AUTOTOUR2"
      description                                = "AOT_IR-AUTOTOUR2"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-autotour2-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1203"
      name                                       = "AOT_IR-E2"
      description                                = "AOT_IR-E2"
      protocol                                   = "tcp"
      destination_port_range                     = "1522"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-e2-dev-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-evns-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1205"
      name                                       = "AOT_IR-FLAIR"
      description                                = "AOT_IR-FLAIR"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-flair-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1206"
      name                                       = "AOT_IR-KNODB"
      description                                = "AOT_IR-KNODB"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-knodb-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1207"
      name                                       = "AOT_IR-OVERTIME"
      description                                = "AOT_IR-OVERTIME"
      protocol                                   = "tcp"
      destination_port_range                     = "1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-overtime-key-01"
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
      description                                = "AOT_IR-SSIDS"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-ssids-key-01"
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
      description                                = "AOT_IR-TORSKF"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-torskf-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1210"
      name                                       = "AOT_IR-WORKMGMT1"
      description                                = "AOT_IR-WORKMGMT1"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-workmgmt1-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1211"
      name                                       = "AOT_IR-WORKMGMT2"
      description                                = "AOT_IR-WORKMGMT2"
      protocol                                   = "tcp"
      destination_port_range                     = "1523"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-workmgmt1-key-01"
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
      description                                = "AOT_IR-WORKMGMT3"
      protocol                                   = "tcp"
      destination_port_range                     = "1523"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-workmgmt3-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1213"
      name                                       = "AOT_IR-DB2DEV"
      description                                = "AOT_IR-DB2DEV"
      protocol                                   = "tcp"
      destination_port_range                     = "54006"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-db2-dev-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1214"
      name                                       = "AOT_IR-DB2UAT"
      description                                = "AOT_IR-DB2UAT"
      protocol                                   = "tcp"
      destination_port_range                     = "54001"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-d2buat-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1215"
      name                                       = "AOT_IR-DB2PRD"
      description                                = "AOT_IR-DB2PRD"
      protocol                                   = "tcp"
      destination_port_range                     = "54001"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-db2-prd-key-01"
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
      description                                = "AOT_IR_BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdax022-key-01"
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
      description                                = "AOT_IR_BEXA01-PROD-SCAN"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mdw-dev-acq-snet-bexa01-prod-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1218"
      name                                       = "AOT_IR_BEXA01-NONPROD-SCAN"
      description                                = "AOT_IR_BEXA01-NONPROD-SCAN"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mdw-dev-acq-snet-bexa01-nprod-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1219"
      name                                       = "AOT_IR_Toolpouch_dev"
      description                                = "AOT_IR_Toolpouch_dev"
      protocol                                   = "tcp"
      destination_port_range                     = "1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-ir-toolpouch-dev-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1220"
      name                                       = "AOT_ACQ_SNET-Internet_URLs"
      description                                = "AOT_ACQ_SNET-Internet_URLs"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
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
      name                                       = "AOA_IR-SAPFIles"
      description                                = "AOA_IR-SAPFIles"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-sap-files-key-01"
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
      description                                = "AOT-ACQ-BO-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1301"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-BPODEV_SNET"
      description                                = "AOT_MDW_DEV_ACQ_SNET-BPODEV_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BPODEV-SNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1302"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-BPOTST_SNET"
      description                                = "AOT_MDW_DEV_ACQ_SNET-BPOTST_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BPOTST-SNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1303"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-BPOPRD_SNET"
      description                                = "AOT_MDW_DEV_ACQ_SNET-BPOPRD_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BPOPRD-SNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1304"
      name                                       = "AOT_MDW_DEV_ACQ_SNET-DGB_Settlements"
      description                                = "AOT_MDW_DEV_ACQ_SNET-DGB_Settlements"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "DGB-Settlements"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1305"
      name                                       = "AOT-MDW_DEV_ACQ_SNET-BWDPRDFMS01"
      description                                = "AOT-MDW_DEV_ACQ_SNET-BWDPRDFMS01"
      protocol                                   = "tcp"
      destination_port_range                     = "135,139,445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdprdfms-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1306"
      name                                       = "AOT-MDW_DEV_ACQ_SNET-BWDAX022"
      description                                = "AOT-MDW_DEV_ACQ_SNET-BWDAX022"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdax022-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1307"
      name                                       = "AOT-MDW_DEV_ACQ_SNET-BWDAX031"
      description                                = "AOT-MDW_DEV_ACQ_SNET-BWDAX031"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdax031-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-eam-stdb-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1999"
      name                                       = "AZUREAD"
      description                                = "AZUREAD"
      protocol                                   = "*"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
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
  gen-uks-dev-hs-mdw-anl-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-anl-gen-uks-dev-hs-mdw-snet-dev-anl-ANY-in"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-anl-gen-uks-dev-hs-mdw-snet-dev-anl-ANY-in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix","destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-ANL_SNET"
      description                                = "AIA_ACQ_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIA_ORG_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIA_MGT_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIA_DEL_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AIT_https-SNET-ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-ANL-SNET-SECRET2"
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
      description                                = "AIT_SQL-SNET-ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-ANL-SNET-SECRET2"
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
      description                                = "AIT_SSH-SNET-ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MDW-DEV-ANL-SNET-SECRET2"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1303"
      name                                       = "TST_STRIIM_SQL_SNET_ANL_SNET"
      description                                = "TST_STRIIM_SQL_SNET_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "TST-STRIIM-SQL-SNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1304"
      name                                       = "PRD_STRIIM_SQL_SNET_ANL_SNET"
      description                                = "PRD_STRIIM_SQL_SNET_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "PRD-STRIIM-SQL-SNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1305"
      name                                       = "ABA _SSH_HTTPS-SNET_ANL_SNET"
      description                                = "ABA _SSH_HTTPS-SNET_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Inbound"
      priority                                   = "1306"
      name                                       = "BPO_DEV_SQL_ANL_SNET"
      description                                = "BPO_DEV_SQL_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "BPO-DEV-SQL-ANL-SNET"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-in_ANL" 
      description                                = "Deny_VNET_VNET-in_ANL"
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
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-anl-gen-uks-dev-hs-mdw-snet-dev-anl-ANY-out"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-anl-gen-uks-dev-hs-mdw-snet-dev-anl-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_ANL_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AOA_ANL_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_ANL_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA_ANL_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET-out_ANL"
      description                                = "Deny_VNET_VNET-out_ANL"
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
  gen-uks-dev-hs-mdw-del-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-del-gen-uks-dev-hs-mdw-snet-dev-del-ANY-in"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-del-gen-uks-dev-hs-mdw-snet-dev-del-ANY-in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix","destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-DEL_SNET"
      description                                = "AIA_ACQ_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_ORG_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_ANL_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_MGT_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_User-BO_HTTPS"
      protocol                                   = "*"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIA_User-BO_Tomcat"
      protocol                                   = "*"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "RDP-IR"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIT_https-SNET-DEL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIT_SQL-SNET-DEL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AIT_SSH-SNET-DEL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "ABA_SSH_HTTPS-SNET_DEL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-in_DEL"
      description                                = "Deny-VNET-VNET-in_DEL"
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
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-del-gen-uks-dev-hs-mdw-snet-dev-del-ANY-out"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-del-gen-uks-dev-hs-mdw-snet-dev-del-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AOA_DEL_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AOA_DEL_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_DEL_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_DEL_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA-BO-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "eit-alz-hs-adds-snet-01-address-range2"
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
      description                                = "AOT-BO-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "alz-hs-loga-key-01"
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
      description                                = "AOT-BO-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "alz-hs-wsus-key-01"
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
      description                                = "AOT-BO-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-key-01"
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
      description                                = "AOT-BO-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
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
      description                                = "AOT-BO-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-kms-key-01"
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
      description                                = "AOT-BO-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsdgblv-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsharlv-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshnblv-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshpblv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1154"
      name                                       = "AOT-BO-EPD-dcshy1lv-old"
      description                                = "AOT-BO-EPD-dcshy1lv-old"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy1lv-old-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1155"
      name                                       = "AOT-BO-EPD-dcshy2lv-old"
      description                                = "AOT-BO-EPD-dcshy2lv-old"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy2lv-old-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1156"
      name                                       = "AOT-BO-EPD-dcstorlv-old"
      description                                = "AOT-BO-EPD-dcstorlv-old"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcstorlv-old-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1157"
      name                                       = "AOT-BO-EPD-dcsdgbac"
      description                                = "AOT-BO-EPD-dcsdgbac"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsdgbac-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1158"
      name                                       = "AOT-BO-EPD-dcsharac"
      description                                = "AOT-BO-EPD-dcsharac"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcsharac-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1159"
      name                                       = "AOT-BO-EPD-dcshnbac"
      description                                = "AOT-BO-EPD-dcshnbac"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshnbac-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1160"
      name                                       = "AOT-BO-EPD-dcshpbac"
      description                                = "AOT-BO-EPD-dcshpbac"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshpbac-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-LIMs-Bexa01-prod-scan-keys-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-LIMs-unknown-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1163"
      name                                       = "AOT-BO-LIMs-Bexa01-nonprod-scan"
      description                                = "AOT-BO-LIMs-Bexa01-nonprod-scan"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1524"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BO-LIMs-Bexa01-prod-scan-keys-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-NuMAS-BWDPRDNMSS01-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1165"
      name                                       = "AOT-BO-NuMAS-BWDUATNMSS01"
      description                                = "AOT-BO-NuMAS-BWDUATNMSS01"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-NuMAS-BWDUATNMSS01-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-SHAREPOINT-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1167"
      name                                       = "AOT-BO-EPD-dcshy1lv"
      description                                = "AOT-BO-EPD-dcshy1lv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy1lv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1168"
      name                                       = "AOT-BO-EPD-dcshy2lv"
      description                                = "AOT-BO-EPD-dcshy2lv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcshy2lv-key-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Outbound"
      priority                                   = "1169"
      name                                       = "AOT-BO-EPD-dcstorlv"
      description                                = "AOT-BO-EPD-dcstorlv"
      protocol                                   = "tcp"
      destination_port_range                     = "1521"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BO-EPD-dcstorlv-key-01"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "onpremAD"
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
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mdw-dev-acq-snet-bwdax022-key-01"
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
      description                                = "AOT-DEL-BO-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-out_DEL"
      description                                = "Deny-VNET-VNET -out_DEL"
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
  gen-uks-dev-hs-mdw-mgt-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-mgt-gen-uks-dev-hs-mdw-snet-dev-mgt-ANY-in"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-mgt-gen-uks-dev-hs-mdw-snet-dev-mgt-ANY -in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix","destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-MGT_SNET"
      description                                = "AIA_ACQ_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_ORG_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_ANL_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIA_DEL_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIT_https-SNET-MGT_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIT_SQL-SNET-MGT_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AIT_SSH-SNET-MGT_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "ABA_SSH_HTTPS-SNET_MGT-SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-in_MGT"
      description                                = "Deny-VNET-VNET-in_MGT"
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
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-mgt-gen-uks-dev-hs-mdw-snet-dev-mgt-ANY-out"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-mgt-gen-uks-dev-hs-mdw-snet-dev-mgt-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA_MGT_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AOA_MGT_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_MGT_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_MGT_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-mgt-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny-VNET-VNET-out_MG"
      description                                = "Deny-VNET-VNET-out_MG"
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
  gen-uks-dev-hs-mdw-org-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-org-gen-uks-dev-hs-mdw-snet-dev-org-ANY-in"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-org-gen-uks-dev-hs-mdw-snet-dev-org-ANY-in"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix","destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1050"
      name                                       = "AIA_ACQ_SNET-ORG_SNET"
      description                                = "AIA_ACQ_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-acq-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIA_ANL_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIA_MGT_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-anl-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIA_DEL_SNET-ORG_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-del-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1200"
      name                                       = "AIA-DEVBPO_MDWDEV-SNET-ORG-SNET"
      description                                = "AIA-DEVBPO_MDWDEV-SNET-ORG-SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = "BPODEV-SNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Inbound"
      priority                                   = "1201"
      name                                       = "AIA-TSTBPO_MDWDEV-SNET-ORG-SNET"
      description                                = "AIA-TSTBPO_MDWDEV-SNET-ORG-SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = "BPOTST-SNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Inbound"
      priority                                   = "1202"
      name                                       = "AIT-BWDAX023_MDWDEV-ORG-SNET"
      description                                = "AIT-BWDAX023_MDWDEV-ORG-SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = "bwdax23-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
      {
      direction                                  = "Inbound"
      priority                                   = "1203"
      name                                       = "AIT-BWDPRDCOGD01-MDWDEV-ORG-SNET"
      description                                = "AIT-BWDPRDCOGD01-MDWDEV-ORG-SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = "BWDPRDCOGD01-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIT_https-SNET-ORG_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIT_SQL-SNET-ORG_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AIT_SSH-SNET-ORG_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "MDW-Support-Desktops"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "ABA_SSH_HTTPS-SNET_ORG_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mdw-dev-acq-snet-ado-key-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET_in_ORG"
      description                                = "Deny_VNET_VNET_in_ORG"
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
      name                                       = "AIT_gen-uks-dev-hs-mdw-snet-dev-org-gen-uks-dev-hs-mdw-snet-dev-org-ANY-out"
      description                                = "AIT_gen-uks-dev-hs-mdw-snet-dev-org-gen-uks-dev-hs-mdw-snet-dev-org-ANY-out"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-org-address-range"
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
      description                                = "AOA_ORG_SNET-ACQ_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-acq-address-range"
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
      description                                = "AOA_ORG_SNET-ANL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-anl-address-range"
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
      description                                = "AOA_ORG_SNET-MGT_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-mgt-address-range"
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
      description                                = "AOA_ORG_SNET-DEL_SNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "data-dev-subnet-dev-org-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "data-dev-subnet-dev-del-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "Deny_VNET_VNET_out_ORG"
      description                                = "Deny_VNET_VNET_out_ORG"
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
  gen-uks-dev-hs-mdw-acq-nsg01 = {
    gen-uks-dev-hs-mdw-snet-dev-acq = true
  }
  gen-uks-dev-hs-mdw-mgt-nsg01 = {
    gen-uks-dev-hs-mdw-snet-dev-mgt = true
  }
  gen-uks-dev-hs-mdw-anl-nsg01 = {
    gen-uks-dev-hs-mdw-snet-dev-anl = true
  }
  gen-uks-dev-hs-mdw-org-nsg01 = {
    gen-uks-dev-hs-mdw-snet-dev-org = true
  }
  gen-uks-dev-hs-mdw-del-nsg01 = {
    gen-uks-dev-hs-mdw-snet-dev-del = true
  }
  gen-uks-dev-hs-mdw-pep-nsg01 = {
    gen-uks-dev-hs-mdw-snet-dev-pep = true
  }
  gen-uks-dev-hs-mdw-anl-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-tst-anl = true
  }
  gen-uks-dev-hs-mdw-acq-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-tst-acq = true
  }
  gen-uks-dev-hs-mdw-del-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-tst-del = true
  }
  gen-uks-dev-hs-mdw-mgt-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-tst-mgt = true
  }
  gen-uks-dev-hs-mdw-org-nsg-01 = {
    gen-uks-dev-hs-mdw-snet-tst-org = true
  }
}

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
retention_policydays      = 90
category1                 = "VMProtectionAlerts"
category2                 = "AllMetrics"
diag_vnet_name01          = "gen-uks-dev-hs-mdw-vnet-dev-01"
diag_vnet_rg01            = "data-uks-dev-vnet-dev-rg-01"
diag_vnet_name02          = "gen-uks-dev-hs-mdw-vnet-tst-01"
diag_vnet_rg02            = "data-uks-dev-vnet-tst-rg-01"
