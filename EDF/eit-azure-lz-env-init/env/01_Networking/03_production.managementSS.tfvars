environment = "Live"

#mgmtss key vault
mgmtssKvName   = "avmeitalzssmgmtsub01kv"
mgmtssKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-ss-mgmt-vnet-rg = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Live"
    }
  }
}

vnets = {
  eit-uks-alz-ss-mgmt-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-ss-mgmt-vnet-rg"
    addressSpace  = "mgmtss-vnet-address-range"
    dnsServerList = "mgmtss-dns-ips"
    subnets = {
      eit-alz-ss-mgmt-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-mgmt-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-adds-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-adds-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-wsus-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-wsus-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-wac-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-wac-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-ca-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-ca-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-audit-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-audit-snet-01-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      eit-alz-ss-snow-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-snow-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-snow-snet-02 = {
        enable                    = true
        address                   = "eit-alz-ss-snow-snet-02-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "eit-alz-ss-azure-bastion-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-ado-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-ado-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-afs-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-afs-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-ss-pep-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-pep-snet-01-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = false
      }
      eit-alz-ss-imagebuild-snet-01 = {
        enable                    = true
        address                   = "eit-alz-ss-img-snet-01-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = false
      }
    }
  }
}

UDR = {
  eit-alz-ss-mgmt-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-mgmt-snet-d_Internet", "eit-alz-ss-mgmt-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-mgmt-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-mgmt-udr-nexthop"
  },
  eit-alz-ss-ad-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-ad-snet-d_eit-alz-t1int-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-t1mgmt-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-t2int-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-t2mgmt-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-transit-protected-snet-01", "s_eit-alz-ss-ad-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-ad-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-ad-udr-nexthop"
  },
  eit-alz-ss-wsus-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-wsus-snet-d_Internet", "s_eit-alz-ss-wsus-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-wsus-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-wsus-udr-nexthop"
  },
  eit-alz-ss-wac-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-wac-snet-d_Internet", "s_eit-alz-ss-wac-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-wac-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-wac-udr-nexthop"
  },
  eit-alz-ss-ca-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-ca-snet-d_Internet", "s_eit-alz-ss-ca-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-ca-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-ca-udr-nexthop"
  },
  eit-alz-ss-snow-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-snow-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-snow-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-mgmt-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-mgmt-udr-nexthop"
  },
  eit-alz-ss-snow-udr-02 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-snow-snet-02-d_On-Prem-Internet", "s_eit-alz-ss-snow-snet-02-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-mgmt-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-mgmt-udr-nexthop"
  },
  eit-alz-ss-ado-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-ado-snet-01-d_Internet", "s_eit-alz-ss-ado-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-ado-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-ado-udr-nexthop"
  },
  eit-alz-ss-afs-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-afs-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-afs-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-afs-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-afs-udr-nexthop"
  },
  eit-alz-ss-pep-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-pep-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-pep-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-pep-udr-nexthop"
  },
  eit-alz-alz-ss-imagebuild-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-ss-imagebuild-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-imagebuild-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-imagebuild-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-imagebuild-udr-nexthop"
  }
}

UDR_Subnet_Mapping = {
  eit-alz-ss-mgmt-udr-01           = ["eit-alz-ss-mgmt-snet-01"]
  eit-alz-ss-ad-udr-01             = ["eit-alz-ss-adds-snet-01"]
  eit-alz-ss-wsus-udr-01           = ["eit-alz-ss-wsus-snet-01"]
  eit-alz-ss-wac-udr-01            = ["eit-alz-ss-wac-snet-01"]
  eit-alz-ss-ca-udr-01             = ["eit-alz-ss-ca-snet-01"]
  eit-alz-ss-snow-udr-01           = ["eit-alz-ss-snow-snet-01"]
  eit-alz-ss-snow-udr-02           = ["eit-alz-ss-snow-snet-02"]
  eit-alz-ss-ado-udr-01            = ["eit-alz-ss-ado-snet-01"]
  eit-alz-ss-afs-udr-01            = ["eit-alz-ss-afs-snet-01"]
  eit-alz-ss-pep-udr-01            = ["eit-alz-ss-pep-snet-01"]
  eit-alz-alz-ss-imagebuild-udr-01 = ["eit-alz-ss-imagebuild-snet-01"]
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-ss-mgmt-vnet-01"
    peer2name = "eit-uks-alz-ss-mgmt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    vnet2name = "eit-uks-alz-ss-mgmt-vnet-01"
    vnet2rg   = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
}

tenantIdSecretKey            = "tenantId"
hubSubscriptionIdSecretKey   = "lz-transit-SubscriptionId"
spokeSubscriptionIdSecretKey = "mgmtss-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

############## NSGs #######################
# mgmtss_kvname = "eit-uks-snd-ss-vd-kvt-01"
# mgmtss_kvrg   = "eit-uks-snd-ss-wvd-kvt-rg-01"
# asg_rg = "eit-uks-ss-kvt-rg-01" # Using same rg for all the asg

