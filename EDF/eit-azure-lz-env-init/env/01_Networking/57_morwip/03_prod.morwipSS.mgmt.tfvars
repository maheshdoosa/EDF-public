environment = "Production"

#mgmtss key vault
morwipKvName   = "avmcusprdssmgmtsub01kv"
morwipKvRgName = ".security"

###########################################################################

rgs = {
  cus-uks-prd-ss-mgmt-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Production"
    }
  }
}

vnets = {
  cus-uks-prd-ss-mgmt-vnet-01 = {
    enable        = true
    rg            = "cus-uks-prd-ss-mgmt-vnet-rg-01"
    addressSpace  = "morwip-prd-vnet-address-range" //key vault secret name as value
    dnsServerList = "morwip-prd-dns-ips"            //key vault secret name as value
    subnets = {
      cus-uks-prd-ss-adds-snet-01 = {
        enable                    = true
        address                   = "morwip-prd-ss-adds-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      cus-uks-prd-ss-av-snet-01 = {
        enable                    = true
        address                   = "morwip-prd-ss-av-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      cus-uks-prd-ss-sccm-snet-01 = {
        enable                    = true
        address                   = "morwip-prd-ss-sccm-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      cus-uks-prd-ss-pep-snet-01 = {
        enable                    = true
        address                   = "morwip-prd-ss-pep-subnet-address-range" //key vault secret name as value
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
    peer1name = "eit-uks-alz-transit-vnet-01-cus-uks-prd-ss-mgmt-vnet-01"
    peer2name = "cus-uks-prd-ss-mgmt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "cus-uks-prd-ss-mgmt-vnet-rg-01" //spoke network resource group
    vnet2name = "cus-uks-prd-ss-mgmt-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-ss-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-ss-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "cus-uks-prd-ss-mgmt-vnet-rg-01" //spoke network resource group
    vnet2name = "cus-uks-prd-ss-mgmt-vnet-01"    //spoke network
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
  cus-uks-prd-ss-adds-udr-01 = {
    enable                = true
    RouteNames            = ["s_cus-uks-prd-ss-adds-snet-01-d_On-Prem-Internet", "s_cus-uks-prd-ss-adds-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "cus-uks-prd-ss-mgmt-vnet-01"
    RGName                = "cus-uks-prd-ss-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "morwip-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "morwip-udr-nexthop"  //key vault secret name as value
  }
  cus-uks-prd-ss-av-udr-01 = {
    enable                = true
    RouteNames            = ["s_cus-uks-prd-ss-av-snet-01-d_On-Prem-Internet", "s_cus-uks-prd-ss-av-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "cus-uks-prd-ss-mgmt-vnet-01"
    RGName                = "cus-uks-prd-ss-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "morwip-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "morwip-udr-nexthop"  //key vault secret name as value
  }
  cus-uks-prd-ss-sccm-udr-01 = {
    enable                = true
    RouteNames            = ["s_cus-uks-prd-ss-sccm-snet-01-d_On-Prem-Internet", "s_cus-uks-prd-ss-sccm-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "cus-uks-prd-ss-mgmt-vnet-01"
    RGName                = "cus-uks-prd-ss-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "morwip-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "morwip-udr-nexthop"  //key vault secret name as value
  }
  cus-uks-prd-ss-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_cus-uks-prd-ss-pep-snet-01-d_On-Prem-Internet", "s_cus-uks-prd-ss-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "cus-uks-prd-ss-mgmt-vnet-01"
    RGName                = "cus-uks-prd-ss-mgmt-vnet-rg-01"
    kv_secret_udrprefixes = "morwip-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "morwip-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  cus-uks-prd-ss-adds-udr-01 = ["cus-uks-prd-ss-adds-snet-01"]
  cus-uks-prd-ss-av-udr-01   = ["cus-uks-prd-ss-av-snet-01"]
  cus-uks-prd-ss-sccm-udr-01 = ["cus-uks-prd-ss-sccm-snet-01"]
  cus-uks-prd-ss-pep-udr-01  = ["cus-uks-prd-ss-pep-snet-01"]
}

############ NSG ########################

nsg = {
  cus-uks-prd-ss-adds-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "cus-uks-prd-ss-mgmt-vnet-rg-01"
  }
  cus-uks-prd-ss-av-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "cus-uks-prd-ss-mgmt-vnet-rg-01"
  }
  cus-uks-prd-ss-sccm-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "cus-uks-prd-ss-mgmt-vnet-rg-01"
  }
  cus-uks-prd-ss-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "cus-uks-prd-ss-mgmt-vnet-rg-01"
  }
}

nsgrules = {
  cus-uks-prd-ss-adds-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-ADDS-ANY"
      description                                = "AIA-ADDS-ADDS-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-ADDS"
      description                                = "AIT-WAC-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-alzwac-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #added
      priority                                   = "500"
      name                                       = "AIT-AFS-ADDS"
      description                                = "AIT-AFS-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-ADDS"
      description                                = "AIT-ADO-ADDS"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ait-ssado-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-ADDS"
      description                                = "AIA-SECGOV-MID-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "aia-secgov-ssmid-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-ADDS"
      description                                = "AIA-SECGOV-TENABLE-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sstenable-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sspentest-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
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
      direction                                  = "Inbound" #Added
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
      name                                       = "AOA-ADDS-ADDS"
      description                                = "AOA-ADDS-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-ADDS-LOGA"
      description                                = "AOT-ADDS-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "aot-adds-loga-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500" // added
      name                                       = "AOT-ADDS-WSUS"
      description                                = "AOT-ADDS-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
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
      priority                                   = "510" // 500 changed
      name                                       = "AOT-ADDS-VNET"
      description                                = "AOT-ADDS-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" # added
      name                                       = "AOT-ADDS-TENABLEAGENT"
      description                                = "AOT-ADDS-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
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
      direction                                  = "Outbound" # added
      priority                                   = "600"
      name                                       = "AOT-ADDS-LINUXUPDATES"
      description                                = "AOT-ADDS-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
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
      name                                       = "AOT-ADDS-NTP"
      description                                = "AOT-ADDS-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
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
      priority                                   = "3000" // 2000 changed
      name                                       = "AOT-ADDS-AZUREAGENT-443"
      description                                = "AOT-ADDS-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
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
      priority                                   = "3050" // 2100 changed
      name                                       = "AOT-ADDS-AZURECLOUD-443"
      description                                = "AOT-ADDS-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-ADDS-AzureStorage"
      description                                = "AOT-ADDS-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #  direction                  = "Outbound"
    #   priority                   = "2400"
    #   name                       = "AOT-ADDS_Internet"
    #   description                = "AOT-ADDS_Internet"
    #   destination_port_range     = "443"
    #   protocol                   = "tcp"
    #   source_port_range          = "*"
    #   source_address_prefix      = "morwip-prd-ss-adds-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "Internet"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" // 4000 changed
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
      direction                                  = "Outbound" // added
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
      priority                                   = "2050"
      name                                       = "AIT-ONPREMRDP-ADDS"
      description                                = "AIT-ONPREMRDP-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-onprem-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2050"
      name                                       = "AOA-ADDS-ONPREM"
      description                                = "AOA-ADDS-ONPREM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-onprem-adds-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
  ]
  cus-uks-prd-ss-av-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-AV-ANY"
      description                                = "AIA-ADDS-AV-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-ALZWAC-AV"
      description                                = "AIT-ALZWAC-AV"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-alzwac-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #added
      priority                                   = "500"
      name                                       = "AIT-AFS-AV"
      description                                = "AIT-AFS-AV"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-AV"
      description                                = "AIT-ADO-AV"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ait-ssado-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-AV"
      description                                = "AIA-SECGOV-MID-AV"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "aia-secgov-ssmid-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-AV"
      description                                = "AIA-SECGOV-TENABLE-AV"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sstenable-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-AV"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sspentest-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-AV"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET" // updated
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
      direction                                  = "Inbound" // added
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
      name                                       = "AOA-AV-ADDS"
      description                                = "AOA-AV-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-AV-LOGA"
      description                                = "AOT-AV-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "aot-adds-loga-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500" // added
      name                                       = "AOT-AV-WSUS"
      description                                = "AOT-AV-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
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
      priority                                   = "510" // 500 changed
      name                                       = "AOT-AV-VNET"
      description                                = "AOT-AV-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" // added
      name                                       = "AOT-AV-TENABLEAGENT"
      description                                = "AOT-AV-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
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
      direction                                  = "Outbound" # added
      priority                                   = "600"
      name                                       = "AOT-AV-LINUXUPDATES"
      description                                = "AOT-AV-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
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
      name                                       = "AOT-AV-NTP"
      description                                = "AOT-AV-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
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
      priority                                   = "3000" // 2000 changed
      name                                       = "AOT-AV-AZUREAGENT-443"
      description                                = "AOT-AV-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
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
      priority                                   = "3050" // 2100 changed
      name                                       = "AOT-AV-AZURECLOUD-443"
      description                                = "AOT-AV-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
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
      name                                       = "AOT-AV-KMS"
      description                                = "AOT-AV-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-AV-AzureStorage"
      description                                = "AOT-AV-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2400"
    #   name                       = "AOT-ADDS_Internet"
    #   description                = "AOT-ADDS_Internet"
    #   destination_port_range     = "443"
    #   protocol                   = "tcp"
    #   source_port_range          = "*"
    #   source_address_prefix      = "morwip-prd-ss-av-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "Internet"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Outbound"
      priority                                   = "4050" // 4000 changed
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
      direction                                  = "Outbound" // added
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
      priority                                   = "2050"
      name                                       = "AIT-ONPREMRDP-AV"
      description                                = "AIT-ONPREMRDP-AV"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-onprem-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-av-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2050"
      name                                       = "AOA-AV-ONPREM"
      description                                = "AOA-AV-ONPREM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-av-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-onprem-adds-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
  ]
  cus-uks-prd-ss-sccm-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-SCCM-ANY"
      description                                = "AIA-ADDS-SCCM-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-SCCM"
      description                                = "AIT-WAC-SCCM"
      protocol                                   = "tcp"
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-alzwac-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" #added
      priority                                   = "500"
      name                                       = "AIT-AFS-SCCM"
      description                                = "AIT-AFS-SCCM"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-SCCM"
      description                                = "AIT-ADO-SCCM"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ait-ssado-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-SCCM"
      description                                = "AIA-SECGOV-MID-SCCM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "aia-secgov-ssmid-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-SCCM"
      description                                = "AIA-SECGOV-TENABLE-SCCM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sstenable-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-SCCM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sspentest-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-SCCM"
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
      priority                                   = "4096" // added
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
      name                                       = "AOA-SCCM-ADDS"
      description                                = "AOA-SCCM-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-SCCM-LOGA"
      description                                = "AOT-SCCM-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "aot-adds-loga-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500" // added
      name                                       = "AOT-SCCM-WSUS"
      description                                = "AOT-SCCM-WSUS"
      protocol                                   = "udp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
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
      priority                                   = "510" // 500 changed
      name                                       = "AOT-SCCM-VNET"
      description                                = "AOT-SCCM-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550" # added
      name                                       = "AOT-SCCM-TENABLEAGENT"
      description                                = "AOT-SCCM-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
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
      direction                                  = "Outbound" # added
      priority                                   = "600"
      name                                       = "AOT-SCCM-LINUXUPDATES"
      description                                = "AOT-SCCM-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
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
      name                                       = "AOT-SCCM-NTP"
      description                                = "AOT-SCCM-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
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
      priority                                   = "3000" // updated
      name                                       = "AOT-SCCM-AZUREAGENT-443"
      description                                = "AOT-SCCM-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
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
      name                                       = "AOT-SCCM-AZURECLOUD-443"
      description                                = "AOT-SCCM-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
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
      priority                                   = "3100" // updated
      name                                       = "AOT-SCCM-KMS"
      description                                = "AOT-SCCM-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-SCCM-AzureStorage"
      description                                = "AOT-SCCM-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Outbound"
    #   priority                   = "2400"
    #   name                       = "AOT-ADDS_Internet"
    #   description                = "AOT-ADDS_Internet"
    #   destination_port_range     = "443"
    #   protocol                   = "tcp"
    #   source_port_range          = "*"
    #   source_address_prefix      = "morwip-prd-ss-sccm-subnet-address-range"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "Internet"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
      direction                                  = "Inbound"
      priority                                   = "2050"
      name                                       = "AIT-ONPREMRDP-SCCM"
      description                                = "AIT-ONPREMRDP-SCCM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-onprem-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-sccm-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2050"
      name                                       = "AOA-SCCM-ONPREM"
      description                                = "AOA-SCCM-ONPREM"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-sccm-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ait-onprem-adds-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" // added
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
    }
  ]
  cus-uks-prd-ss-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-PEP-ANY"
      description                                = "AIA-ADDS-PEP-ANY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-adds-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
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
      destination_port_range                     = "5985,3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ait-alzwac-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // added
      priority                                   = "500"
      name                                       = "AIT-AFS-PEP"
      description                                = "AIT-AFS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-afs-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-PEP"
      description                                = "AIT-ADO-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ait-ssado-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" // updated
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PEP"
      description                                = "AIA-SECGOV-MID-PEP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "aia-secgov-ssmid-adds-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-PEP"
      description                                = "AIA-SECGOV-TENABLE-PEP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sstenable-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-PEP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "aia-secgov-sspentest-adds-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-pep-subnet-address-range"
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
      direction                                  = "Inbound" // added
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
      name                                       = "AOA-PEP-ADDS"
      description                                = "AOA-PEP-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "aot-adds-loga-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "510" // 500 changed
      name                                       = "AOT-ADDS-VNET"
      description                                = "AOT-ADDS-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "morwip-prd-ss-adds-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound" #Added as per Standard rule
      priority                                   = "500"
      name                                       = "AOT-PEP-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      name                                       = "AOT-PEP-TENABLEAGENT"
      description                                = "AOT-PEP-TENABLEAGENT"
      destination_port_range                     = "8834"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      name                                       = "AOT-PEP-LINUXUPDATES"
      description                                = "AOT-PEP-LINUXUPDATES"
      destination_port_range                     = "80,443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      name                                       = "AOT-PEP-NTP"
      description                                = "AOT-PEP-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      priority                                   = "3000"
      name                                       = "AOT-ADDS-AZUREAGENT-443"
      description                                = "AOT-ADDS-AZUREAGENT-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      name                                       = "AOT-ADDS-AZURECLOUD-443"
      description                                = "AOT-ADDS-AZURECLOUD-443"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      name                                       = "AOT-PEP-KMS"
      description                                = "AOT-PEP-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "23.102.135.246" //Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-ADDS-AzureStorage"
      description                                = "AOT-ADDS-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
      name                                       = "AOT-ADDS_Internet"
      description                                = "AOT-ADDS_Internet"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "morwip-prd-ss-pep-subnet-address-range"
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
    }
  ]
}

nsg_subnet_mapping = {
  cus-uks-prd-ss-adds-nsg-01 = {
    cus-uks-prd-ss-adds-snet-01 = true
  }
  cus-uks-prd-ss-av-nsg-01 = {
    cus-uks-prd-ss-av-snet-01 = true
  }
  cus-uks-prd-ss-sccm-nsg-01 = {
    cus-uks-prd-ss-sccm-snet-01 = true
  }
  cus-uks-prd-ss-pep-nsg-01 = {
    cus-uks-prd-ss-pep-snet-01 = true
  }
}
