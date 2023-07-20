environment = "Live"

#mgmths key vault
managementHsKvName   = "eitlzmanagementhsk"
managementHsKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-hs-mgmt-vnet-rg = {
    enable   = true
    location = "UK South"
    # tags = {
    #   environment = "High Secured Management"
    # }
  }
}

vnets = {
  eit-uks-alz-hs-mgmt-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-hs-mgmt-vnet-rg"
    addressSpace  = "mgmths-vnet-address-range"
    dnsServerList = "lz-ad-dc-ip1"
    subnets = {
      eit-alz-hs-mgmt-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-mgmt-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-hs-adds-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-adds-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-hs-wsus-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-wsus-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-hs-wac-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-wac-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-hs-ca-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-ca-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-hs-audit-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-audit-snet-01-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = false
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "eit-alz-hs-bastion-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      eit-alz-hs-afs-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-afs-snet-01-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      # eit-alz-hs-ado-snet-01 = {
      #    enable  = true
      #    address = "eit-alz-hs-ado-snet-01-address-range"
      #    enablePrivateLinkEndPoint = false
      #    enablePrivateLinkService = false
      # }

    }
  }
}

UDR = {
  eit-alz-alz-hs-mgmt-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-hs-mgmt-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-mgmt-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  },
  eit-alz-alz-hs-ad-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-alz-hs-ad-udr-01_d_Internet", "s_eit-alz-hs-ad-snet-d_eit-alz-t1int-snet-01", "s_eit-alz-hs-ad-snet-d_eit-alz-t1mgmt-snet-01", "s_eit-alz-hs-ad-snet-d_eit-alz-t2int-snet-01", "s_eit-alz-hs-ad-snet-d_eit-alz-t2mgmt-snet-01", "s_eit-alz-hs-ad-snet-d_eit-alz-transit-protected-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-ad-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  },
  eit-alz-alz-hs-wsus-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-hs-wsus-snet-d_Internet", "s_eit-alz-hs-wsus-snet-d_eit-alz-transit-protected-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-audit-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  },
  eit-alz-hs-wac-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-hs-wac-snet-d_Internet", "s_eit-alz-hs-wac-snet-d_transit-vnet", "s_eit-alz-hs-wac-snet-d_transit-vnet01"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-wac-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  },
  eit-alz-hs-pki-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-hs-ca-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-mgmt-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  },
  eit-alz-hs-audit-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-hs-audit-snet-d_Internet", "s_eit-alz-hs-audit-snet-d_eit-alz-transit-protected-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-audit-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  },
  eit-alz-hs-afs-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
    RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
    RouteNames            = ["s_eit-alz-hs-afs-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmths-afs-udr-prefixes"
    kv_secret_nexthopIP   = "mgmths-afs-udr-nexthop"
  }
  # eit-alz-hs-ado-udr-01 = {
  #   enable                = true
  #   VNetName              = "eit-uks-alz-hs-mgmt-vnet-01"
  #   RGName                = "eit-uks-alz-hs-mgmt-vnet-rg"
  #   RouteNames            = ["s_eit-alz-hs-ado-snet-01-d_Internet"]
  #   NextHopTypes          = ["VirtualAppliance"]
  #   kv_secret_udrprefixes = "mgmths-mgmt-udr-prefixes"
  #   kv_secret_nexthopIP   = "mgmths-mgmt-udr-nexthop"
  # },
}

UDR_Subnet_Mapping = {
  eit-alz-hs-wac-udr-01      = ["eit-alz-hs-wac-snet-01"]
  eit-alz-hs-audit-udr-01    = ["eit-alz-hs-audit-snet-01"]
  eit-alz-alz-hs-wsus-udr-01 = ["eit-alz-hs-wsus-snet-01"]
  eit-alz-alz-hs-mgmt-udr-01 = ["eit-alz-hs-mgmt-snet-01"]
  eit-alz-hs-pki-udr-01      = ["eit-alz-hs-ca-snet-01"]
  eit-alz-alz-hs-ad-udr-01   = ["eit-alz-hs-adds-snet-01"]
  eit-alz-hs-afs-udr-01      = ["eit-alz-hs-afs-snet-01"]
  # eit-alz-hs-ado-udr-01 = ["eit-alz-hs-ado-snet-01"]
}

