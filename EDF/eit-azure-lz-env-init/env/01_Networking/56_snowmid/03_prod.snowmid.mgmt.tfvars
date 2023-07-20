environment = "Production"

#mgmtss key vault
hssecgovKvName   = "avmeitalzhssecgovsub01kv"
hssecgovKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-hs-secgovprd-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  eit-uks-alz-hs-secgovprd-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
    addressSpace  = "secgov-prd-vnet-address-range" //key vault secret name as value
    dnsServerList = "hs-dns-ips"                    //key vault secret name as value
    subnets = {
      eit-alz-hs-midprd-snet-01 = {
        enable                    = true
        address                   = "hssecgov-prd-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-hs-tenable-snet-01 = {
        enable                    = true
        address                   = "hssecgov-prd-tenable-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-hs-secgov-pep-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-secgov-pep-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-hs-pentest-snet-01 = {
        enable                    = true
        address                   = "eit-alz-hs-pentest-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}
################# Vnet Peering ################
vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-hs-secgovprd-vnet-01"
    peer2name = "eit-uks-alz-hs-secgovprd-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"         //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"         //hub network
    vnet2rg   = "eit-uks-alz-hs-secgovprd-vnet-rg-01" //spoke network resource group
    vnet2name = "eit-uks-alz-hs-secgovprd-vnet-01"    //spoke network
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

########### UDR #######################
UDR = {
  eit-alz-hs-midprd-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-midprd-snet-01-d_On-Prem-Internet", "s_eit-alz-hs-midprd-snet-01-d_eit-uks-alz-transit-snet-01", "s_eit-alz-hs-midprd-snet-01-d_eit-uks-alz-transit-snet-02", "s_eit-alz-hs-midprd-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "hssecgov-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "hssecgov-udr-nexthop"  //key vault secret name as value
  },
  eit-alz-hs-tenable-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-tenable-snet-01-d_On-Prem-Internet", "s_eit-alz-hs-tenable-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "hssecgov-tenable-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "hssecgov-udr-nexthop"          //key vault secret name as value
  },
  eit-alz-hs-secgov-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-secgov-pep-snet-01-d_On-Prem-Internet", "s_eit-alz-hs-secgov-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "hssecgov-pep-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "hssecgov-udr-nexthop"      //key vault secret name as value
  },
  eit-alz-hs-pentest-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-hs-pentest-snet-01-d_On-Prem-Internet", "s_eit-alz-hs-pentest-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-hs-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "hssecgov-pep-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "hssecgov-udr-nexthop"      //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  eit-alz-hs-midprd-udr-01     = ["eit-alz-hs-midprd-snet-01"]
  eit-alz-hs-tenable-udr-01    = ["eit-alz-hs-tenable-snet-01"]
  eit-alz-hs-secgov-pep-udr-01 = ["eit-alz-hs-secgov-pep-snet-01"]
  eit-alz-hs-pentest-udr-01    = ["eit-alz-hs-pentest-snet-01"]
}

############ NSG ########################

nsg = {
  eit-alz-hs-midprd-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
  },
  eit-alz-hs-tenable-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
  },
  eit-alz-hs-secgov-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
  },
  eit-alz-hs-pentest-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
  }
}