asg_rg = {
  eit-uks-alz-ss-caweb-asg = "ss-mgmt-asgs-prd"
  eit-uks-alz-ss-ica-asg   = "ss-mgmt-asgs-prd"
  eit-uks-alz-ss-adds-asg  = "ss-mgmt-asgs-prd"
  eit-uks-alz-ss-wac-asg   = "ss-mgmt-asgs-prd"
}

nsg = {
  eit-uks-alz-ss-mgmt-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-uks-alz-ss-ca-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-uks-alz-ss-adds-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-uks-alz-ss-wac-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-uks-alz-ss-wsus-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-uks-alz-ss-audit-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-alz-ss-snow-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-alz-ss-snow-nsg-02 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-alz-ss-ado-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-alz-ss-afs-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-uks-alz-ss-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
  eit-alz-alz-ss-imagebuild-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg"
  }
}

nsgrules = {
  eit-uks-alz-ss-mgmt-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AllowVnetInBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowVnetInBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "651"
      name                                       = "AllowAzureLoadBalancerInBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "AzureLoadBalancer"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowAzureLoadBalancerInBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "652"
      name                                       = "AIT-WSUS-SNOWMID"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-WSUS-SNOWMID"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"] //updated
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "653"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-MGMT" #Changed as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-MGMT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"     #Changed as per Standard rule
      name                                       = "AIA-SECGOV-MID-MGMT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-MGMT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-MGMT" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-MGMT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-MGMT" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-MGMT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "Deny-VNET-VNET"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "655"
      name                                       = "AllowVnetOutBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowVnetOutBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "656"
      name                                       = "AllowInternetOutBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowInternetOutBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4095" #Changed as per Standard rule
      name                                       = "DenyAllOutbound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      access                                     = "Deny"
      description                                = "DenyAllOutbound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-MGMT-AZUREAGENT-443"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-MGMT-AZUREAGENT-443"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-MGMT-AZURECLOUD" #Changed as per Standard rule
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-MGMT-AZURECLOUDe"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-MGMT-KMS" #Changed as per Standard rule
      protocol                                   = "TCP"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-MGMT-KMS"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500" #Changed as per Standard rule
      name                                       = "AOT-MGMT-WSUS"
      protocol                                   = "TCP"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-MGMT-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400" #Changed as per Standard rule
      name                                       = "AOA-MGMT-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-MGMT-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-BASTION-MGMT-RDP"
      protocol                                   = "TCP"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-BASTION-MGMT-RDP"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "400" #Changed as per Standard rule
      name                                       = "AOA-ADDS-MGMT-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-ADDS-MGMT-ANY"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Added as per Standard rule
      name                                       = "AIT-WAC-MGMT"
      description                                = "AIT-WAC-MGMT"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-MGMT"
      description                                = "AIT-AFS-MGMT"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "0-65535"
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
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "450"
      name                                       = "AOT-MGMT-LOGA"
      description                                = "AOT-MGMT-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-MGMT-TENABLEAGENT"
      description                                = "AOT-MGMT-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-MGMT-LINUXUPDATES"
      description                                = "AOT-MGMT-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
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
      priority                                   = "4050" #Added as per Standard rule
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
      protocol                                   = "*"
      destination_port_range                     = "0-65535"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-MGMT-PEP"
      description                                = "AOA-MGMT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-MGMT-NTP"
      description                                = "AOT-MGMT-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-ss-ca-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "410" #Changed as per Standard rule
      name                                       = "AIT-PKI-CAWEB-ICA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-PKI-CAWEB-ICA"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "651"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-CA" #Changed as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-CA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-CA" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-CA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-CA" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-CA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-CA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-CA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "425"
      name                                       = "AIT-ICA-ASG-RCA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_application_security_group_ids      = "eit-uks-alz-ss-ica-asg"
      destination_application_security_group_ids = ""
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-rca-dst-prefix01"
      access                                     = "Allow"
      description                                = "AIT-ICA-ASG-RCA"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "470" #Changed as per Standard rule
      name                                       = "AIT-PKI-VNET-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-PKI-VNET-CAWEB"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "510" #Changed as per Standard rule
      name                                       = "AIA-AD-ASG-CAWEB-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "525"
      name                                       = "AIA-AD-ASG-ICA-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-ASG-ICA-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-BASTION-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-BASTION-CAWEB"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "575"
      name                                       = "AIT-BASTION-ICA"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-BASTION-ICA"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-BASTION-ROOTCA"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-bst-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-BASTION-ROOTCA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-WAC-ASG-CAWEB-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-WAC-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-WAC-ASG-ICA-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-WAC-ASG-ICA-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "675"
    #   name                       = "Deny-VNET_VNET"
    #   protocol                   = "*"
    #   destination_port_range     = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "*"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "*"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Deny"
    #   description                = "Deny-VNET_VNET"
    #   fetch_from_kv              = []
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" #Changed as per Standard rule
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
      description                                = "DIA-VNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "410" #Changed as per Standard rule
      name                                       = "AOT-PKI-ICA-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-ica-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AOT-PKI-ICA-CAWEB"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-CAWEB-LOGA" #Changed as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CAWEB-LOGA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "540"
      name                                       = "AOA-CAWEB-ASG-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AOA-CAWEB-ASG-AD-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "575"
      name                                       = "AOA-ICA-ASG-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-ica-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AOA-ICA-ASG-AD-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-CA-AZUREAGENT-443" #Changed as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-out-pki-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_AzureAgent--443"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-CA-AZURECLOUD-443" #Changed as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CA-AZURECLOUD-443" #Changed as per Standard rule
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2200"
      name                                       = "AOT-PKI_AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_AzureStorage"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-CA-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-kms-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CA-KMS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500" #Changed as per Standard rule
      name                                       = "AOT-CA-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CA-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "DOA-VNET_VNET" #Changed as per Standard rule
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
      description                                = "DOA-VNET_VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AIA-ADDS-CA-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ADDS-CA-ANY"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Added as per Standard rule
      name                                       = "AIT-WAC-CA"
      description                                = "AIT-WAC-CA"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-CA"
      description                                = "AIT-AFS-CA"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AOA-CA-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-CA-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-CA-TENABLEAGENT"
      description                                = "AOT-CA-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-CA-LINUXUPDATES"
      description                                = "AOT-CA-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      //650 changed
      name                                       = "AOA-CA-PEP"
      description                                = "AOA-CA-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-CA-NTP"
      description                                = "AOT-CA-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-ss-adds-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400" #Changed as per Standard rule
      name                                       = "AIA-ADDS-ADDS-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-adds-nsg-01-aia-src-dst-prefix"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-adds-nsg-01-aia-src-dst-prefix"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-AD-AD-Replication"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "460" #Changed as per Standard rule
      name                                       = "AIT_WACGW_ASG_ADDS_ASG"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      protocol                                   = "tcp"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AIT_WACGW_ASG_ADDS_ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "510" // 500 changed
      name                                       = "AIT_VNET_ADDS"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AIT_VNET_ADDS"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT_BASTION_ADDS_ASG"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      protocol                                   = "tcp"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AIT_BASTION_ADDS_ASG"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "650"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "750"     #Changed as per Standard rule
      name                                       = "AIT-ADO-ADDS"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      protocol                                   = "tcp"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-ADDS" #Changed as per Standard rule
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-ADDS" #Changed as per Standard rule
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-ADDS" #Changed as per Standard rule
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" #Changed as per Standard rule
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "VirtualNetwork"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DIA-VNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-ADDS-ADDS" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-ADDS-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-ADDS-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-02"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADDS-LOGA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "480" #Changed as per Standard rule
      name                                       = "AOT-ADDS_VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = "" //ss-adds-nsg-01-aot-dest-prefixes
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADDS_VNET"
      fetch_from_kv                              = [] //destination_address_prefixes
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "540"
      name                                       = "AOT-ADDS-WSUS"
      description                                = "AOT-ADDS-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-ADDS-AZUREAGENT-443" #Changed as per Standard rule
      description                                = "AOT-ADDS-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-ADDS-AZURECLOUD-443" #Changed as per Standard rule
      description                                = "AOT-ADDS-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100" #Changed as per Standard rule
      name                                       = "AOT-ADDS-KMS"
      description                                = "AOT-ADDS-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-kms-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "4000"
    #   name                       = "Deny_Internet"
    #   description                = "Deny_Internet"
    #   destination_port_range     = "*"
    #   protocol                   = "*"
    #   source_port_range          = "*"
    #   source_address_prefix      = "*"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "*"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = []
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET" #Changed as per Standard rule
      description                                = "DOA-VNET_VNET"
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
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-ADDS_Storage"
      description                                = "AOT-ADDS_Storage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2400"
      name                                       = "AOT-ADDS_Internet"
      description                                = "AOT-ADDS_Internet"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Added as per Standard rulee
      name                                       = "AIT-WAC-ADDS"
      description                                = "AIT-WAC-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-common-02"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT--ADDS-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-02"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADDS-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-ADDS-TENABLEAGENT"
      description                                = "AOT-ADDS-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-02"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-ADDS-LINUXUPDATES"
      description                                = "AOT-ADDS-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-02"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-ADDS-PEP"
      description                                = "AOA-ADDS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "500"
      name                                       = "AIT-AFS-ADDS" #updated as per Standard rule
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-AFS-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-ADDS-NTP"
      description                                = "AOT-ADDS-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-ss-wac-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "410" #Changed as per Standard rule
      name                                       = "AIA-AD-ASG-WAC"
      description                                = "AIA-AD-ASG-WAC"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "490" #Changed as per Standard rule
      name                                       = "AIT-VNET_WAC"
      description                                = "AIT-VNET_WAC"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-wac-asg"
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-WACILB-WACGW"
      description                                = "AIT-WACILB-WACGW"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "AzureLoadBalancer"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-wac-asg"
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-BASTION-WAC-RDP"
      description                                = "AIT-BASTION-WAC-RDP"
      destination_port_range                     = "3389"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"     #Changed as per Standard rule
      name                                       = "AIT-ADO-WAC"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-WAC"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-WAC" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-WAC"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-WAC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-WAC"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-WAC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "AIA-SECGOV-PENTEST-WAC"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET" #Changed as per Standard rule
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AIT-SNOWMID-Test"
      destination_port_range                     = "21,22,23,25,80,110,111,135,139,199,389,443,445,515,548,636,993,1414,1433,1521,3306,5060,5432,5480,5666,5989,7001,7500,8080,9080,9100,9443,9443,50000"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "651"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIU-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AIU-SNOWMID-Test"
      destination_port_range                     = "137,161,162"
      protocol                                   = "udp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "950"
      name                                       = "AIA-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AIA-SNOWMID-Test"
      destination_port_range                     = "53,427,2049"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "410" #Changed as per Standard rule
      name                                       = "AOA-WAC-AD-ASG"
      description                                = "AOA-WAC-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-WACGW-LOGA"
      description                                = "AOT-WACGW-LOGA" #Changed as per Standard rule
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "510" #Changed as per Standard rule
      name                                       = "AOA-WACGW-MGMTVMS-RDP"
      description                                = "AOA-WACGW-MGMTVMS-RDP"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "540" #Changed as per Standard rule
      name                                       = "AOT-WACGW-Internet"
      description                                = "AOT-WACGW-Internet"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "590" #Changed as per Standard rule
      name                                       = "AOT-WAC_WSUS"
      description                                = "AOT-WAC_WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-WAC-AZUREAGENT-443"
      description                                = "AOT-WAC-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-out-pki-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" #Changed as per Standard rule
      name                                       = "AOT-WAC-AZURECLOUD-443"
      description                                = "AOT-WAC-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
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
      priority                                   = "3100" #Changed as per Standard rule
      name                                       = "AOT-WAC-KMS"
      description                                = "AOT-WAC-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-kms-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET" #Changed as per Standard rule
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "440" #Changed as per Standard rule
      name                                       = "AIA-BLUESMB-WAC"
      description                                = "AIA-BLUESMB-WAC"
      destination_port_range                     = "445"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-wac-asg"
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AIA-ADDS-WAC-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ADDS-WAC-ANY"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "450"
      name                                       = "AIT-WAC-WAC"
      description                                = "AIT-WAC-WAC"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-WAC"
      description                                = "AIT-AFS-WAC"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AOA-WAC-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-WAC-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT-WAC-WSUS"
      description                                = "AOT-WAC-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-WAC-TENABLEAGENT"
      description                                = "AOT-WAC-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-WAC-LINUXUPDATES"
      description                                = "AOT-WAC-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-WAC-PEP"
      description                                = "AOA-WAC-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET" #Changed as per Standard rule
      destination_port_range                     = "*"
      protocol                                   = "*"
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
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOA-WAC-NTP"
      description                                = "AOA-WAC-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }

  ]
  eit-uks-alz-ss-wsus-nsg-01 = [
    {
      direction                                  = "Inbound" #Changed as per Standard rule
      priority                                   = "410"
      name                                       = "AIT-ADDS-ASG-WSUS"
      description                                = "AIT-ADDS-ASG-WSUS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "490"
      name                                       = "AIT-VNET_WSUS"
      description                                = "AIT-VNET_WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-01-common-prefix"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-WACGW-ASG-WSUS"
      description                                = "AIT-WACGW-ASG-WSUS"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-BASTION-RDP"
      description                                = "AIT-BASTION-RDP"
      destination_port_range                     = "3389"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "650"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-WSUS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-WSUS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-WSUS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET" #Changed as per Standard rule
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "410" #Changed as per Standard rule
      name                                       = "AOA-WSUS-AD-ASG"
      description                                = "AOA-WSUS-AD-ASG"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-WSUS-LOGA"
      description                                = "AOT-WSUS-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "480" #Changed as per Standard rule
      name                                       = "AOT-VNET_Internet"
      description                                = "AOT-VNET_Internet"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
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
      priority                                   = "540" #Changed as per Standard rule
      name                                       = "AOT-WSUS_VNET"
      description                                = "AOT-WSUS_VNET"
      destination_port_range                     = "8530,8531"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-WSUS-AZUREAGENT-443"
      description                                = "AOT-WSUS-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-out-pki-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" #Changed as per Standard rule
      name                                       = "AOT-WSUS-AZURECLOUD-443"
      description                                = "AOT-WSUS-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
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
      priority                                   = "3100" #Changed as per Standard rule
      name                                       = "AOT-WSUS-KMS"
      description                                = "AOT-WSUS-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-kms-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" #Changed as per Standard rule
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
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
      direction                                  = "Outbound"
      priority                                   = "590"
      name                                       = "AOT-WSUS_WACGW"
      description                                = "AOT-WSUS_WACGW"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"] // updated value
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AIA-ADDS-WSUS-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-adds-nsg-01-aia-src-dst-prefix"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ADDS-WSUS-ANY"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "450"
      name                                       = "AIT-WAC-WSUS"
      description                                = "AIT-WAC-WSUS"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-WSUS"
      description                                = "AIT-AFS-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AOA-WSUS-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-WSUS-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT-WSUS-WSUS"
      protocol                                   = "TCP"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-MGMT-WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-WSUS-TENABLEAGENT"
      description                                = "AOT-WSUS-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-WSUS-LINUXUPDATES"
      description                                = "AOT-WSUS-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-WSUS-PEP"
      description                                = "AOA-WSUS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOA-WSUS-NTP"
      description                                = "AOA-WSUS-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-ss-audit-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "410" #Changed as per Standard rule
      name                                       = "AIT-VNET-LOGA"
      description                                = "AIT-VNET-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-AUDIT" #Changed as per Standard rule
      description                                = "AIT-WAC-AUDIT"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "650"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-AUDIT" #Changed as per Standard rule
      description                                = "AIT-ADO-AUDIT"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-AUDIT"
      description                                = "AIA-SECGOV-MID-AUDIT"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-AUDIT"
      description                                = "AIA-SECGOV-TENABLE-AUDIT"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-AUDIT" #Changed as per Standard rule
      description                                = "AIA-SECGOV-PENTEST-AUDIT"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET" #Changed as per Standard rule
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
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-AUDIT-AZUREAGENT-443"
      description                                = "AOT-AUDIT-AZUREAGENT-443"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-out-pki-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" #Changed as per Standard rule
      name                                       = "AOT-AUDIT-AZURECLOUD-443"
      description                                = "AOT-AUDIT-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET" #Changed as per Standard rule
      description                                = "DOA-VNET_VNET"
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
      priority                                   = "400" #Added as per Standard rule
      name                                       = "AIA-ADDS-AUDIT-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-adds-nsg-01-aia-src-dst-prefix"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ADDS-AUDIT-ANY"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-AUDIT"
      description                                = "AIT-AFS-AUDIT"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AOA-AUDIT-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-AUDIT-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "450"
      name                                       = "AOT-AUDIT-LOGA"
      description                                = "AOT-AUDIT-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT-AUDIT-WSUS"
      description                                = "AOT-AUDIT-WSUS"
      destination_port_range                     = "850"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-AUDIT-TENABLEAGENT"
      description                                = "AOT-AUDIT-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-AUDIT-LINUXUPDATES"
      description                                = "AOT-AUDIT-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "3100"
      name                                       = "AOT-AUDIT-KMS"
      description                                = "AOT-AUDIT-KMS"
      destination_port_range                     = "1638"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-AUDIT-PEP"
      description                                = "AOA-AUDIT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOA-AUDIT-NTP"
      description                                = "AOA-AUDIT-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-ss-snow-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-SNOW"
      description                                = "AIA-ADDS-SNOW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Changed as per Standard rule
      name                                       = "AIT-WAC-SNOW"
      description                                = "AIT-WAC-SNOW"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIA-RedVPN-SNOWMID"
      description                                = "AIA-RedVPN-SNOWMID"
      destination_port_range                     = "3389"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-ss-mgmt-snowmid-source-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-snowmid-dest-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // added
      priority                                   = "650"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-SNOW" #Changed as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-SNOW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-SNOW" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-SNOW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET" #Changed as per Standard rule
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
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-SNOW-ADDS"
      description                                = "AOA-SNOW-ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-SNOW-LOGA"
      description                                = "AOT-SNOW-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-SNOW-AZUREAGENT-443"
      description                                = "AOT-SNOW-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // hardcoded as this is a Azure public address range
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-SNOW-AZURECLOUD-443" #Changed as per Standard rule
      description                                = "AOT-SNOW-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
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
      priority                                   = "3100" #Changed as per Standard rule
      name                                       = "AOT-SNOW-KMS"
      description                                = "AOT-SNOW-KMS"
      destination_port_range                     = "1638"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" #Changed as per Standard rule
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
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
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-SNOW-WSUS"
      description                                = "AOT-SNOW-WSUS"
      destination_port_range                     = "850"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "540"                  #Changed as per Standard rule
      name                                       = "AOT-SNOWMID-INTERNET" ## new rule to replace AOT-SNOWMID-SNOWURL
      description                                = "AOT-SNOWMID-INTERNET"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
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
    },
    {
      direction                                  = "Outbound"
      priority                                   = "651"              // 650 changed
      name                                       = "AOT-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AOT-SNOWMID-Test"
      destination_port_range                     = "21,22,23,25,80,110,111,135,139,199,389,443,445,515,548,636,993,1414,1433,1521,3306,5060,5432,5480,5666,5989,7001,7500,8080,9080,9100,9443,9443,50000"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "eit-alz-ss-snow-snet-02-wac-snet-01-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOU-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AOU-SNOWMID-Test"
      destination_port_range                     = "137,137,161,162"
      protocol                                   = "udp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "eit-alz-ss-snow-snet-02-wac-snet-01-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "750"
      name                                       = "AOA-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AOA-SNOWMID-Test"
      destination_port_range                     = "53,427,2049"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "eit-alz-ss-snow-snet-02-wac-snet-01-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIA-AFS-SNOW"
      description                                = "AIA-AFS-SNOW"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-SNOW-TENABLEAGENT"
      description                                = "AOT-SNOW-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-SNOW-LINUXUPDATES"
      description                                = "AOT-SNOW-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOA-SNOW-NTP"
      description                                = "AOA-SNOW-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-ss-snow-nsg-02 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-SNOWTESTVMS-ANY" #Changed as per Standard rule
      description                                = "AIA-ADDS-SNOWTESTVMS-ANY"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Changed as per Standard rule
      name                                       = "AIT-WAC-SNOWTESTVMS"
      description                                = "AIT-WAC-SNOWTESTVMS"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" #Changed as per Standard rule
      description                                = "DIA-VNET-VNET"
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
    # {
    #   direction                  = "Inbound"
    #   priority                   = "450"
    #   name                       = "AIT-WSUS-SNOWMID" //updated name
    #   description                = "AIT-WSUS-SNOWMID"
    #   destination_port_range     = "8530"
    #   protocol                   = "tcp"
    #   source_port_range          = "*"
    #   source_address_prefix      = "eit-alz-ss-wsus-snet-01-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "eit-alz-ss-snow-snet-02-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AIT-SNOWMID-Test"
      destination_port_range                     = "21,22,23,25,80,110,111,135,139,199,389,443,445,515,548,636,993,1414,1433,1521,3306,5060,5432,5480,5666,5989,7001,7500,8080,9080,9100,9443,9443,50000"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIU-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AIU-SNOWMID-Test"
      destination_port_range                     = "137,137,161,162"
      protocol                                   = "udp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "740"              #Changed as per Standard rule
      name                                       = "AIA-SNOWMID-Test" // Temporary rule for Snow project team to test the discovery
      description                                = "AIA-SNOWMID-Test"
      destination_port_range                     = "53,427,2049"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // added
      priority                                   = "651"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"     #Changed as per Standard rule
      name                                       = "AIT-ADO-SNOW"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"     #Changed as per Standard rule
      name                                       = "AIA-SECGOV-MID-SNOW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-SNOW" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-SNOW" #Changed as per Standard rule
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-SNOW"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-SNOWTESTVMS-ADDS"
      description                                = "AOA-SNOWTESTVMS-ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-SNOWTESTVMS-LOGA"
      description                                = "AOT-SNOWTESTVMS-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-SNOWTESTVMS-AZUREAGENT-443" #Changed as per Standard rule
      description                                = "AOT-SNOWTESTVMS-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // hardcoded as this is a Azure public address range
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-SNOWTESTVMS-AZURECLOUD-443" #Changed as per Standard rule
      description                                = "AOT-SNOWTESTVMS-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
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
      priority                                   = "3100" #Changed as per Standard rule
      name                                       = "AOT-SNOWTESTVMS-KMS"
      description                                = "AOT-SNOWTESTVMS-KMS"
      destination_port_range                     = "1638"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "DOA-VNET_VNET" #Changed as per Standard rule
      description                                = "DOA-VNET_VNET"
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
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-SNOWTESTVMS-WSUS" #Changed as per Standard rule
      description                                = "AOT-SNOWTESTVMS-WSUS"
      destination_port_range                     = "850"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-SNOWTESTVMS"
      description                                = "AIT-AFS-SNOWTESTVMS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-snow-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-SNOWTESTVMS-TENABLEAGENT"
      description                                = "AOT-SNOWTESTVMS-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-SNOWTESTVMS-LINUXUPDATES"
      description                                = "AOT-SNOWTESTVMS-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOA-SNOW-02-NTP"
      description                                = "AOA-SNOW-02-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-snow-snet-02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-ss-ado-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Changed as per Standard rule
      name                                       = "AIT-WAC-ADO"
      protocol                                   = "TCP"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-WAC-ADO"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "650"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-ADO"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-ADO"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-ADO"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-ADO"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-ADO"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-ADO"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" #Changed as per Standard rule
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
      description                                = "DIA-VNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "390" #Changed as per Standard rule
      name                                       = "AOT-ADO-SS_VNET"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-common-prefix"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADO-SS_VNET"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "440" #Changed as per Standard rule
      name                                       = "AOT-ADO-Internet"
      protocol                                   = "TCP"
      destination_port_range                     = "80,443,22"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADO-Internet"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" #Changed as per Standard rule
      name                                       = "DOA-VNET_VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      access                                     = "Deny"
      description                                = "DOA-VNET_VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AIA-ADDS-ADO-ANY"
      description                                = "AIA-ADDS-ADO-ANY"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-ADO"
      description                                = "AIT-AFS-ADO"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-ADO" #Added as per Standard rule
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-ADO"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AOA-ADO-ADDS"
      description                                = "AOA-ADO-ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "450"
      name                                       = "AOT-ADO-LOGA"
      description                                = "AOT-ADO-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-ADO-TENABLEAGENT"
      description                                = "AOT-ADO-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-ADO-LINUXUPDATES"
      description                                = "AOT-ADO-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "3000"
      name                                       = "AOT-ADO-AZUREAGENT-443"
      description                                = "AOT-ADO-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // hardcoded as this is a Azure public address range
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "3050"
      name                                       = "AOT-ADO-AZURECLOUD-443"
      description                                = "AOT-ADO-AZURECLOUD-443"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "3100"
      name                                       = "AOT-ADO-KMS"
      description                                = "AOT-ADO-KMS"
      destination_port_range                     = "1638"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" // added
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-ADO-WSUS"
      description                                = "AOT-ADO-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-ADO-NTP"
      description                                = "AOT-ADO-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-ss-afs-nsg-01 = [
    {
      priority                                   = "400"
      direction                                  = "Inbound"
      name                                       = "AIA-ADDS-AFS-ANY" #Changed as per Standard rule
      description                                = "AIA-ADDS-AFS-ANY"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-AFS"
      description                                = "AIT-WAC-AFS"
      destination_port_range                     = "3389,5985"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      description                                = "AIA-SSMID-SERVERS-SSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-AFS" #Changed as per Standard rule
      description                                = "AIT-ADO-AFS"
      destination_port_range                     = "443,445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-AFS" #Changed as per Standard rule
      description                                = "AIA-SECGOV-MID-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-AFS" #Changed as per Standard rule
      description                                = "AIA-SECGOV-TENABLE-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-AFS" #Changed as per Standard rule
      description                                = "AIA-SECGOV-PENTEST-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-AFS" #Changed as per Standard rule
      description                                = "AIT-AFS-AFS"
      destination_port_range                     = "445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-ait-vnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" //updated name
      description                                = "DIA-VNET-VNET"
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
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-AFS-ADDS"
      description                                = "AOA-AFS-ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-AFS-LOGA"
      description                                = "AOT-AFS-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-AFS-WSUS"
      description                                = "AOT-AFS-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-AFS-AZUREAGENT-443" #Changed as per Standard rule
      description                                = "AOT-AFS-AZUREAGENT-443"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-out-pki-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-AFS-AZURECLOUD-443"
      description                                = "AOT-AFS-AZURECLOUD-443" #Changed as per Standard rule
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
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
      priority                                   = "2300"
      name                                       = "AOT-AFS-AzureStorage"
      description                                = "AOT-AFS-AzureStorage"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
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
      name                                       = "DOA-VNET_VNET" #Changed as per Standard rule
      description                                = "DOA-VNET_VNET"
      destination_port_range                     = "*"
      protocol                                   = "TCP"
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
      priority                                   = "550"
      name                                       = "AIT-BASTION-RDP"
      description                                = "AIT-BASTION-RDP"
      destination_port_range                     = "3389"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-AFSSubnet-FileSyncDNS"
      description                                = "AIT-AFSSubnet-FileSyncDNS"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-afs-fs-dns-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "540" #Changed as per Standard rule
      name                                       = "AOT-AFS-Internet"
      description                                = "AOT-AFS-Internet"
      destination_port_range                     = "80,443"
      protocol                                   = "TCP"
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
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-AFS-TENABLEAGENT"
      description                                = "AOT-AFS-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-AFS-LINUXUPDATES"
      description                                = "AOT-AFS-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "3100"
      name                                       = "AOT-AFS-KMS"
      protocol                                   = "TCP"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-MGMT-KMS"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "651"      // 650 changed
      name                                       = "AOA-AFS-PEP"
      description                                = "AOA-AFS-PEP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-AFS-NTP"
      description                                = "AOT-AFS-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-ss-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-PEP"
      description                                = "AIA-ADDS-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-PEP"
      description                                = "AIT-WAC-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-PEP"
      description                                = "AIT-AFS-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-CA-PEP"
      description                                = "AIT-CA-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-ss-ca-snet-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-WSUS-PEP"
      description                                = "AIT-WSUS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-ss-wsus-snet-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-ADO-PEP"
      description                                = "AIT-ADO-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-ss-ado-snet-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-MGMT-PEP"
      description                                = "AIT-MGMT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-ss-mgmt-snet-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-AUDIT-PEP"
      description                                = "AIT-AUDIT-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PEP"
      description                                = "AIA-SECGOV-MID-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-PEP"
      description                                = "AIA-SECGOV-TENABLE-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-PEP"
      description                                = "AIA-SECGOV-PENTEST-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-pep-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET"
      destination_port_range                     = "443,445"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
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
      source_address_prefix                      = "eit-alz-ss-pep-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-PEP-AzureAgent"
      description                                = "AOT-PEP-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-pep-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-PEP-AZURECLOUD"
      description                                = "AOT-PEP-AZURECLOUD"
      destination_port_range                     = "443,445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-pep-snet-01-address-range"
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
      name                                       = "AOT-PEP-AzureStorage"
      description                                = "AOT-PEP-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-pep-snet-01-address-range"
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
      priority                                   = "4000"
      name                                       = "DOA-VNET-VNET"
      description                                = "DOA-VNET-VNET"
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
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DenyAllOutbound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DenyAllOutbound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
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
      description                                = "DOA-VNET_INTERNETT"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-alz-alz-ss-imagebuild-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-IMGBUILD"
      description                                = "AIA-ADDS-IMGBUILD"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-IMGBUILD"
      description                                = "AIT-WAC-IMGBUILD"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-IMGBUILD"
      description                                = "AIT-AFS-IMGBUILD"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-IMGBUILD"
      description                                = "AIT-ADO-IMGBUILD"
      destination_port_range                     = "443,445,22"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-IMGBUILD"
      description                                = "AIA-SECGOV-MID-IMGBUILD"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-IMGBUILD"
      description                                = "AIA-SECGOV-TENABLE-IMGBUILD"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-IMGBUILD"
      description                                = "AIA-SECGOV-PENTEST-IMGBUILD"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-img-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET"
      destination_port_range                     = "443,445"
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
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
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-IMGBUILD-ADDS"
      description                                = "AOA-IMGBUILD-ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-IMGBUILD-LOGA"
      description                                = "AOT-IMGBUILD-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-IMGBUILD-WSUS"
      description                                = "AOT-IMGBUILD-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-IMGBUILD-TENABLEAGENT"
      description                                = "AOT-IMGBUILD-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-mgmt-onprem-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000" #Added as per Standard rule
      name                                       = "AOT-IMGBUILD-APPROVEDURLS"
      description                                = "AOT-IMGBUILD-APPROVEDURLS"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
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
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-IMGBUILD-AZUREAGENT-443"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-IMGBUILD-AZUREAGENT-443"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-IMGBUILD-AZURECLOUD" #Changed as per Standard rule
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-IMGBUILD-AZURECLOUDe"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-IMGBUILD-KMS" #Changed as per Standard rule
      protocol                                   = "TCP"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-IMGBUILD-KMS"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-IMGBUILD-AzureStorage"
      description                                = "AOT-IMGBUILD-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-img-snet-01-address-range"
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
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "Deny-VNET-VNET"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4095" #Changed as per Standard rule
      name                                       = "DenyAllOutbound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      access                                     = "Deny"
      description                                = "DenyAllOutbound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
    }
  ]
}

