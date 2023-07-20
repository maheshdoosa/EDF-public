environment = "Production"

#cenadt key vault
cenadtKvName   = "avmeitalzhscenadtsub01kv"
cenadtKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-hs-cenadt-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  eit-uks-alz-hs-cenadt-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-hs-cenadt-vnet-rg-01"
    addressSpace  = "cenadt-prd-vnet-address-range" //key vault secret name as value
    dnsServerList = "hs-dns-ips"                    //key vault secret name as value
    subnets = {
      eit-alz-hs-cenadt-audit-snet-01 = {
        enable                    = true
        address                   = "cenadt-prd-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-hs-cenadt-pep-snet-01 = {
        enable                    = true
        address                   = "cenadt-pep-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-hs-cenadt-pec-snet-01 = {
        enable                    = true
        address                   = "EIT-EC-KEY-01" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-hs-cenadt-vnet-01"
    peer2name = "eit-uks-alz-hs-cenadt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"      //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"      //hub network
    vnet2rg   = "eit-uks-alz-hs-cenadt-vnet-rg-01" //spoke network resource group
    vnet2name = "eit-uks-alz-hs-cenadt-vnet-01"    //spoke network
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

tenantId            = "tenantId"                  //key vault secret name as value
hubSubscriptionId   = "transitSubscriptionId"     //key vault secret name as value
spokeSubscriptionId = "cenadt-prd-SubscriptionId" //key vault secret name as value

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false


UDR = {
  eit-alz-hs-cenadt-audit-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-cenadt-audit-snet-d_On-Prem-Internet", "s_eit-alz-hs-cenadt-audit-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-cenadt-vnet-01"
    RGName                = "eit-uks-alz-hs-cenadt-vnet-rg-01"
    kv_secret_udrprefixes = "cenadt-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "cenadt-prd-udr-nexthop"  //key vault secret name as value
  },
  eit-alz-hs-cenadt-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-cenadt-pep-snet-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-cenadt-vnet-01"
    RGName                = "eit-uks-alz-hs-cenadt-vnet-rg-01"
    kv_secret_udrprefixes = "cenadt-pep-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "cenadt-pep-udr-nexthop"  //key vault secret name as value
  },
  eit-alz-hs-cenadt-pec-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-cenadt-pec-snet-d_On-Prem-Internet", "s_eit-alz-hs-cenadt-pec-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-cenadt-vnet-01"
    RGName                = "eit-uks-alz-hs-cenadt-vnet-rg-01"
    kv_secret_udrprefixes = "cenadt-prd-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "cenadt-prd-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  eit-alz-hs-cenadt-audit-udr-01 = ["eit-alz-hs-cenadt-audit-snet-01"]
  eit-alz-hs-cenadt-pep-udr-01   = ["eit-alz-hs-cenadt-pep-snet-01"]
  eit-alz-hs-cenadt-pec-udr-01   = ["eit-alz-hs-cenadt-pec-snet-01"]
}

nsg = {
  eit-uks-alz-hs-cenadt-audit-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-cenadt-vnet-rg-01"
  },
  eit-uks-alz-hs-cenadt-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-cenadt-vnet-rg-01"
  },
  eit-alz-hs-cenadt-pec-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-cenadt-vnet-rg-01"
  }
}

