environment = "Production"

#mgmtss key vault
sssecgovKvName   = "avmeitalzsssecgovsub01kv"
sssecgovKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-ss-secgovprd-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  eit-uks-alz-ss-secgovprd-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
    addressSpace  = "sssecgov-prd-vnet-address-range" //key vault secret name as value
    dnsServerList = "sssecgov-prd-dns-ips"            //key vault secret name as value
    subnets = {
      eit-alz-ss-midprd-snet-01 = {
        enable                    = true
        address                   = "sssecgov-prd-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-ss-tenable-snet-01 = {
        enable                    = true
        address                   = "sssecgov-tenable-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-ss-pentest-snet-01 = {
        enable                    = true
        address                   = "sssecgov-pentest-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      },
      eit-alz-ss-midprd-pep-snet-01 = {
        enable                    = true
        address                   = "ss-midprd-pep-subnet-address-range" //key vault secret name as value
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
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-ss-secgovprd-vnet-01"
    peer2name = "eit-uks-alz-ss-secgovprd-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"         //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"         //hub network
    vnet2rg   = "eit-uks-alz-ss-secgovprd-vnet-rg-01" //spoke network resource group
    vnet2name = "eit-uks-alz-ss-secgovprd-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-ss-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-ss-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-ss-mdw-vnet-prd-01" //spoke network
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
  eit-alz-ss-midprd-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-ss-midprd-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-midprd-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-ss-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "sssecgov-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "sssecgov-udr-nexthop"  //key vault secret name as value
  },
  eit-alz-ss-tenable-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-ss-tenable-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-tenable-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-ss-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "sssecgov-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "sssecgov-udr-nexthop"  //key vault secret name as value
  },
  eit-alz-ss-pentest-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-ss-pentest-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-pentest-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-ss-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "sssecgov-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "sssecgov-udr-nexthop"  //key vault secret name as value
  },
  eit-alz-ss-midprd-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_eit-alz-ss-midprd-pep-snet-01-d_On-Prem-Internet", "s_eit-alz-ss-midprd-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "eit-uks-alz-ss-secgovprd-vnet-01"
    RGName                = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
    kv_secret_udrprefixes = "sssecgov-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "sssecgov-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  eit-alz-ss-midprd-udr-01     = ["eit-alz-ss-midprd-snet-01"]
  eit-alz-ss-tenable-udr-01    = ["eit-alz-ss-tenable-snet-01"]
  eit-alz-ss-pentest-udr-01    = ["eit-alz-ss-pentest-snet-01"]
  eit-alz-ss-midprd-pep-udr-01 = ["eit-alz-ss-midprd-pep-snet-01"]
}

############ NSG ########################

nsg = {
  eit-alz-ss-midprd-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
  },
  eit-alz-ss-tenable-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
  },
  eit-alz-ss-pentest-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
  },
  eit-uks-alz-ss-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
  }
}