nsg_subnet_mapping = {
  eit-uks-alz-ss-mgmt-nsg-01 = {
    eit-alz-ss-mgmt-snet-01 = true
  }
  eit-uks-alz-ss-ca-nsg-01 = {
    eit-alz-ss-ca-snet-01 = true
  }
  eit-uks-alz-ss-adds-nsg-01 = {
    eit-alz-ss-adds-snet-01 = true
  }
  eit-uks-alz-ss-wac-nsg-01 = {
    eit-alz-ss-wac-snet-01 = true
  }
  eit-uks-alz-ss-wsus-nsg-01 = {
    eit-alz-ss-wsus-snet-01 = true
  }
  eit-uks-alz-ss-audit-nsg-01 = {
    eit-alz-ss-audit-snet-01 = true
  }
  eit-alz-ss-snow-nsg-01 = {
    eit-alz-ss-snow-snet-01 = true
  }
  eit-alz-ss-snow-nsg-02 = {
    eit-alz-ss-snow-snet-02 = true
  }
  eit-alz-ss-ado-nsg-01 = {
    eit-alz-ss-ado-snet-01 = true
  }
  eit-alz-ss-afs-nsg-01 = {
    eit-alz-ss-afs-snet-01 = true
  }
  eit-uks-alz-ss-pep-nsg-01 = {
    eit-alz-ss-pep-snet-01 = true
  }
  eit-alz-alz-ss-imagebuild-nsg-01 = {
    eit-alz-ss-imagebuild-snet-01 = true
  }
}

################ Private endpoint ##################
laEndPointName           = "eituksalzssloga01-pe"
endPointLocation         = "UK South"
resourceGroupName        = "eit-uks-alz-ss-loga-rg"
laSubResourceName        = ["azuremonitor"]
laPrivateServiceConnName = "eit-uks-alz-ss-ampls-01"

saEndPointName           = "eituksalzssmgmtaa01-pe"
saSubResourceName        = ["DSCAndHybridWorker"]
saPrivateServiceConnName = "eit-uks-alz-ss-mgmt-aa-01"

################# AFS VM ##################
lzmanagementSsAFSRgName   = "eit-uks-alz-ss-afs-rg-01"
lzmanagementSsAFSVnetName = "eit-uks-alz-ss-mgmt-vnet-01"
AFSSubnetName             = "eit-alz-ss-afs-snet-01"
