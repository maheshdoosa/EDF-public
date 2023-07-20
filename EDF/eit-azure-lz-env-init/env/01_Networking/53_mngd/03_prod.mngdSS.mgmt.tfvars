environment = "Production"

#mgmtss key vault
mngdssKvName   = "avmgenprdssmngdsub01kv"
mngdssKvRgName = ".security"

###########################################################################

rgs = {
  gen-uks-prd-ss-managed-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
  gen-uks-prd-ss-epn-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
  gen-uks-prd-ss-com-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  gen-uks-prd-ss-managed-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-ss-managed-vnet-rg-01"
    addressSpace  = "mngdss-prd-vnet-address-range" //key vault secret name as value
    dnsServerList = "mngdss-prd-dns-ips"            //key vault secret name as value
    subnets = {
      gen-uks-prd-ss-ams-snet-01 = {
        enable                    = true
        address                   = "mngdSS-prd-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-ss-epn-snet-01 = {
        enable                    = true
        address                   = "mngdss-prd-epn-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-ss-com-snet-01 = {
        enable                    = true
        address                   = "mngdss-prd-cominod-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-ss-pep-snet-01 = {
        enable                    = true
        address                   = "mngdss-prd-pep-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-ss-managed-vnet-01"
    peer2name = "gen-uks-prd-ss-managed-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"       //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"       //hub network
    vnet2rg   = "gen-uks-prd-ss-managed-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-prd-ss-managed-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01" //spoke network
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


UDR = {
  gen-uks-prd-ss-ams-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-ss-emerson-snet-01-d_On-Prem-Internet", "s_gen-uks-prd-ss-emerson-snet-01-d_eit-alz-ss-adds-snet-01", "s_gen-uks-prd-ss-ams-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-ss-managed-vnet-01"
    RGName                = "gen-uks-prd-ss-managed-vnet-rg-01"
    kv_secret_udrprefixes = "mngdss-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "mngdss-prd-udr-nexthop"  //key vault secret name as value
  }
  gen-uks-prd-ss-epn-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-ss-epn-snet-01-d_On-Prem-Internet", "s_gen-uks-prd-ss-epn-snet-01-d_eit-alz-ss-adds-snet-01", "s_gen-uks-prd-ss-epn-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-ss-managed-vnet-01"
    RGName                = "gen-uks-prd-ss-managed-vnet-rg-01"
    kv_secret_udrprefixes = "epn-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "epn-udr-nexthop"  //key vault secret name as value
  }
  gen-uks-prd-ss-com-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-ss-com-snet-01-d_On-Prem-Internet", "s_gen-uks-prd-ss-com-snet-01-d_eit-alz-ss-adds-snet-01", "s_gen-uks-prd-ss-com-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-ss-managed-vnet-01"
    RGName                = "gen-uks-prd-ss-managed-vnet-rg-01"
    kv_secret_udrprefixes = "com-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "com-udr-nexthop"  //key vault secret name as value
  }
  gen-uks-prd-ss-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-ss-pep-snet-01-d_eit-alz-ss-adds-snet-01", "s_gen-uks-prd-ss-pep-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-ss-managed-vnet-01"
    RGName                = "gen-uks-prd-ss-managed-vnet-rg-01"
    kv_secret_udrprefixes = "pep-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "pep-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-prd-ss-ams-udr-01 = ["gen-uks-prd-ss-ams-snet-01"]
  gen-uks-prd-ss-epn-udr-01 = ["gen-uks-prd-ss-epn-snet-01"]
  gen-uks-prd-ss-com-udr-01 = ["gen-uks-prd-ss-com-snet-01"]
  gen-uks-prd-ss-pep-udr-01 = ["gen-uks-prd-ss-pep-snet-01"]
}