nsgrules = {
  eit-alz-ss-midprd-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-MIDPRD-ANY"
      description                                = "AIA-ADDS-MIDPRD-ANY"
      protocol                                   = "*"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Changed as per Standard rule
      name                                       = "AIT-WAC-MIDPRD"
      description                                = "AIT-WAC-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
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
      source_address_prefixes                    = "eit-alz-ss-secgov-onprem-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
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
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "750"     #Changed as per Standard rule
      name                                       = "AIT-ADO-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-MIDPRD"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-MIDPRD"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sstenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-MIDPRD"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-MIDPRD"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-sspentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
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
      priority                                   = "400"
      name                                       = "AOA-MIDPRD-ADDS"
      description                                = "AOA-MIDPRD-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-adds-01-address-range"
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
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-loga-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-MIDPRD-WSUS"
      description                                = "AOT-MIDPRD-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-wsus-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "580" #Changed as per Standard rule
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
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-MIDPRD-AZUREAGENT-443"
      description                                = "AOT-MIDPRD-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
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
      name                                       = "AOT-MIDPRD-AZURECLOUD-443"
      description                                = "AOT-MIDPRD-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
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
      name                                       = "AOT-MIDPRD-KMS"
      description                                = "AOT-MIDPRD-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "750"
    #   name                       = "AOT-MIDPRD-DISCOVERY"
    #   description                = "AOT-MIDPRD-DISCOVERY"
    #   protocol                   = "tcp"
    #   destination_port_range     = "21,22,23,25,53,80,110,111,135,137,137,139,161,162,199,389,427,443,445,515,548,636,993,1414,1433,1521,2049,3306,5060,5060,5432,5480,5666,5989,7001,7500,8080,9080,9100,9443,9443,50000"
    #   source_port_range          = "*"
    #   source_address_prefix      = "sssecgov-prd-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "eit-alz-ss-secgov-disc-01-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "750"
      name                                       = "AOT-MIDPRD-DISCOVERY"
      description                                = "AOT-MIDPRD-DISCOVERY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-disc-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "800"
    #   name                       = "AOU-MIDPRD-DISCOVERY"
    #   description                = "AOU-MIDPRD-DISCOVERY"
    #   protocol                   = "udp"
    #   destination_port_range     = "53,137,161,162,427,2049"
    #   source_port_range          = "*"
    #   source_address_prefix      = "sssecgov-prd-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "eit-alz-ss-secgov-disc-01-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" #Changed as per Standard rule
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
      direction                                  = "Inbound" // Added
      priority                                   = "700"
      name                                       = "AIT-SECGOVBASTION-MIDPRD"
      description                                = "AIT-SECGOVBASTION-MIDPRD"
      protocol                                   = "TCP"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-subnet-bastion-address-range" #
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "850"
      name                                       = "AOA-SSMID-SSMID"
      description                                = "AOA-SSMID-SSMID"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-MIDPRD-AzureStorage"
      description                                = "AOT-MIDPRD-AzureStorage"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
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
      priority                                   = "550" #Added as per Standard rule
      name                                       = "AOT-MIDPRD-TENABLEAGENT"
      description                                = "AOT-MIDPRD-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-MIDPRD-LINUXUPDATES"
      description                                = "AOT-MIDPRD-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
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
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-MIDPRD"
      description                                = "AIT-AFS-MIDPRD"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-prd-subnet-address-range"
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
      direction                                  = "Outbound" // Added
      priority                                   = "700"
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "sssecgov-prd-subnet-address-range"
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
  eit-alz-ss-tenable-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Changed as per Standard rule
      name                                       = "AIT-WAC-TENABLE"
      description                                = "AIT-WAC-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-ONPREMRED-TENABLE"
      description                                = "AIT-ONPREMRED-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-ONPREMRED-TENABLE-IP"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-TENABLE"
      description                                = "AIT-ADO-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-SSADO-TENABLE-IP"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-TENABLE"
      description                                = "AIA-SECGOV-MID-TENABLE"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-TENABLE"
      description                                = "AIA-SECGOV-TENABLE-TENABLE"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-TENABLE"
      description                                = "AIA-SECGOV-PENTEST-TENABLE"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
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
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-TENABLE-LOGA"
      description                                = "AOT-TENABLE-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AOT-TENABLE-LOGA-IP"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-TENABLE-AZUREAGENT-443"
      description                                = "AOT-TENABLE-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
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
      priority                                   = "3050" #Changed as per Standard rule
      name                                       = "AOT-TENABLE-AZURECLOUD-443"
      description                                = "AOT-TENABLE-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
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
      priority                                   = "750"
      name                                       = "AOT-TENABLE-DISCOVERY"
      description                                = "AOT-TENABLE-DISCOVERY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AOT-TENABLE-DISCOVERY-IP"
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
      priority                                   = "700"
      name                                       = "AIT-SECGOVBASTION-TENABLE"
      description                                = "AIT-SECGOVBASTION-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-bastion-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "800"
      name                                       = "AOT-TENABLE-INTERNET"
      description                                = "AOT-TENABLE-INTERNET"
      protocol                                   = "TCP"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
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
      priority                                   = "400"
      name                                       = "AOA-TENABLE-ADDS"
      description                                = "AOA-TENABLE-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT-TENABLE-WSUS"
      description                                = "AOT-TENABLE-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-wsus-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "550"
      name                                       = "AOT-TENABLE-TENABLEAGENT"
      description                                = "AOT-TENABLE-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-TENABLE-LINUXUPDATES"
      description                                = "AOT-TENABLE-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
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
      name                                       = "AOT-TENABLE-KMS"
      description                                = "AOT-TENABLE-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // Azure Public IP
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
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AIA-ADDS-TENABLE-ANY"
      description                                = "AIA-ADDS-TENABLE-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-TENABLE"
      description                                = "AIT-AFS-TENABLE"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenable-subnet-address-range"
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
      direction                                  = "Outbound" // Added
      priority                                   = "700"
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
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
      destination_address_prefix                 = "ait-tenable-address-range-01"
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
      source_address_prefix                      = "ait-onpremtenable-tenable-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-tenable-address-range-01"
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
      destination_address_prefix                 = "ait-zabbix-tenable-address-range-01"
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
      destination_address_prefix                 = "ait-zabbix-tenable-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  eit-alz-ss-pentest-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "450" #Changed as per Standard rule
      name                                       = "AIT-WAC-PENTEST"
      description                                = "AIT-WAC-PENTEST"
      protocol                                   = "tcp"
      destination_port_range                     = "22,3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      source_address_prefixes                    = "AIT-SSADO-PENTEST-IP-Bastion"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      source_address_prefixes                    = "sssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-PENTEST-LOGA"
      description                                = "AOT-PENTEST-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AOT-TENABLE-LOGA-IP"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000" #Changed as per Standard rule
      name                                       = "AOT-PENTEST-AZUREAGENT-443"
      description                                = "AOT-PENTEST-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
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
      priority                                   = "3050" #Changed as per Standard rule
      name                                       = "AOT-PENTEST-AZURECLOUD-443"
      description                                = "AOT-PENTEST-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
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
      priority                                   = "750"
      name                                       = "AOT-PENTEST-DISCOVERY"
      description                                = "AOT-PENTEST-DISCOVERY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AOT-TENABLE-DISCOVERY-IP"
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
      priority                                   = "700"
      name                                       = "AIT-SECGOVBASTION-PENTEST"
      description                                = "AIT-SECGOVBASTION-PENTEST"
      protocol                                   = "TCP"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-prd-subnet-bastion-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
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
      priority                                   = "400"
      name                                       = "AOA-PENTEST-ADDS"
      description                                = "AOA-PENTEST-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT-PENTEST-WSUS"
      description                                = "AOT-PENTEST-WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-secgov-wsus-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "550"
      name                                       = "AOT-PENTEST-TENABLEAGENT"
      description                                = "AOT-PENTEST-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
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
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "600"
      name                                       = "AOT-PENTEST-LINUXUPDATES"
      description                                = "AOT-PENTEST-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
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
      name                                       = "AOT-PENTEST-KMS"
      description                                = "AOT-PENTEST-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" // Azure Public IP
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
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "400"
      name                                       = "AIA-ADDS-PENTEST-ANY"
      description                                = "AIA-ADDS-PENTEST-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-secgov-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AIT-AFS-PENTEST"
      description                                = "AIT-AFS-PENTEST"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-pentest-subnet-address-range"
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
      direction                                  = "Outbound" // Added
      priority                                   = "700"
      name                                       = "AOA-ADO-PEP"
      description                                = "AOA-ADO-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-PENTEST-NTP"
      description                                = "AOT-PENTEST-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
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
      source_address_prefix                      = "eit-alz-ss-secgov-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefix                      = "eit-alz-ss-secgov-wac-01-address-ranges"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefixes                    = "eit-alz-ss-secgov-wsus-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefix                      = "eit-alz-ss-secgov-loga-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      destination_address_prefix                 = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefix                      = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefix                      = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefix                      = "ss-midprd-pep-subnet-address-range"
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
      source_address_prefix                      = "ss-midprd-pep-subnet-address-range"
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
}

nsg_subnet_mapping = {
  eit-alz-ss-midprd-nsg-01 = {
    eit-alz-ss-midprd-snet-01 = true
  },
  eit-alz-ss-tenable-nsg-01 = {
    eit-alz-ss-tenable-snet-01 = true
  },
  eit-alz-ss-pentest-nsg-01 = {
    eit-alz-ss-pentest-snet-01 = true
  },
  eit-uks-alz-ss-pep-nsg-01 = {
    eit-alz-ss-midprd-pep-snet-01 = true
  }
}