nsgrules = {
  eit-alz-hs-midprd-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MIDPRD"
      description                                = "AIA-ADDS-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-MIDPRD"
      description                                = "AIT-WAC-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-MIDPRD"
      description                                = "AIT-AFS-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-ONPREMBLUE-MIDPRD"
      description                                = "AIT-ONPREMBLUE-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "eit-alz-hs-secgov-onprem-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
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
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-MIDPRD"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-MIDPRD"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-tenable-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-MIDPRD"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-pentest-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-MIDPRD"
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
      name                                       = "AOA-MIDPRD-ADDS"
      description                                = "AOA-MIDPRD-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      name                                       = "AOT-MIDPRD-LOGA"
      description                                = "AOT-MIDPRD-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      name                                       = "AOT-MIDPRD-WSUS"
      description                                = "AOT-MIDPRD-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      name                                       = "AOT-MIDPRD-TENABLEAGENT"
      description                                = "AOT-MIDPRD-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" //need to check and remove
      priority                                   = "600"
      name                                       = "AOT-MIDPRD-LINUXUPDATES"
      description                                = "AOT-MIDPRD-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      direction                                  = "Outbound" //need to check and update priority
      priority                                   = "640"
      name                                       = "AOT-MIDPRD-INTERNET"
      description                                = "AOT-MIDPRD-INTERNET"
      protocol                                   = "*"
      destination_port_range                     = "80,443"
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
      priority                                   = "3000"
      name                                       = "AOT-MIDPRD-AZUREAGENT"
      description                                = "AOT-MIDPRD-AZUREAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      name                                       = "AOT-MIDPRD-AZURECLOUD"
      description                                = "AOT-MIDPRD-AZURECLOUD"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      priority                                   = "3100" // 700 changed
      name                                       = "AOT-MIDPRD-KMS"
      description                                = "AOT-MIDPRD-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688" // 1638
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
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
      priority                                   = "750"
      name                                       = "AOT-MIDPRD-DISCOVERY"
      description                                = "AOT-MIDPRD-DISCOVERY"
      protocol                                   = "tcp"
      destination_port_range                     = "21,22,23,25,53,80,110,111,135,137,137,139,161,162,199,389,427,443,445,515,548,636,993,1414,1433,1521,2049,3306,5060,5060,5432,5480,5666,5989,7001,7500,8080,9080,9100,9443,9443,50000"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-disc-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "800"
      name                                       = "AOU-MIDPRD-DISCOVERY"
      description                                = "AOU-MIDPRD-DISCOVERY"
      protocol                                   = "udp"
      destination_port_range                     = "53,137,161,162,427,2049"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-disc-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-MIDPRD-NTP"
      description                                = "AOT-MIDPRD-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hssecgov-prd-linux-ntp-service"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "700"
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hssecgov-prd-pep-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-MIDPRD-ICA"
      description                                = "AOT-MIDPRD-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-hs-tenable-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-TENABLE"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ADDS-TENABLE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-TENABLE" // AIT-ALZWAC-TENABLE changed
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ALZWAC-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-WAC-TENABLE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-TENABLE"
      description                                = "AIT-AFS-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-TENABLE" // AIT-HSADO-TENABLE changed
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-HSADO-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-TENABLE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-TENABLE" // AIA-SECGOV-HSMID-TENABLE changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-HSMID-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-TENABLE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-TENABLE" // AIA-SECGOV-HSTENABLE-TENABLE changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-TENABLE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-TENABLE" // AIA-SECGOV-HSPENTEST-ADDS changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-HSPENTEST-ADDS-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-TENABLE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // Deny-VNET-VNET chnaged
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
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
      description                                = "DIA-INTERNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-TENABLE-ADDS" // AOA-TENABLE-ANY-HSVNET changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-TENABLE-ANY-HSVNET-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-TENABLE-ADDS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-TENABLE-LOGA"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-HS-LOGA-KEY-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-TENABLE-LOGA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-TENABLE-WSUS"
      description                                = "AOT-TENABLE-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
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
      name                                       = "AOT-TENABLE-TENABLEAGENT"
      description                                = "AOT-TENABLE-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-TENABLE-LINUXUPDATES"
      description                                = "AOT-TENABLE-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
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
      name                                       = "AOT-TENABLE-AZUREAGENT"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-AzureAgent-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-TENABLE-AZUREAGENT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" //2100 changed
      name                                       = "AOT-TENABLE-AZURECLOUD"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
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
      direction                                  = "Outbound" // updated
      priority                                   = "3100"     // 2200 changed
      name                                       = "AOT-TENABLE-KMS"
      protocol                                   = "TCP"
      destination_port_range                     = "1688" // 1638 changed
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-TENABLE-KMS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // updated
      priority                                   = "2300"
      name                                       = "AOT-TENABLE-AzureStorage"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-TENABLE-AzureStorage"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // updated
      priority                                   = "4050"     // 4000 changed
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
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-TENABLE-NTP"
      description                                = "AOT-TENABLE-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hssecgov-prd-linux-ntp-service"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "700"
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hssecgov-prd-pep-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "505" // added
      name                                       = "AIT-ONPREM-TENABLE"
      description                                = "AIT-ONPREM-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "22,443,8000,8834"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-onprem-tenable-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-tenable-hs-vm-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "510" // added
      name                                       = "AIT-ONPREMTENABLE-TENABLE"
      description                                = "AIT-ONPREMTENABLE-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-onpremtenable-hs-tenable-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-tenable-hs-vm-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "515" // added
      name                                       = "AIU-OPS-ZABBIX-TENABLE"
      description                                = "AIU-OPS-ZABBIX-TENABLE"
      protocol                                   = "UDP"
      destination_port_range                     = "161,162"
      source_port_range                          = "*"
      source_address_prefix                      = "ops-security-Zabbix-monitoring-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-tenable-hs-vm-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "520" // added
      name                                       = "AIA-ICMP-TENABLE"
      description                                = "AIA-ICMP-TENABLE"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ops-security-Zabbix-monitoring-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-tenable-hs-vm-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-TENABLE-ICA"
      description                                = "AOT-TENABLE-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-hs-secgov-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-PEP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-ADDS-PEP"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-PEP" // AIT-WAC-PEP
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ALZWAC-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-WAC-PEP"
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
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      source_address_prefix                      = "AIT-CA-PEP-Address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      source_address_prefix                      = "AIT-WSUS-PEP-Address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      source_address_prefix                      = "AIT-ADO-PEP-Address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      source_address_prefix                      = "AIT-MGMT-PEP-Address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-AUDIT-PEP-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-AUDIT-PEP"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PEP" // AIA-SECGOV-HSMID-TENABLE changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-HSMID-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      name                                       = "AIA-SECGOV-TENABLE-PEP" // AIA-SECGOV-HSTENABLE-TENABLE changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      name                                       = "AIA-SECGOV-PENTEST-PEP" // AIA-SECGOV-HSPENTEST-ADDS changed
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-HSPENTEST-ADDS-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      name                                       = "DIA-VNET-VNET" // Deny-VNET-VNET chnaged
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
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
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
      description                                = "DIA-INTERNET-VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-PEP-TENABLEAGENT"
      description                                = "AOT-PEP-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-prd-tenable-subnet-address-range"
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
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hssecgov-AzureAgent-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PEP-AZUREAGENT"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050" //2100 changed
      name                                       = "AOT-PEP-AZURECLOUD"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      direction                                  = "Outbound" // updated
      priority                                   = "3100"
      name                                       = "AOT-PEP-AzureStorage"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      direction                                  = "Outbound" // updated
      priority                                   = "4050"     // 4000 changed
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
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-PEP-ICA"
      description                                = "AOT-PEP-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-pep-subnet-address-range"
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
      priority                                   = "450"
      name                                       = "AOT-PEP-LOGA"
      description                                = "AOT-PEP-LOGA"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-pep-subnet-address-range"
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
  eit-alz-hs-pentest-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-PENTEST-ANY"
      description                                = "AIA-ADDS-PENTEST-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-PENTEST"
      description                                = "AIT-WAC-PENTEST"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-secgov-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-PENTEST"
      description                                = "AIT-AFS-PENTEST"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-PENTEST"
      description                                = "AIT-ADO-PENTEST"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-HSADO-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PENTEST"
      description                                = "AIA-SECGOV-MID-PENTEST"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-PENTEST"
      description                                = "AIA-SECGOV-TENABLE-PENTEST"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-PENTEST"
      description                                = "AIA-SECGOV-PENTEST-PENTEST"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOA-PENTEST-ADDS"
      description                                = "AOA-PENTEST-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-LOGA"
      description                                = "AOT-PENTEST-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-WSUS"
      description                                = "AOT-PENTEST-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-TENABLEAGENT"
      description                                = "AOT-PENTEST-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-onpremtenable-hs-tenable-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-PENTEST-LINUXUPDATES"
      description                                = "AOT-PENTEST-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-NTP"
      description                                = "AOT-PENTEST-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hssecgov-prd-linux-ntp-service"
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
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-ado-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "750"
      name                                       = "AOT-PENTEST-DISCOVERY"
      description                                = "AOT-PENTEST-DISCOVERY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-secgov-disc-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "800"
      name                                       = "AOT-PENTEST-INTERNET"
      description                                = "AOT-PENTEST-INTERNET"
      protocol                                   = "TCP"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-AZUREAGENT-443"
      description                                = "AOT-PENTEST-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-AZURECLOUD-443"
      description                                = "AOT-PENTEST-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-KMS"
      description                                = "AOT-PENTEST-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
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
      priority                                   = "430"
      name                                       = "AOT-PENTEST-ICA"
      description                                = "AOT-PENTEST-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
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
  eit-alz-hs-midprd-nsg-01 = {
    eit-alz-hs-midprd-snet-01 = true
  }
  eit-alz-hs-tenable-nsg-01 = {
    eit-alz-hs-tenable-snet-01 = true
  }
  eit-alz-hs-secgov-pep-nsg-01 = {
    eit-alz-hs-secgov-pep-snet-01 = true
  }
  eit-alz-hs-pentest-nsg-01 = {
    eit-alz-hs-pentest-snet-01 = true
  }
}

########### NSG Diag Settings ############
category1enabled     = true
retention_policy     = true
retention_policydays = 90
category1            = "NetworkSecurityGroupEvent"
category2            = "NetworkSecurityGroupRuleCounter"
midprd_nsg_name      = "eit-alz-hs-midprd-nsg-01"
pep_nsg_name         = "eit-alz-hs-secgov-pep-nsg-01"
pentest_nsg_name     = "eit-alz-hs-pentest-nsg-01"
tenable_nsg_name     = "eit-alz-hs-tenable-nsg-01"
nsg_rg_name          = "eit-uks-alz-hs-secgovprd-vnet-rg-01"

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
category3                 = "VMProtectionAlerts"
category4                 = "AllMetrics"
diag_vnet_name            = "eit-uks-alz-hs-secgovprd-vnet-01"
diag_vnet_rg              = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
