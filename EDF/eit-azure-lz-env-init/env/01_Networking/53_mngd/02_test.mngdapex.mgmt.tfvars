environment = "Test"

#mgmtss key vault
apexKvName = "avmgentsthsmngdsub01kv"
apexRgName = ".security"

###########################################################################

rgs = {
  gen-uks-dev-hs-managed-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Sandpit"
    }
  }
}

vnets = {
  gen-uks-dev-hs-managed-vnet-01 = {
    enable        = true
    rg            = "gen-uks-dev-hs-managed-vnet-rg-01"
    addressSpace  = "apex-dev-vnet-address-range" //key vault secret name as value
    dnsServerList = "hs-tst-dns-ips"              //key vault secret name as value
    subnets = {
      gen-uks-dev-hs-apex-snet-01 = {
        enable                    = true
        address                   = "apex-dev-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-datagw-snet-01 = { //On-premise Data Gateway in Azure
        enable                    = true
        address                   = "datagw-dev-subnet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-pep-snet-01 = { //On-premise Data Gateway in Azure
        enable  = true
        address = "pep-dev-subnet-address-range" //key vault secret name as value
        # address                   = "GEN-MANAGED-DEV-PEP-SNET-SECRET"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-hpb-dvweb-snet-01 = {
        enable                    = true
        address                   = "HPBDVWEBSNET" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-dev-hs-hpb-dvapp-snet-01 = {
        enable                    = true
        address                   = "HPBDVAPPSNET" //key vault secret name as value
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
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-dev-hs-managed-vnet-01"
    peer2name = "gen-uks-dev-hs-managed-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"       //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"       //hub network
    vnet2rg   = "gen-uks-dev-hs-managed-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-dev-hs-managed-vnet-01"    //spoke network
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
  gen-uks-dev-hs-apex-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-dev-hs-apex-snet-01-d_On-Prem-Internet", "s_gen-uks-dev-hs-apex-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-managed-vnet-01"
    RGName                = "gen-uks-dev-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "apex-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "apex-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-dev-hs-datagw-udr-01 = { //On-premise Data Gateway in Azure
    enable                = true
    RouteNames            = ["s_gen-uks-dev-hs-datagw-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-managed-vnet-01"
    RGName                = "gen-uks-dev-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "apex-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "apex-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-dev-hs-pep-udr-01 = { //On-premise Data Gateway in Azure
    enable                = true
    RouteNames            = ["s_gen-uks-dev-hs-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-dev-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-managed-vnet-01"
    RGName                = "gen-uks-dev-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "apex-pep-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "apex-udr-nexthop"      //key vault secret name as value
  },
  gen-uks-dev-hs-hpb-dvweb-udr-01 = { //On-premise Data Gateway in Azure
    enable                = true
    RouteNames            = ["s_gen-uks-dev-hs-hpb-dvweb-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-managed-vnet-01"
    RGName                = "gen-uks-dev-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "apex-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "apex-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-dev-hs-hpb-dvapp-udr-01 = { //On-premise Data Gateway in Azure
    enable                = true
    RouteNames            = ["s_gen-uks-dev-hs-hpb-dvapp-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-dev-hs-managed-vnet-01"
    RGName                = "gen-uks-dev-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "apex-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "apex-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-dev-hs-apex-udr-01      = ["gen-uks-dev-hs-apex-snet-01"]
  gen-uks-dev-hs-datagw-udr-01    = ["gen-uks-dev-hs-datagw-snet-01"] //On-premise Data Gateway in Azure
  gen-uks-dev-hs-pep-udr-01       = ["gen-uks-dev-hs-pep-snet-01"]
  gen-uks-dev-hs-hpb-dvweb-udr-01 = ["gen-uks-dev-hs-hpb-dvweb-snet-01"]
  gen-uks-dev-hs-hpb-dvapp-udr-01 = ["gen-uks-dev-hs-hpb-dvapp-snet-01"]
}

############ NSG ########################

nsg = {
  gen-uks-dev-hs-apex-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-dev-hs-managed-vnet-rg-01"
  }
  gen-uks-dev-hs-datagw-nsg-01 = { //On-premise Data Gateway in Azure
    enable   = true
    location = "UK South"
    rg       = "gen-uks-dev-hs-managed-vnet-rg-01"
  }
  gen-uks-dev-hs-pep-nsg-01 = { //On-premise Data Gateway in Azure
    enable   = true
    location = "UK South"
    rg       = "gen-uks-dev-hs-managed-vnet-rg-01"
  }
  gen-uks-dev-hs-hpb-dvweb-nsg-01 = { //On-premise Data Gateway in Azure
    enable   = true
    location = "UK South"
    rg       = "gen-uks-dev-hs-managed-vnet-rg-01"
  }
  gen-uks-dev-hs-hpb-dvapp-nsg-01 = { //On-premise Data Gateway in Azure
    enable   = true
    location = "UK South"
    rg       = "gen-uks-dev-hs-managed-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-dev-hs-apex-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-APEXMGR"
      description                                = "AIA-ADDS-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-APEXMGR"
      description                                = "AIT-WAC-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985,22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "Azure MDW"
      description                                = "Azure MDW"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-mdw-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "Asset Suite 9"
      description                                = "Asset Suite 9"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-ast-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "650"
    #   name                       = "ICC (Integrated Competency Centre)"
    #   description                = "ICC (Integrated Competency Centre)"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,80,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = ""
    #   source_address_prefixes    = "apex-hs-ast-01-address-range"
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "apex-dev-subnet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefixes","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
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
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "JUMP_Server"
      description                                = "JUMP_Server"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,22,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-hs-jmp-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-APEXMGR"
      description                                = "AIA-SECGOV-MID-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-mid-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-APEXMGR"
      description                                = "AIA-SECGOV-TENABLE-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-tenable-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-APEXMGR"
      description                                = "AIA-SECGOV-PENTEST-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-pentst-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-APEX"
      description                                = "AIT-ADO-APEX"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "810"
      name                                       = "AIA-SECGOV-HSMID-APEX"
      description                                = "AIA-SECGOV-HSMID-APEX"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "860"
      name                                       = "AIA-SECGOV-HSTENABLE-APEX"
      description                                = "AIA-SECGOV-HSTENABLE-APEX"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-tenable-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "910"
      name                                       = "AIA-SECGOV-HSPENTEST-APEX"
      description                                = "AIA-SECGOV-HSPENTEST-APEX"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-pentest-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
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
      priority                                   = "541"
      name                                       = "AIA-ICMP-APEX-DEV-DB-WEB"
      description                                = "AIA-ICMP-APEX-DEV-DB-WEB"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-dev-address-ranges"
      destination_address_prefixes               = "mngdhs-apex-dev-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1001"
      name                                       = "AIA-PPCOREDEV-APEX-DEV-WEB"
      description                                = "AIA-PPCOREDEV-APEX-DEV-WEB"
      protocol                                   = "*"
      destination_port_range                     = "22,443,8080,8443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-dev-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1011"
      name                                       = "AIA-PPCOREDEV-APEX-DEV-DB"
      description                                = "AIA-PPCOREDEV-APEX-DEV-DB"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1522"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-dev-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA-HS-WAC-APEX-DEV"
      description                                = "AIA-HS-WAC-APEX-DEV"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngd-hs-wac-apex-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-dev-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "3011"
      name                                       = "AIA-APEX-DEV-DB-WEB"
      description                                = "AIA-APEX-DEV-DB-WEB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-dev-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-dev-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "3021"
      name                                       = "AIA-APEX-DEV-WEB-DB"
      description                                = "AIA-APEX-DEV-WEB-DB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-dev-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-dev-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-APEXMGR-ADDS"
      description                                = "AOA-APEXMGR-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-APEXMGR-LOGA"
      description                                = "AOT-APEXMGR-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      name                                       = "AOT-APEXMGR-Devices"
      description                                = "AOT-APEXMGR-Devices"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-devices-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "610"
      name                                       = "Azure(Integrated Competency Centre)"
      description                                = "Azure(Integrated Competency Centre)"
      protocol                                   = "tcp"
      destination_port_range                     = "8444,8443,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-icc-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-APEXMGR-AzureAgent"
      description                                = "AOT-APEXMGR-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      name                                       = "AOT-APEXMGR-AzureCloud"
      description                                = "AOT-APEXMGR-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      name                                       = "AOT-APEXMGR-KMS"
      description                                = "AOT-APEXMGR-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      priority                                   = "3300"
      name                                       = "AOT-APEXMGR-AzureStorage"
      description                                = "AOT-APEXMGR-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      protocol                                   = "tcp"
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
      priority                                   = "541"
      name                                       = "AOT-ICMP-APEX-DEV-DB-WEB"
      description                                = "AOT-ICMP-APEX-DEV-DB-WEB"
      protocol                                   = "ICMP"
      destination_port_range                     = "8080"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-dev-address-ranges"
      destination_address_prefixes               = "mngdhs-apex-dev-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3011"
      name                                       = "AOT-APEX-DEV-DB-WEB"
      description                                = "AOT-APEX-DEV-DB-WEB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-dev-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-dev-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3021"
      name                                       = "AOT-APEX-DEV-WEB-DB"
      description                                = "AOT-APEX-DEV-WEB-DB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-dev-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-dev-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3031"
      name                                       = "AOT-APEX-DEV-WEB-PPCOREDEV"
      description                                = "AOT-APEX-DEV-WEB-PPCOREDEV"
      protocol                                   = "*"
      destination_port_range                     = "22,443,8080,8443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-dev-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3041"
      name                                       = "AOT-APEX-DEV-DB-PPCOREDEV"
      description                                = "AOT-APEX-DEV-DB-PPCOREDEV"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1522"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-dev-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
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
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
      priority                                   = "500"
      name                                       = "AIT-AFS-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-afs-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-AFS--APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      name                                       = "AOT-APEXMGR-TENABLEAGENT"
      description                                = "AOT-APEXMGR-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-tenable-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "Apex-uat-linux-ntp-service"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "615"
      name                                       = "AOT-BPO-DEV-NSG02"
      description                                = "AOT-BPO-DEV-NSG02"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "apex-hs-bwd-axiom-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "620"
      name                                       = "AOT-BPO-DEV-NSG03"
      description                                = "AOT-BPO-DEV-NSG03"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-bwd-dataware-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "625"
      name                                       = "AOT-BPO-DEV-NSG04"
      description                                = "AOT-BPO-DEV-NSG04"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-bwd-prd-dataware-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "630"
      name                                       = "AOT-BPO-DEV-NSG05"
      description                                = "AOT-BPO-DEV-NSG05"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-mdw-anl-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOA-APEX-PEP"
      description                                = "AOA-APEX-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "pep-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-APEX-ICA"
      description                                = "AOT-APEX-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      priority                                   = "101"
      name                                       = "AOT-DEVBPO-BWD SMTP"
      description                                = "AOT-DEVBPO-BWD SMTP"
      protocol                                   = "tcp"
      destination_port_range                     = "25"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-bwd-smtp-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "102"
      name                                       = "AOT-DEVBPO-LOGA"
      description                                = "AOT-DEVBPO-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-sec-loga"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "103"
      name                                       = "AOT-DEVBPO-TENABLEAGENT"
      description                                = "AOT-DEVBPO-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-onprem-tenable"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "104"
      name                                       = "AOT-DEVBPO-LINUXUPDATES"
      description                                = "AOT-DEVBPO-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
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
      priority                                   = "105"
      name                                       = "AOT-DEVBPO-NTP"
      description                                = "AOT-DEVBPO-NTP"
      protocol                                   = "tcp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-azure-ntp"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "106"
      name                                       = "AOT-DEVBPO-TSTBPO"
      description                                = "AOT-DEVBPO-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range" // updated
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "107"
      name                                       = "AOT-DEVBPO-UATBPO"
      description                                = "AOT-DEVBPO-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "108"
      name                                       = "AOT-DEVBPO-PRDBPO"
      description                                = "AOT-DEVBPO-PRDBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-prd-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "109"
      name                                       = "AOT-DEVBPO-NGOTST01"
      description                                = "AOT-DEVBPO-NGOTST01"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-ngotst01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "110"
      name                                       = "AOT-DEVBPO-ngoliv01"
      description                                = "AOT-DEVBPO-ngoliv01"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-ngoliv01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "111"
      name                                       = "AOT-DEVBPO-NXAUAT01"
      description                                = "AOT-DEVBPO-NXAUAT01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-nxauat01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "112"
      name                                       = "AOT-DEVBPO-NXAPRD01"
      description                                = "AOT-DEVBPO-NXAPRD01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-nxaprd01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "113"
      name                                       = "AOT-DEVBPO-MDW_TST_ANL_SNET"
      description                                = "AOT-DEVBPO-MDW_TST_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-mdw-tst-analyse"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "114"
      name                                       = "AOT-DEVBPO-MDW_UAT_ANL_SNET"
      description                                = "AOT-DEVBPO-MDW_UAT_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-mdw-uat-analyse"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "115"
      name                                       = "AOT-DEVBPO-MDW_PRD_ANL_SNET"
      description                                = "AOT-DEVBPO-MDW_PRD_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-mdw-prd-analyse"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "116"
      name                                       = "AOT-DEVBPO-EAM_UAT_Next Axiom"
      description                                = "AOT-DEVBPO-EAM_UAT_Next Axiom"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-axiom-eam-uat-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "117"
      name                                       = "AOT-DEVBPO-EAM_PRD_NEXTAXIOM"
      description                                = "AOT-DEVBPO-EAM_PRD_NEXTAXIOM"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-axiom-eam-prd-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "118"
      name                                       = "AOT-DEVBPO-Azure_TST_OEM"
      description                                = "AOT-DEVBPO-Azure_TST_OEM"
      protocol                                   = "tcp"
      destination_port_range                     = "1159,4889-4898,4899-4908"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-tst"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "119"
      name                                       = "ICMP-BiDirectional-DEVBPO-Azure_TST_OEM"
      description                                = "ICMP-BiDirectional-DEVBPO-Azure_TST_OEM"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-tst"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "101"
      name                                       = "AIA-SECGOV-MID-DEVBPO"
      description                                = "AIA-SECGOV-MID-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-dev-bpo-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "102"
      name                                       = "AIA-SECGOV-TENABLE-DEVBPO"
      description                                = "AIA-SECGOV-TENABLE-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bpo-tenable"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "103"
      name                                       = "AIA-SECGOV-PENTEST-DEVBPO"
      description                                = "AIA-SECGOV-PENTEST-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bpo-pentest"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "104"
      name                                       = "AIT-MDW_DEV_ACQ-DEVBPO"
      description                                = "AIT-MDW_DEV_ACQ-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-mdw-acq-devbpo"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "105"
      name                                       = "AIT-MDW_DEV_ACQ_SNET-DEVBPO"
      description                                = "AIT-MDW_DEV_ACQ_SNET-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-dev-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "106"
      name                                       = "AIT-MDW_TST_ACQ_SNET-DEVBPO"
      description                                = "AIT-MDW_TST_ACQ_SNET-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-tst-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "107"
      name                                       = "AIT-MDW_UAT_ACQ_SNET-DEVBPO"
      description                                = "AIT-MDW_UAT_ACQ_SNET-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-uat-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "108"
      name                                       = "AIT-MDW_PRD_ACQ_SNET-DEVBPO"
      description                                = "AIT-MDW_PRD_ACQ_SNET-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-prd-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "109"
      name                                       = "AIT-Azure_TST_OEM-DEVBPO"
      description                                = "AIT-Azure_TST_OEM-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "22,1521-1522,3872"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "110"
      name                                       = "AIT-BWDJumpbox-Azure_TST_OEM"
      description                                = "AIT-BWDJumpbox-Azure_TST_OEM"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bwd-jump-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-tst"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "111"
      name                                       = "AIT-TSTBPO-DEVBPO"
      description                                = "AIT-TSTBPO-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "112"
      name                                       = "AIT-UATBPO-DEVBPO"
      description                                = "AIT-UATBPO-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOA-APEXHS-PEP"
      description                                = "AOA-APEXHS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-DEV-HS-APEX-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "113"
      name                                       = "AIT-DevWorkstations-DEVBPO"
      description                                = "AIT-DevWorkstations-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,22,445,80,443,8080,8443,1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-DevWorkstations-CI-jump"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "114"
      name                                       = "AIT-PRD_CI_App_Gateway-DEVBPO"
      description                                = "AIT-PRD_CI_App_Gateway-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = "PRD-CI-App-Gateway-DEVBPO"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1002"
      name                                       = "AOA-APEX-OEM"
      description                                = "AOA-APEX-OEM"
      protocol                                   = "*"
      destination_port_range                     = "4903"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "OEM-APEX"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIA-OEM-APEX"
      description                                = "AIA-OEM-APEX"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1524,2484-2488,3872-3873"
      source_port_range                          = "*"
      source_address_prefix                      = "OEM-APEX"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1170"
      name                                       = "APEX Dev to NxA Dev"
      description                                = "APEX Dev to NxA Dev"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-tst-hs-eam-shared-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-dev-hs-datagw-nsg-01 = [ //On-premise Data Gateway in Azure
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-DATAGW"
      description                                = "AIA-ADDS-DATAGW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WACASG-DATAGW"
      description                                = "AIT-WACASG-DATAGW"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985,22"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "datagw-onprime-rdp-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-HSADO-SNOW"
      description                                = "AIT-HSADO-SNOW"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-DATAGW"
      description                                = "AIA-SECGOV-HSMID-DATAGW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-mid-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-DATAGW"
      description                                = "AIA-SECGOV-HSTENABLE-DATAGW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-tenable-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-DATAGW"
      description                                = "AIA-SECGOV-HSPENTEST-DATAGW"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-pentst-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1000"
      name                                       = "AIT-DATASOURCE-DATAGW"
      description                                = "AIT-DATASOURCE-DATAGW"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "datagw-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
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
      priority                                   = "400"
      name                                       = "AOA-DATAGW-ADDS"
      description                                = "AOA-DATAGW-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-DATAGW-LOGA"
      description                                = "AOT-DATAGW-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
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
      name                                       = "AOT-DATAGW-WSUS"
      description                                = "AOT-DATAGW-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-devices-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-DATAGW-TENABLEAGENT"
      description                                = "AOT-DATAGW-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-tenable-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AOT-DATAGW-PowerBI"
      description                                = "AOT-DATAGW-PowerBI"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "PowerBI"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1050"
      name                                       = "AOT-DATAGW-ServiceBus"
      description                                = "AOT-DATAGW-ServiceBus"
      protocol                                   = "tcp"
      destination_port_range                     = "443,5671-5672,9350-9354"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ServiceBus"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1100"
      name                                       = "AOT-DATAGW-AzureAD"
      description                                = "AOT-DATAGW-AzureAD"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
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
      priority                                   = "1200"
      name                                       = "AOT-DATAGW-AzurePublic"
      description                                = "AOT-DATAGW-AzurePublic"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-DATAGW-AzureAgent"
      description                                = "AOT-DATAGW-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
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
      priority                                   = "3200"
      name                                       = "AOT-DATAGW-AzureCloud"
      description                                = "AOT-DATAGW-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
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
      priority                                   = "3300"
      name                                       = "AOT-DATAGW-AzureStorage"
      description                                = "AOT-DATAGW-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
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
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      protocol                                   = "tcp"
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
      priority                                   = "430"
      name                                       = "AOT-DATAGW-ICA"
      description                                = "AOT-DATAGW-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
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
      name                                       = "AOA-DATAGW-PEP"
      description                                = "AOA-DATAGW-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-DEV-HS-DATAGW-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1001"
      name                                       = "AOT-DATAGW-SQL"
      description                                = "AOT-DATAGW-SQL"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "datagw-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "DATAGW-SQL-ADDRESS-RANGE"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-dev-hs-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-VNET-PEP"
      description                                = "AIA-VNET-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-DEV-HS-MNGD-VNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "SECGOV-MID-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "SECGOV-TENABLE-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "SECGOV-PENTEST-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      priority                                   = "3000"
      name                                       = "AOT-PEP-AzureAgent"
      description                                = "AOT-PEP-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AZUREAGENT-SECRET" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      description                                = "DOA-VNET-INTERNETT"
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
      source_address_prefix                      = "pep-dev-subnet-address-range"
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
      source_address_prefix                      = "ADO-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-DEV-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "pep-dev-subnet-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "950"
      name                                       = "AIA-HPBWEB-PEP"
      description                                = "AIA-HPBWEB-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445,5432"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "pep-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "960"
      name                                       = "AIA-HPBAPP-PEP"
      description                                = "AIA-HPBAPP-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445,5432"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "pep-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-dev-hs-hpb-dvweb-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-HPBDVWEB"
      description                                = "AIA-ADDS-HPBDVWEB"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-HPBDVWEB"
      description                                = "AIT-WAC-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-MDW-HPBDVWEB"
      description                                = "AIT-MDW-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445,1521"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-mdw-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-EAM-HPBDVWEB"
      description                                = "AIT-EAM-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-ast-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-JUMPSVR-HPBDVWEB"
      description                                = "AIT-JUMPSVR-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-JUMPSVR-HPBDVWEB-APP"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    /*{
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-ONPREM-HPBDVWEB"
      description                                = "AIT-ONPREM-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Don't have Blue Network"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },*/
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-HPBDVWEB"
      description                                = "AIT-ADO-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-HPBDVWEB"
      description                                = "AIA-SECGOV-MID-HPBDVWEB"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-mid-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-HPBDVWEB"
      description                                = "AIA-SECGOV-TENABLE-HPBDVWEB"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-tenable-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-HPBDVWEB"
      description                                = "AIA-SECGOV-PENTEST-HPBDVWEB"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-pentst-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
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
      priority                                   = "400"
      name                                       = "AOA-HPBDVWEB-ADDS"
      description                                = "AOA-HPBDVWEB-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-HPBDVWEB-LOGA"
      description                                = "AOT-HPBDVWEB-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
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
      name                                       = "AOT-HPBDVWEB-Devices"
      description                                = "AOT-HPBDVWEB-Devices"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-devices-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-HPBDVWEB-TENABLEAGENT"
      description                                = "AOT-HPBDVWEB-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-tenable-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-HPBDVWEB-LINUXUPDATES"
      description                                = "AOT-HPBDVWEB-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
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
      name                                       = "AOT-HPBDVWEB-AFS"
      description                                = "AOT-HPBDVWEB-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-afs-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOT-HPBDVWEB-EAM"
      description                                = "AOT-HPBDVWEB-EAM"
      protocol                                   = "tcp"
      destination_port_range                     = "8444,8443,443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-axiom-eam-prd-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-HPBDVWEB-AzureAgent"
      description                                = "AOT-HPBDVWEB-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
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
      priority                                   = "3100"
      name                                       = "AOT-HPBDVWEB-AzureCloud"
      description                                = "AOT-HPBDVWEB-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
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
      name                                       = "AOT-HPBDVWEB-KMS"
      description                                = "AOT-HPBDVWEB-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
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
      priority                                   = "3300"
      name                                       = "AOT-HPBDVWEB-AzureStorage"
      description                                = "AOT-HPBDVWEB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
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
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      protocol                                   = "tcp"
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
      priority                                   = "750"
      name                                       = "AOT-HPBDVWEB-PEP"
      description                                = "AOT-HPBDVWEB-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445,5432"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVWEBSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "pep-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-INTERNET-VNET"
      description                                = "Deny-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "INTERNET"
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
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "INTERNET"
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
      name                                       = "AIT-ONPREM-HPBDVWEB"
      description                                = "AIT-ONPREM-HPBDVWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "BLUE-ON-PREM"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVWEBSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-dev-hs-hpb-dvapp-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-HPBDVAPP"
      description                                = "AIA-ADDS-HPBDVAPP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-HPBDVAPP"
      description                                = "AIT-WAC-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-MDW-HPBDVAPP"
      description                                = "AIT-MDW-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445,1521"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-mdw-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-EAM-HPBDVAPP"
      description                                = "AIT-EAM-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-ast-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-JUMPSVR-HPBDVAPP"
      description                                = "AIT-JUMPSVR-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-JUMPSVR-HPBDVWEB-APP"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    /*{
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-ONPREM-HPBDVAPP"
      description                                = "AIT-ONPREM-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "Don't have Blue Network"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },*/
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-HPBDVAPP"
      description                                = "AIT-ADO-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-HPBDVAPP"
      description                                = "AIA-SECGOV-MID-HPBDVAPP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-mid-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-HPBDVAPP"
      description                                = "AIA-SECGOV-TENABLE-HPBDVAPP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-tenable-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-HPBDVAPP"
      description                                = "AIA-SECGOV-PENTEST-HPBDVAPP"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-pentst-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
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
      priority                                   = "400"
      name                                       = "AOA-HPBDVAPP-ADDS"
      description                                = "AOA-HPBDVAPP-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-HPBDVAPP-LOGA"
      description                                = "AOT-HPBDVAPP-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
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
      name                                       = "AOT-HPBDVAPP-Devices"
      description                                = "AOT-HPBDVAPP-Devices"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-devices-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-HPBDVAPP-TENABLEAGENT"
      description                                = "AOT-HPBDVAPP-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-tenable-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-HPBDVAPP-LINUXUPDATES"
      description                                = "AOT-HPBDVAPP-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
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
      name                                       = "AOT-HPBDVAPP-AFS"
      description                                = "AOT-HPBDVAPP-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-afs-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOT-HPBDVAPP-EAM"
      description                                = "AOT-HPBDVAPP-EAM"
      protocol                                   = "tcp"
      destination_port_range                     = "8444,8443,443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-axiom-eam-prd-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-HPBDVAPP-AzureAgent"
      description                                = "AOT-HPBDVAPP-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
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
      priority                                   = "3100"
      name                                       = "AOT-HPBDVAPP-AzureCloud"
      description                                = "AOT-HPBDVAPP-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
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
      name                                       = "AOT-HPBDVAPP-KMS"
      description                                = "AOT-HPBDVAPP-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
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
      priority                                   = "3300"
      name                                       = "AOT-HPBDVAPP-AzureStorage"
      description                                = "AOT-HPBDVAPP-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
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
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      protocol                                   = "tcp"
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
      priority                                   = "750"
      name                                       = "AOT-HPBDVAPP-PEP"
      description                                = "AOT-HPBDVAPP-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445,5432"
      source_port_range                          = "*"
      source_address_prefix                      = "HPBDVAPPSNET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "pep-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "Deny-INTERNET-VNET"
      description                                = "Deny-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "INTERNET"
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
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "INTERNET"
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
      name                                       = "AIT-ONPREM-HPBDVAPP"
      description                                = "AIT-ONPREM-HPBDVAPP"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "BLUE-ON-PREM"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "HPBDVAPPSNET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
}

nsg_subnet_mapping = {
  gen-uks-dev-hs-apex-nsg-01 = {
    gen-uks-dev-hs-apex-snet-01 = true
  }
  gen-uks-dev-hs-datagw-nsg-01 = { //On-premise Data Gateway in Azure
    gen-uks-dev-hs-datagw-snet-01 = true
  }
  gen-uks-dev-hs-pep-nsg-01 = { //On-premise Data Gateway in Azure
    gen-uks-dev-hs-pep-snet-01 = true
  }
  gen-uks-dev-hs-hpb-dvweb-nsg-01 = { //On-premise Data Gateway in Azure
    gen-uks-dev-hs-hpb-dvweb-snet-01 = true
  }
  gen-uks-dev-hs-hpb-dvapp-nsg-01 = { //On-premise Data Gateway in Azure
    gen-uks-dev-hs-hpb-dvapp-snet-01 = true
  }
}
########### NSG Diag Settings ############
category1enabled     = true
retention_policy     = true
retention_policydays = 90
category1            = "NetworkSecurityGroupEvent"
category2            = "NetworkSecurityGroupRuleCounter"
apex_nsg_name        = "gen-uks-dev-hs-apex-nsg-01"
pep_nsg_name         = "gen-uks-dev-hs-pep-nsg-01"
datagw_nsg_name      = "gen-uks-dev-hs-datagw-nsg-01"
dvweb_nsg_name       = "gen-uks-dev-hs-hpb-dvweb-nsg-01"
dvapp_nsg_name       = "gen-uks-dev-hs-hpb-dvapp-nsg-01"
nsg_rg_name          = "gen-uks-dev-hs-managed-vnet-rg-01"

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
category3                 = "VMProtectionAlerts"
category4                 = "AllMetrics"
diag_vnet_name            = "gen-uks-dev-hs-managed-vnet-01"
diag_vnet_rg              = "gen-uks-dev-hs-managed-vnet-rg-01"