nsg = {
  gen-uks-prd-ss-ams-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-ss-managed-vnet-rg-01"
  },
  gen-uks-prd-ss-epn-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-ss-epn-rg-01"
  },
  gen-uks-prd-ss-com-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-ss-com-rg-01"
  },
  gen-uks-prd-ss-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-prd-ss-managed-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-prd-ss-ams-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-AMSMANGER-ANY"
      description                                = "AIA-ADDS-AMSMANGER-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-AMSMANGER"
      description                                = "AIT-WAC-AMSMANGER"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Updated_as_standard
      priority                                   = "500"
      name                                       = "AIT-AFS-AMSMANGER"
      description                                = "AIT-AFS-AMSMANGER"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
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
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"
      name                                       = "AIT-ADO-AMS"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-AMS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-AMS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-AMS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-AMS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-AMS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-AMS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-SSPENTEST-AMS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET"
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
      direction                                  = "Inbound"
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
      name                                       = "AOA-AMSMANAGER-ADDS"
      description                                = "AOA-AMSMANAGER-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-AMSMANAGER-LOGA"
      description                                = "AOT-AMSMANAGER-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-loga-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-AMSMANAGER-WSUS"
      description                                = "AOT-AMSMANAGER-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-wsus-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-AMSMANAGER-TENABLEAGENT"
      description                                = "AOT-AMSMANAGER-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
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
      priority                                   = "2300"
      name                                       = "AOT-AMSMANAGER-AzureStorage"
      description                                = "AOT-AMSMANAGER-AzureStorage"
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
      priority                                   = "3000"
      name                                       = "AOT-AMSMANAGER-AzureAgent-443"
      description                                = "AOT-AMSMANAGER-AzureAgent-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-AMSMANAGER-AzureCloud-443"
      description                                = "AOT-AMSMANAGER-AzureCloud-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-AMSMANAGER-KMS"
      description                                = "AOT-AMSMANAGER-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
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
      direction                                  = "Inbound" // updated
      priority                                   = "980"
      name                                       = "AIA-ONPREMICMP-AMSMANGER"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ONPREMICMP-AMSMANGER"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "990"
      name                                       = "AIA-Onprem-AMSMANGER"
      protocol                                   = "TCP"
      destination_port_range                     = "10045,10047,10052,10077,20020"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-Onprem-AMSMANGER"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "950"
      name                                       = "AIA-Onprem-FILESHARE-AMS"
      protocol                                   = "TCP"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdSS-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-Onprem-FILESHARE-AMS"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-AMSMANGER-LINUXUPDATES"
      description                                = "AOT-AMSMANGER-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
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
      priority                                   = "650"
      name                                       = "AOT-AMS-NTP"
      description                                = "AOT-AMS-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
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
      name                                       = "AOT-AMS-PEP"
      description                                = "AOT-AMS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdSS-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-ss-epn-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-EPONA-ANY"
      description                                = "AIA-ADDS-EPONA-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-adds-01-address-range" //exist
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range" //created
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-EPONA"
      description                                = "AIT-WAC-EPONA"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-wac-01-address-range" //exist
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-EPONA"
      description                                = "AIT-AFS-EPONA"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-JUMPHOST-EPONA"
      description                                = "AIT-JUMPHOST-EPONA"
      protocol                                   = "tcp"
      destination_port_range                     = "3389" //need to confirm
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-jumphost-epona-address-range" //need to confirm
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-EPONA"
      description                                = "AIT-ADO-EPONA"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range" //exist
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-EPONA"
      description                                = "AIA-SECGOV-MID-EPONA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range" //exist
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-EPONA"
      description                                = "AIA-SECGOV-TENABLE-EPONA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range" // exist
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-EPONA"
      description                                = "AIA-SECGOV-PENTEST-EPONA"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range" //exist
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-epona-subnet-address-range"
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
      direction                                  = "Inbound"
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
      name                                       = "AOA-EPONA-ADDS"
      description                                = "AOA-EPONA-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-adds-01-address-range" //exist
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-EPONA-LOGA"
      description                                = "AOT-EPONA-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-loga-01-address-range" //exist
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-EPONA-WSUS"
      description                                = "AOT-EPONA-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-wsus-01-address-range" //exist
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "651" // updated
      name                                       = "AOT-EPONA-SHAREPOINT"
      description                                = "AOT-EPONA-SHAREPOINT"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet" //need to confim
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-EPONA-AZUREAGENT-443"
      description                                = "AOT-EPONA-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-EPONA-AzureCloud-443"
      description                                = "AOT-EPONA-AzureCloud-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-EPONA-KMS"
      description                                = "AOT-EPONA-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-EPONA-AzureStorage"
      description                                = "AOT-EPONA-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
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
      priority                                   = "4050" // updated
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
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
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-EPONA-TENABLEAGENT"
      description                                = "AOT-EPONA-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
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
      name                                       = "AOT-EPONA-LINUXUPDATES"
      description                                = "AOT-EPONA-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
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
      priority                                   = "650"
      name                                       = "AOT-EPONA-NTP"
      description                                = "AOT-EPONA-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epona-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
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
      name                                       = "AOT-EPN-PEP"
      description                                = "AOT-EPN-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epn-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-ss-com-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-COMINOD"
      description                                = "AIA-ADDS-COMINOD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-COMINOD"
      description                                = "AIT-WAC-COMINOD"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-COMINOD"
      description                                = "AIT-AFS-COMINOD"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-JUMPHOST-COMINOD"
      description                                = "AIT-JUMPHOST-COMINOD"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-jumphost-ams-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-SSADO-COMINOD"
      description                                = "AIT-SSADO-COMINOD"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-SSMID-COMINOD"
      description                                = "AIA-SECGOV-SSMID-COMINOD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-SSTENABLE-COMINOD"
      description                                = "AIA-SECGOV-SSTENABLE-COMINOD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-SSPENTEST-COMINOD"
      description                                = "AIA-SECGOV-SSPENTEST-COMINOD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-cominod-subnet-address-range"
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
      direction                                  = "Inbound"
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
      name                                       = "AOA-COMINOD-ADDS"
      description                                = "AOA-COMINOD-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-COMINOD-LOGA"
      description                                = "AOT-COMINOD-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-loga-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-COMINOD-WSUS"
      description                                = "AOT-COMINOD-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-mgmt-wsus-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-COMINOD-TENABLEAGENT"
      description                                = "AOT-COMINOD-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-sstenable-nessus-agent-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AOT-COMINOD-SHAREPOINT"
      description                                = "AOT-COMINOD-SHAREPOINT"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
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
      priority                                   = "3000"
      name                                       = "AOT-COMINOD-AZUREAGENT"
      description                                = "AOT-COMINOD-AZUREAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "azure-agent-traffic-public-ip" //Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-COMINOD-AzureCloud"
      description                                = "AOT-COMINOD-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
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
      name                                       = "AOT-COMINOD-KMS"
      description                                = "AOT-COMINOD-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "kms-traffic-to-microsoft-services-public-ip"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-COMINOD-AzureStorage"
      description                                = "AOT-COMINOD-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
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
      priority                                   = "4050" // updated
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
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
      name                                       = "AOT-COMINOD-NTP"
      description                                = "AOT-COMINOD-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-linux-ntp-service-address-ranges"
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
      name                                       = "AOT-COM-PEP"
      description                                = "AOT-COM-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-cominod-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-prd-ss-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AOA-ADDS-PEP"
      description                                = "AOA-ADDS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-AUDIT-PEP"
      description                                = "AIT-AUDIT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prdss-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-pep-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-peppentest-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "910"
      name                                       = "AIT-AMS-PEP"
      description                                = "AIT-AMS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-pepams-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "920"
      name                                       = "AIT-EPN-PEP"
      description                                = "AIT-EPN-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-epn-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "930"
      name                                       = "AIT-COM-PEP"
      description                                = "AIT-COM-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-pepcom-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdss-prd-pep-subnet-address-range"
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
      direction                                  = "Inbound"
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
      priority                                   = "550"
      name                                       = "AOA-PEP-TENABLEAGENT"
      description                                = "AOA-PEP-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-pepteneable-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdss-prd-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage" //public address
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
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
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
    }
  ]
}

nsg_subnet_mapping = {
  gen-uks-prd-ss-ams-nsg-01 = {
    gen-uks-prd-ss-ams-snet-01 = true
  },
  gen-uks-prd-ss-epn-nsg-01 = {
    gen-uks-prd-ss-epn-snet-01 = true
  },
  gen-uks-prd-ss-com-nsg-01 = {
    gen-uks-prd-ss-com-snet-01 = true
  },
  gen-uks-prd-ss-pep-nsg-01 = {
    gen-uks-prd-ss-pep-snet-01 = true
  }

}