nsgrules = {
  eit-uks-alz-hs-cenadt-audit-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-CENADT"
      description                                = "AIA-ADDS-CENADT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-CENADT"
      description                                = "AIT-WAC-CENADT"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-CENADT"
      description                                = "AIT-AFS-CENADT"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-HS-VNETs-LOGA"
      description                                = "AIT-HS-VNETs-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-vnets-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-SS-VNETs-LOGA"
      description                                = "AIT-SS-VNETs-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-vnets-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-CENADT"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-CENADT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-CENADT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-CENADT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-CENADT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-tenable-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-CENADT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-CENADT"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-pentest-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-CENADT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny_VNET-VNET changed
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
      name                                       = "AOA-CENADT-ADDS"
      description                                = "AOA-CENADT-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-CENADT-LOGA"
      description                                = "AOT-CENADT-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-HS-LOGA-KEY-01"
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
      name                                       = "AOT-CENADT-WSUS"
      description                                = "AOT-CENADT-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-wsus-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-CENADT-TENABLEAGENT"
      description                                = "AOT-CENADT-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "tenable-nessus-manager-agent"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-CENADT-AZUREAGENT"
      description                                = "AOT-CENADT-AZUREAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
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
      name                                       = "AOT-CENADT-AZURECLOUD"
      description                                = "AOT-CENADT-AZURECLOUD"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
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
      name                                       = "AOT-CENADT-KMS"
      description                                = "AOT-CENADT-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET" // Deny-VNET-VNET changed
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
      priority                                   = "600"
      name                                       = "AOT-APEXMGR-LINUXUPDATES"
      description                                = "AOT-APEXMGR-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
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
      priority                                   = "650"
      name                                       = "AOT-APEXMGR-NTP"
      description                                = "AOT-APEXMGR-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "cenadt-prd-linux-ntp-service"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "410"
      name                                       = "AOT-Audit-PEP"
      description                                = "AOT-Audit-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-CENADT-AZURESTORAGE"
      description                                = "AOT-CENADT-AZURESTORAGE"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "350"
      name                                       = "AIU-F5-LOGA-CENADT"
      description                                = "AIU-F5-LOGA-CENADT"
      protocol                                   = "*"
      destination_port_range                     = "514"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-hs-f5-loga-01-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "360"
      name                                       = "AIT-F5-LOGA-ICMP-CENADT"
      description                                = "AIT-F5-LOGA-ICMP-CENADT"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-hs-f5-loga-icmp-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-CENADT-ICA"
      description                                = "AOT-CENADT-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
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
      name                                       = "AOT-centAudit-PEP"
      description                                = "AOT-centAudit-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "cenadt-pep-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-hs-cenadt-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIT-HSVNET-PEP"
      description                                = "AIT-HSVNET-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-vnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-SSVNET-PEP"
      description                                = "AIT-SSVNET-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-vnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny_VNET-VNET changed
      description                                = "DIA-VNET-VNET"
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
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET" // Deny_VNET-VNET changed
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
      priority                                   = "3000"
      name                                       = "AOT-PEP-AzureAgent"
      description                                = "AOT-PEP-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-pep-subnet-address-range"
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
      source_address_prefix                      = "cenadt-pep-subnet-address-range"
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
      priority                                   = "3200"
      name                                       = "AOT_PEP_AzureStorage"
      description                                = "AOT_PEP_AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-pep-subnet-address-range"
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
      priority                                   = "430"
      name                                       = "AOT-CENADT-ICA"
      description                                = "AOT-CENADT-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "cenadt-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
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
      name                                       = "AIT-EITADO-PEPSNET"
      description                                = "AIT-EITADO-PEPSNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "cenadt-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "cenadt-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-HS-LOGA-KEY-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-hs-cenadt-pec-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-PEC-ANY"
      description                                = "AIA-ADDS-PEC-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-ADDS-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-PEC"
      description                                = "AIT-WAC-PEC"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985,22"
      source_port_range                          = "*"
      source_address_prefix                      = "ALZ-HSWAC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-PEC"
      description                                = "AIT-AFS-PEC"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "ALZ-HSAFS-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-PEC"
      description                                = "AIT-ADO-PEC"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "ALZ-HSADO-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PEC"
      description                                = "AIA-SECGOV-MID-PEC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ALZ-HSMID-KEY-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-PEC"
      description                                = "AIA-SECGOV-TENABLE-PEC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ALZ-HSTENABLE-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-PEC"
      description                                = "AIA-SECGOV-PENTEST-PEC"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ALZ-HSPENTEST-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "950"
      name                                       = "AIA-LINUXSERVER-PEC"
      description                                = "AIA-LINUXSERVER-PEC"
      protocol                                   = "*"
      destination_port_range                     = "514"
      source_port_range                          = "*"
      source_address_prefix                      = "HS-Diamond-LinuxServers-Azure-LZ"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT-WINDOWS-PEC"
      description                                = "AIT-WINDOWS-PEC"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,5986"
      source_port_range                          = "*"
      source_address_prefix                      = "HS-Diamond-WindowsServers-Azure-LZ"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny_VNET-VNET changed
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
      name                                       = "AOA-PEC-ADDS"
      description                                = "AOA-PEC-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-ADDS-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-PEC-LOGA"
      description                                = "AOT-PEC-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-HS-LOGA-KEY-01"
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
      name                                       = "AOU-PEC-WSUS"
      description                                = "AOU-PEC-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ALZ-HSWSUS-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-PEC-TENABLEAGENT"
      description                                = "AOT-PEC-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ALZ-HS-ONPREMTEN-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-PEC-LINUXUPDATES"
      description                                = "AOT-PEC-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
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
      priority                                   = "650"
      name                                       = "AOU-PEC-NTP"
      description                                = "AOU-PEC-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-TIer1-Firewall-KEY-01"
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
      name                                       = "AOA-PEC-VFUNENCRYPT"
      description                                = "AOA-PEC-VFUNENCRYPT"
      protocol                                   = "*"
      destination_port_range                     = "514"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "172.25.130.0/28"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "750"
      name                                       = "AOT-PEC-VFENCRYPT"
      description                                = "AOT-PEC-VFENCRYPT"
      protocol                                   = "tcp"
      destination_port_range                     = "6514"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "172.25.130.0/28"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-PEC-AZUREAGENT"
      description                                = "AOT-PEC-AZUREAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
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
      name                                       = "AOT-PEC-AZURECLOUD"
      description                                = "AOT-PEC-AZURECLOUD"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
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
      name                                       = "AOT-PEC-KMS"
      description                                = "AOT-PEC-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET" // Deny-VNET-VNET changed
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
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-JUMPHOST-PEC"
      description                                = "AIT-JUMPHOST-PEC"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ALZ-JUMPHOST-KEY-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EIT-PEC-KEY-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "701"
      name                                       = "AOT-PEC-PEP"
      description                                = "AOT-PEC-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "EIT-PEC-KEY-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "cenadt-pep-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
}