################# NSG's #######################

asg_rg = {
  eit-uks-alz-hs-wac-asg   = "tst-asgs-sandpit"
  eit-uks-alz-hs-caweb-asg = "tst-asgs-sandpit"
  eit-uks-alz-hs-ica-asg   = "tst-asgs-sandpit"
  eit-uks-alz-hs-adds-asg  = "tst-asgs-sandpit"
}

nsg = {
  eit-uks-alz-hs-wac-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  eit-uks-alz-hs-adds-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  eit-alz-hs-wsus-snet-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  eit-uks-alz-hs-mgmt-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  eit-uks-alz-hs-audit-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  eit-uks-alz-hs-ca-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  eit-alz-hs-afs-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  }
  # eit-alz-hs-ado-nsg-01 = {
  #   enable   = true
  #   location = "UK South"
  #   rg       = "eit-uks-alz-hs-mgmt-vnet-rg"
  # }
}


nsgrules = {
  eit-uks-alz-hs-wac-nsg-01 = [
    {
      direction                                  = "Inbound" // Added
      priority                                   = "400"
      name                                       = "AIA-ADDS-WAC"
      description                                = "AIA-ADDS-WAC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "450"
      name                                       = "AIT-WAC-WAC"
      description                                = "AIT-WAC-WAC"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-WAC"
      description                                = "AIT-AFS-WAC"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "510" // 400 changed
      name                                       = "AIA-AD-ASG-WAC"
      description                                = "AIA-AD-ASG-WAC"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "520" // 450 changed
      name                                       = "AIA-BLUESMB-WAC"
      description                                = "AIA-BLUESMB-WAC"
      destination_port_range                     = "445,139,135,137"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-wac-asg"
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "530" // 500 changed
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
      destination_application_security_group_ids = "eit-uks-alz-hs-wac-asg"
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
      destination_application_security_group_ids = "eit-uks-alz-hs-wac-asg"
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
      source_address_prefix                      = "eit-alz-hs-bwac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-WAC"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
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
      name                                       = "AIA-SECGOV-MID-WAC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
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
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
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
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-WAC"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny-VNET_VNET chnaged
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
      direction                                  = "Inbound" // Added
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
      direction                                  = "Outbound" // Added
      priority                                   = "400"
      name                                       = "AOA-WAC-ADDS"
      description                                = "AOA-WAC-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "410" // 400 changed
      name                                       = "AOA-WAC-AD-ASG"
      description                                = "AOA-WAC-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "420" // 450 changed
      name                                       = "AOT-WACGW-LOGAPE"
      description                                = "AOT-WACGW-LOGAPE"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "430" // 500 changed
      name                                       = "AOA-WACGW-MGMTVMS-RDP"
      description                                = "AOA-WACGW-MGMTVMS-RDP"
      destination_port_range                     = "445,3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = "eit-uks-alz-hs-wac-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "440" // 550 changed
      name                                       = "AOT-WACGW-Internet"
      description                                = "AOT-WACGW-Internet"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "450"
      name                                       = "AOT-WAC-LOGA"
      description                                = "AOT-WAC-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "460" // 600 changed
      name                                       = "AOT-WAC_WSUS"
      description                                = "AOT-WAC_WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-hs-wac-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-WAC-WSUS"
      description                                = "AOT-WAC-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-WAC-TENABLEAGENT"
      description                                = "AOT-WAC-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-WAC-LINUXUPDATES"
      description                                = "AOT-WAC-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "3000" // 2000 changed
      name                                       = "AOT-WAC-AZUREAGENT"
      description                                = "AOT-WAC-AZUREAGENT"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" // 2100 changed
      name                                       = "AOT-WAC-AZURECLOUD"
      description                                = "AOT-WAC-AZURECLOUD"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "3100" // 2200 changed
      name                                       = "AOT-WAC-KMS"
      description                                = "AOT-WAC-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "2400"
      name                                       = "AOT-WAC_Storage"
      description                                = "AOT-WAC_Storage"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
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
      priority                                   = "4050"          // 4000 changed
      name                                       = "DOA-VNET_VNET" // Deny-VNET-VNET changed
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
      direction                                  = "Outbound" // added
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-hs-adds-nsg-01 = [
    {
      direction                                  = "Inbound" // updated
      priority                                   = "400"
      name                                       = "AIA-ADDS-ADDS"
      description                                = "AIA-ADDS-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "450"
      name                                       = "AIT-WAC-ADDS"
      description                                = "AIT-WAC-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-ADDS"
      description                                = "AIT-AFS-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "520" // 450 changed
      name                                       = "AIT-WACGW-ASG-ADDS-ASG"
      description                                = "AIT-WACGW-ASG-ADDS-ASG"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "540" // 500 changed
      name                                       = "AIT-VNET_ADDS"
      description                                = "AIT-VNET_ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-BASTION-ADDS-ASG"
      description                                = "AIT-BASTION-ADDS-ASG"
      destination_port_range                     = "3389"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-bwac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-adds-snet-01-address-range"
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
      name                                       = "DIA-VNET-VNET" //Deny-VNET_VNET changed
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
      direction                                  = "Inbound" // Added
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
      priority                                   = "400"
      name                                       = "AOA-ADDS-ADDS" // AOA-AD-AD-Replication
      description                                = "AOA-ADDS-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      priority                                   = "410" // 500 changed
      name                                       = "AOT-ADDS_VNET"
      description                                = "AOT-ADDS_VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "420" // 550 changed
      name                                       = "AOT-ADDS_WSUS"
      description                                = "AOT-ADDS_WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-ADDS-LOGA"
      description                                = "AOT-ADDS-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-ADDS-WSUS"
      description                                = "AOT-ADDS-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-ADDS-TENABLEAGENT"
      description                                = "AOT-ADDS-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-ADDS-LINUXUPDATES"
      description                                = "AOT-ADDS-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      priority                                   = "3000" // 2000 changed
      name                                       = "AOT-ADDS-AZUREAGENT"
      description                                = "AOT-ADDS-AZUREAGENT"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2100" // 2100 changed
      name                                       = "AOT-ADDS-AZURECLOUD"
      description                                = "AOT-ADDS-AZURECLOUD"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      priority                                   = "3100" // 2200 changed
      name                                       = "AOT-ADDS-KMS"
      description                                = "AOT-ADDS-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      priority                                   = "2300"
      name                                       = "AOT-ADDS_Storage"
      description                                = "AOT-ADDS_Storage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      priority                                   = "2400"
      name                                       = "AOT-ADDS_AzureBackup"
      description                                = "AOT-ADDS_AzureBackup"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" // 4000 changed
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
      direction                                  = "Outbound" // added
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-alz-hs-wsus-snet-01 = [
    {
      direction                                  = "Inbound" // Added
      priority                                   = "400"
      name                                       = "AIA-ADDS-WSUS"
      description                                = "AIA-ADDS-WSUS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "450"
      name                                       = "AIT-WAC-WSUS"
      description                                = "AIT-WAC-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-WSUS"
      description                                = "AIT-AFS-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "510" // 400 changed
      name                                       = "AIT-ADDS-ASG-WSUS"
      description                                = "AIT-ADDS-ASG-WSUS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-WACGW-ASG-WSUS"
      description                                = "AIT-WACGW-ASG-WSUS"
      destination_port_range                     = "445,3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-hs-wac-asg"
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
      source_address_prefix                      = "eit-alz-hs-bwac-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
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
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
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
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
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
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
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
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
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
      name                                       = "DIA-VNET-VNET" //Deny-VNET_VNET changed
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
      direction                                  = "Inbound" // Added
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
      direction                                  = "Outbound" // Added
      priority                                   = "400"
      name                                       = "AOA-WSUS-ADDS"
      description                                = "AOA-WSUS-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
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
      priority                                   = "410" // 400 changed
      name                                       = "AOA-WSUS-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
      access                                     = "Allow"
      description                                = "AOA-WSUS-AD-ASG"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "420" // 500 changed
      name                                       = "AOT-VNET_Internet"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-VNET_Internet"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430" //550 changed
      name                                       = "AOT-WSUS_VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "8530-8531"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WSUS_VNET"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "440" // 600 changed
      name                                       = "AOT-WAC_WACGW"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "10.216.1.70,10.216.1.69,10.216.1.68" // hardcoded as this is a Azure public address
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WAC_WACGW"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-WSUS-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WSUS-LOGA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-WSUS-WSUS"
      description                                = "AOT-WSUS-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-WSUS-TENABLEAGENT"
      description                                = "AOT-WSUS-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-WSUS-LINUXUPDATES"
      description                                = "AOT-WSUS-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
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
      priority                                   = "3000" // 2000 changed
      name                                       = "AOT-WSUS-AZUREAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WSUS-AZUREAGENT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction = "Outbound"
      priority  = "2200"
      name      = "AOT-WSUS_AzureStorage"
      protocol  = "tcp"
      # destination_port_range     = "135,49152-65535"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WSUS_AzureStorage"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "3050"
      name                                       = "AOT-WSUS-AZURECLOUD"
      description                                = "AOT-WSUS-AZURECLOUD"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
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
      priority                                   = "3100" // 2300 changed
      name                                       = "AOT-WSUS-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WSUS-KMS"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2400"
      name                                       = "AOT-WSUS-WAC"
      protocol                                   = "*"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "10.216.1.68" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-WSUS-WAC"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" // 4000 changed
      name                                       = "DOA-VNET_VNET"
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
      direction                                  = "Outbound" // added
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-hs-mgmt-nsg-01 = [
    {
      direction                                  = "Inbound" // Added
      priority                                   = "400"
      name                                       = "AIA-ADDS-MGMT"
      description                                = "AIA-ADDS-MGMT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "450"
      name                                       = "AIT-WAC-MGMT"
      description                                = "AIT-WAC-MGMT"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-MGMT"
      description                                = "AIT-AFS-MGMT"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-MGMT"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-MGMT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-MGMT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
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
      name                                       = "AIA-SECGOV-TENABLE-MGMT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
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
      name                                       = "AIA-SECGOV-PENTEST-MGMT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-snet-01-address-range"
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
      name                                       = "DIA-VNET-VNET" // Deny-VNET-VNET changed
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
      direction                                  = "Inbound" // Added
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
      direction                                  = "Outbound" // Added
      priority                                   = "400"
      name                                       = "AOA-MGMT-ADDS"
      description                                = "AOA-MGMT-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "450"
      name                                       = "AOT-MGMT-LOGA"
      description                                = "AOT-MGMT-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-MGMT-WSUS"
      description                                = "AOT-MGMT-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range" // will change
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-MGMT-TENABLEAGENT"
      description                                = "AOT-MGMT-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-MGMT-LINUXUPDATES"
      description                                = "AOT-MGMT-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
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
      priority                                   = "3000"
      name                                       = "AOT-MGMT-AZUREAGENT"
      description                                = "AOT-MGMT-AZUREAGENT"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range" // need to verify the address range
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "3050"
      name                                       = "AOT-MGMT-AZURECLOUD"
      description                                = "AOT-MGMT-AZURECLOUD"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "3100"
      name                                       = "AOT-MGMT-KMS"
      description                                = "AOT-MGMT-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "4050"
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
      direction                                  = "Outbound" // added
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-hs-audit-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "510" // 400 changed
      name                                       = "AIT-VNET-LOGA"
      description                                = "AIT-VNET-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "520" // 450 changed
      name                                       = "AIT-WACGW-AD-RDP"
      description                                = "AIT-WACGW-AD-RDP"
      destination_port_range                     = "3389,5985"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      priority                                   = "530" // 500 changed
      name                                       = "AIT-transit-VNET-LOGA"
      description                                = "AIT-transit-VNET-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-AUDIT"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-AUDIT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-AUDIT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-AUDIT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-AUDIT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-AUDIT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-AUDIT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-AUDIT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny-VNET_VNET changed
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
      direction                                  = "Inbound" // Added
      priority                                   = "400"
      name                                       = "AIA-ADDS-AUDIT"
      description                                = "AIA-ADDS-AUDIT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "450"
      name                                       = "AIT-WAC-AUDIT"
      description                                = "AIT-WAC-AUDIT"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-AUDIT"
      description                                = "AIT-AFS-AUDIT"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
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
      priority                                   = "3000" // 2000 changed
      name                                       = "AOT-AUDIT-AZUREAGENT"
      description                                = "AOT-AUDIT-AZUREAGENT"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2200"
      name                                       = "AOT-Audit_AzureStorage"
      description                                = "AOT-Audit_AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
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
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET" // Deny_Internet changed
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
      direction                                  = "Outbound" // added
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // Added
      priority                                   = "400"
      name                                       = "AOA-AUDIT-ADDS"
      description                                = "AOA-AUDIT-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "450"
      name                                       = "AOT-AUDIT-LOGA"
      description                                = "AOT-AUDIT-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-AUDIT-WSUS"
      description                                = "AOT-AUDIT-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-AUDIT-TENABLEAGENT"
      description                                = "AOT-AUDIT-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-AUDIT-LINUXUPDATES"
      description                                = "AOT-AUDIT-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
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
      priority                                   = "3050"
      name                                       = "AOT-AUDIT-AZURECLOUD"
      description                                = "AOT-AUDIT-AZURECLOUD"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
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
      name                                       = "AOT-AUDIT-KMS"
      description                                = "AOT-AUDIT-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
  ]
  eit-uks-alz-hs-ca-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "410" // 400 changed
      name                                       = "AIT-PKI-CAWEB-ICA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,135,443,445,49152-65535"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-PKI-CAWEB-ICA"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "425"
      name                                       = "AIT-ICA-ASG-RCA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_application_security_group_ids      = "eit-uks-alz-hs-ica-asg"
      destination_application_security_group_ids = ""
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ica-src-dst-prefix"
      access                                     = "Allow"
      description                                = "AIT-ICA-ASG-RCA"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "430" // 450 changed
      name                                       = "AIT-PKI-VNET-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hs-ca-nsg-common-01"
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-PKI-VNET-CAWEB"
      fetch_from_kv                              = ["source_address_prefixes"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "440" // 500 changed
      name                                       = "AIA-AD-ASG-CAWEB-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
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
      source_application_security_group_ids      = "eit-uks-alz-hs-adds-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-ica-asg"
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
      source_address_prefix                      = "eit-alz-hs-bwac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
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
      source_address_prefix                      = "eit-alz-hs-bwac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-ica-asg"
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
      source_address_prefix                      = "eit-alz-hs-bwac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "10.216.1.100,10.216.1.105" //hard coded as they are azure public addresses
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-BASTION-ROOTCA"
      fetch_from_kv                              = ["source_address_prefix"]
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
      source_application_security_group_ids      = "eit-uks-alz-hs-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-WAC-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "675"
      name                                       = "AIT-WAC-ASG-ICA-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-WAC-ASG-ICA-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-CAWEB-ASG-CAWEB-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "445,135,49152-65535"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-CAWEB-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "725"
      name                                       = "AIT-RCA-CAWEB-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hs-ca-nsg-01-bst-dst-prefix02"
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-RCA-CAWEB-ASG"
      fetch_from_kv                              = ["source_address_prefixes"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "651"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-CA"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
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
      name                                       = "AIA-SECGOV-MID-CA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
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
      name                                       = "AIA-SECGOV-TENABLE-CA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
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
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-CA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny-VNET_VNET changed
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
      direction                                  = "Inbound" // Added
      priority                                   = "400"
      name                                       = "AIA-ADDS-CA"
      description                                = "AIA-ADDS-CA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "450"
      name                                       = "AIT-WAC-CA"
      description                                = "AIT-WAC-CA"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-CA"
      description                                = "AIT-AFS-CA"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ca-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
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
      priority                                   = "410" // 400 changed
      name                                       = "AOT-PKI-ICA-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-ica-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AOT-PKI-ICA-CAWEB"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "420" // 450 changed
      name                                       = "AOT-CAWEB-LOGAPE"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CAWEB-LOGAPE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430" // 500 changed
      name                                       = "AOT-ICA-RCA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ica-src-dst-prefix"
      source_application_security_group_ids      = "eit-uks-alz-hs-ica-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ICA-RCA"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "440" // 550 changed
      name                                       = "AOA-CAWEB-ASG-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
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
      source_application_security_group_ids      = "eit-uks-alz-hs-ica-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-adds-asg"
      access                                     = "Allow"
      description                                = "AOA-ICA-ASG-AD-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "460" // 600 changed
      name                                       = "AOT-RCA-CAWEB-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hs-ca-nsg-01-bst-dst-prefix02"
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AOT-RCA-CAWEB-ASG"
      fetch_from_kv                              = ["source_address_prefixes"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "625"
      name                                       = "AOT-CAWEB-ASG-ICA-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "135,49152-65535"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-ica-asg"
      access                                     = "Allow"
      description                                = "AOT-CAWEB-ASG-ICA-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOT-CAWEB-ASG-CAWEB-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "445,135,49152-65535"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-hs-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-hs-caweb-asg"
      access                                     = "Allow"
      description                                = "AOT-CAWEB-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"              // 2000 changed
      name                                       = "AOT-CA-AZUREAGENT" //AOT-PKI_AzureAgent changed
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CA-AZUREAGENT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"              // 2100 changed
      name                                       = "AOT-CA-AZURECLOUD" // AOT-PKI_AzureCloud changed
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CA-AZURECLOUD"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"       // 2200 changed
      name                                       = "AOT-CA-KMS" // AOT-PKI_KMS changed
      protocol                                   = "tcp"
      destination_port_range                     = "1688,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CA-KMS"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-PKI_WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2400"
      name                                       = "AOT-PKI_AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
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
      priority                                   = "4050"          // 4000 changed
      name                                       = "DOA-VNET_VNET" // Deny-VNET-VNET changed
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
      direction                                  = "Outbound" // Added
      priority                                   = "400"
      name                                       = "AOA-CA-ADDS"
      description                                = "AOA-CA-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "450"
      name                                       = "AOT-CA-LOGA"
      description                                = "AOT-CA-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "500"
      name                                       = "AOT-CA-WSUS"
      description                                = "AOT-CA-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-CA-TENABLEAGENT"
      description                                = "AOT-CA-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-CA-LINUXUPDATES"
      description                                = "AOT-CA-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ca-snet-01-address-range"
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-alz-hs-afs-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-AFS"
      description                                = "AIA-ADDS-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-adds-snet-01-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-AFS"
      description                                = "AIT-WAC-AFS"
      destination_port_range                     = "3389,5985"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "510" // 500 changed
      name                                       = "AIT-VNET-AFS"
      description                                = "AIT-VNET-AFS"
      destination_port_range                     = "445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ait-vnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // Added
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-afs-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-AFS" // AIT-HSADO-SNOW changed
      description                                = "AIT-ADO-AFS"
      destination_port_range                     = "443,445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-AFS"
      description                                = "AIA-SECGOV-MID-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-AFS"
      description                                = "AIA-SECGOV-TENABLE-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hstenable-subnet-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-AFS"
      description                                = "AIA-SECGOV-PENTEST-AFS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-hspentest-subnet-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" //Deny-VNET-VNET changed
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
      direction                                  = "Inbound" // Added
      priority                                   = "500"
      name                                       = "AIT-AFS-AFS"
      description                                = "AIT-AFS-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      direction                                  = "Inbound" // Added
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
      priority                                   = "400"
      name                                       = "AOA-AFS-ADDS"
      description                                = "AOA-AFS-ADDS"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      name                                       = "AOT-AFS-LOGA"
      description                                = "AOT-AFS-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      protocol                                   = "udp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      priority                                   = "3000" // 2100 changed
      name                                       = "AOT-AFS-AZUREAGENT"
      description                                = "AOT-AFS-AZUREAGENT"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wac-snet-02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" // 2200 changed
      name                                       = "AOT-AFS-AZURECLOUD"
      description                                = "AOT-AFS-AZURECLOUD"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      priority                                   = "4050"          // 4000 changed
      name                                       = "DOA-VNET_VNET" // Deny-VNET_VNET changed
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
      direction                                  = "Outbound" // added
      priority                                   = "550"
      name                                       = "AOT-AFS-TENABLEAGENT"
      description                                = "AOT-AFS-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mgmt-onprem-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "600"
      name                                       = "AOT-AFS-LINUXUPDATES"
      description                                = "AOT-AFS-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      priority                                   = "3100"
      name                                       = "AOT-AFS-KMS"
      description                                = "AOT-AFS-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
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
      direction                                  = "Outbound" // added
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
      description                                = "DOA-VNET_INTERNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]

  # eit-alz-hs-ado-nsg-01 = [
  #   {
  #     direction                                  = "Inbound"
  #     priority                                   = "400"
  #     name                                       = "AIT-WAC-ADO"
  #     protocol                                   = "tcp"
  #     destination_port_range                     = "22"
  #     source_port_range                          = "*"
  #     source_address_prefix                      = "eit-alz-hs-wac-snet-01-address-range"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix                 = "eit-alz-hs-ado-snet-01-address-range"
  #     source_application_security_group_ids      = ""
  #     destination_application_security_group_ids = ""
  #     access                                     = "Allow"
  #     description                                = "AIT-WAC-ADO"
  #     fetch_from_kv                              = []
  #     fetch_from_asg                             = ["source_address_prefix", "destination_address_prefix"]
  #   },
  #   {
  #     direction                             = "Inbound"
  #     priority                              = "800"
  #     name                                  = "AIA-SECGOV-HSMID-ADO"
  #     protocol                              = "*"
  #     destination_port_range                = "*"
  #     source_port_range                     = "*"
  #     source_application_security_group_ids = ""
  #     destination_application_security_group_ids = ""
  #     source_address_prefix      = "eit-alz-hs-mid-ado-address-range"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix            = "eit-alz-hs-ado-snet-01-address-range"
  #     access                                = "Allow"
  #     description                           = "AIA-SECGOV-HSMID-ADO"
  #     fetch_from_kv                         = ["source_address_prefix", "destination_address_prefix"]
  #     fetch_from_asg                        = []
  #   },
  #   {
  #     direction                                  = "Inbound"
  #     priority                                   = "850"
  #     name                                       = "AIA-SECGOV-HSTENABLE-ADO"
  #     protocol                                   = "*"
  #     destination_port_range                     = "*"
  #     source_port_range                          = "*"
  #     source_address_prefix                      = ""
  #     source_address_prefixes    = "eit-alz-hs-tenable-ado-address-range"
  #     destination_address_prefix = "eit-alz-hs-ado-snet-01-address-range"
  #     destination_address_prefixes = ""
  #     source_application_security_group_ids      = ""
  #     destination_application_security_group_ids = ""
  #     access                                     = "Allow"
  #     description                                = "AIA-SECGOV-HSTENABLE-ADO"
  #     fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
  #     fetch_from_asg                             = []
  #   },
  #   {
  #     direction                             = "Inbound"
  #     priority                              = "900"
  #     name                                  = "AIA-SECGOV-HSPENTEST-ADO"
  #     protocol                              = "*"
  #     destination_port_range                = "*"
  #     source_port_range                     = "*"
  #     source_application_security_group_ids = ""
  #     destination_application_security_group_ids = ""
  #     source_address_prefix      = "eit-alz-hs-pentest-ado-address-range"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix            = "eit-alz-hs-ado-snet-01-address-range"
  #     access                                = "Allow"
  #     description                           = "AIA-SECGOV-HSPENTEST-ADO"
  #     fetch_from_kv                         = ["source_address_prefix", "destination_address_prefix"]
  #     fetch_from_asg                        = []
  #   },
  #   {
  #     direction                  = "Inbound"
  #     priority                   = "4000"
  #     name                       = "Deny-VNET_VNET"
  #     description                = "Deny-VNET_VNET"
  #     destination_port_range     = "*"
  #     protocol                   = "*"
  #     source_port_range          = "*"
  #     source_address_prefix      = "VirtualNetwork"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix = "VirtualNetwork"
  #     source_application_security_group_ids      = ""
  #     destination_application_security_group_ids = ""
  #     access                     = "Deny"
  #     fetch_from_kv              = []
  #     fetch_from_asg             = []
  #   },
  #   {
  #     direction                  = "Outbound"
  #     priority                   = "400"
  #     name                       = "AOT-ADO-HS_VNET"
  #     protocol                   = "tcp"
  #     destination_port_range     = "443"
  #     source_port_range          = "*"
  #     source_address_prefix      = "eit-alz-hs-ado-snet-01-address-range"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix = "eit-alz-hs-ado-vnet-address-range"
  #     source_application_security_group_ids      = ""
  #     destination_application_security_group_ids = ""
  #     access                     = "Allow"
  #     description                = "AOT-ADO-HS_VNET"
  #     fetch_from_kv              = ["source_address_prefix", "destination_address_prefix"]
  #     fetch_from_asg             = []
  #   },
  #   {
  #     direction                  = "Outbound"
  #     priority                   = "450"
  #     name                       = "AOT-ADO-Internet"
  #     protocol                   = "tcp"
  #     destination_port_range     = "80,443,22"
  #     source_port_range          = "*"
  #     source_address_prefix      = "eit-alz-hs-ado-snet-01-address-range"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix = "Internet"
  #     source_application_security_group_ids      = ""
  #     destination_application_security_group_ids = ""
  #     access                     = "Allow"
  #     description                = "AOT-ADO-Internet"
  #     fetch_from_kv              = ["source_address_prefix"]
  #     fetch_from_asg             = []
  #   },
  #   {
  #     direction                  = "Outbound"
  #     priority                   = "4000"
  #     name                       = "DOA-VNET_VNET"
  #     protocol                   = "*"
  #     destination_port_range     = "*"
  #     source_port_range          = "*"
  #     source_address_prefix      = "VirtualNetwork"
  #     source_address_prefixes    = ""
  #     destination_address_prefixes = ""
  #     destination_address_prefix = "VirtualNetwork"
  #     source_application_security_group_ids      = ""
  #     destination_application_security_group_ids = ""
  #     access                     = "Deny"
  #     description                = "DOA-VNET_VNET"
  #     fetch_from_kv              = []
  #     fetch_from_asg             = []
  #   },
  # ]
  #}
}

nsg_subnet_mapping = {
  eit-uks-alz-hs-wac-nsg-01 = {
    eit-alz-hs-wac-snet-01 = true
  }
  eit-uks-alz-hs-adds-nsg-01 = {
    eit-alz-hs-adds-snet-01 = true
  }
  eit-alz-hs-wsus-snet-01 = {
    eit-alz-hs-wsus-snet-01 = true
  }
  eit-uks-alz-hs-mgmt-nsg-01 = {
    eit-alz-hs-mgmt-snet-01 = true
  }
  eit-uks-alz-hs-audit-nsg-01 = {
    eit-alz-hs-audit-snet-01 = true
  }
  eit-uks-alz-hs-ca-nsg-01 = {
    eit-alz-hs-ca-snet-01 = true
  }
  eit-alz-hs-afs-nsg-01 = {
    eit-alz-hs-afs-snet-01 = true
  }
  # eit-alz-hs-ado-nsg-01 = {
  #   eit-alz-hs-ado-snet-01 = true
  # }
}