nsg_subnet_mapping = {
  eit-uks-alz-hs-cenadt-audit-nsg-01 = {
    eit-alz-hs-cenadt-audit-snet-01 = true
  }
  eit-uks-alz-hs-cenadt-pep-nsg-01 = {
    eit-alz-hs-cenadt-pep-snet-01 = true
  }
  eit-alz-hs-cenadt-pec-nsg-01 = {
    eit-alz-hs-cenadt-pec-snet-01 = true
  }
}

################ Private Linkscope ##################
// tenantId = "tenantId"                           //This variable has already been set above
// SubscriptionId = "cenadt-prd-SubscriptionId"    //key vault secret name as value
cenadtContributorSPAppId  = "cenadt-prd-ContributorSPAppId"  //key vault secret name as value
cenadtContributorSPSecret = "cenadt-prd-ContributorSPSecret" //key vault secret name as value

################ Private endpoint ##################
laEndPointName           = "eituksalzhscenadtloga01-pe"
endPointLocation         = "UK South"
resourceGroupName        = "eit-uks-alz-hs-cenadt-loga-rg-01"
laSubResourceName        = ["azuremonitor"]
laPrivateServiceConnName = "eit-uks-alz-hs-cenadt-ampls-01"

########### NSG Diag Settings ############
category1enabled     = true
retention_policy     = true
retention_policydays = 90
category1            = "NetworkSecurityGroupEvent"
category2            = "NetworkSecurityGroupRuleCounter"
centadt_nsg_name     = "eit-uks-alz-hs-cenadt-audit-nsg-01"
pec_nsg_name         = "eit-alz-hs-cenadt-pec-nsg-01"
pep_nsg_name         = "eit-uks-alz-hs-cenadt-pep-nsg-01"
nsg_rg_name          = "eit-uks-alz-hs-cenadt-vnet-rg-01"

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
category3                 = "VMProtectionAlerts"
category4                 = "AllMetrics"
diag_vnet_name            = "eit-uks-alz-hs-cenadt-vnet-01"
diag_vnet_rg              = "eit-uks-alz-hs-cenadt-vnet-rg-01"
