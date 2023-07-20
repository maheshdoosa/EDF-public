tfvars = {
  # init
  subscription_id = "aa2950c5-4c1e-41b7-ad10-38537bf033b1"
  tenant_id       = "191bf9b4-af72-44f9-825d-81b189aa4d38"
}
region = {
  "uksouth" = {
    location = "uksouth" 
    resource_groups = [
      {
        name = "rg-hub-cpl-cn-uks-01"
      }
    ]
    networks = [
      {
        id                  = "hub"
        resource_group_name = "rg-hub-cpl-cn-uks-01"
        virtual_networks    = [
          {          
            name                 = "vnet-hub-cpl-cn-uks-01"
            address_space        = ["10.64.0.0/24"]
            dns_servers          = null
            is_ddos_enabled      = false
          },
          {          
            name                 = "vnet-P2Svpn-cpl-cn-uks-01"
            address_space        = ["10.64.1.0/24"]
            dns_servers          = null
            is_ddos_enabled      = false
          }
        ]
        subnets = [
          { 
            name                 = "AzureBastionSubnet"
            virtual_network_name = "vnet-hub-cpl-cn-uks-01"
            service_endpoints    = null
            address_prefixes     = ["10.64.0.64/26"]
            route_table_name     = null
            nsg_name             = "nsg-bas-cpl-cn-uks-01"
          },
          { 
            name                 = "AzureFirewallSubnet"
            virtual_network_name = "vnet-hub-cpl-cn-uks-01"
            service_endpoints    = null
            address_prefixes     = ["10.64.0.0/26"]
            route_table_name     = "udr-hub-cpl-cn-uks-01"
            nsg_name             = null
          },
          { 
            name                 = "GatewaySubnet"
            virtual_network_name = "vnet-P2Svpn-cpl-cn-uks-01"
            service_endpoints    = null
            address_prefixes     = ["10.64.1.0/25"]
            route_table_name     = "udr-P2Svpn-cpl-cn-uks-01"
            nsg_name             = null
          }
        ]
        route_tables = [
          { 
            name   = "udr-hub-cpl-cn-uks-01"
            routes = [
              {
                route_name             = "routeToInternet"
                address_prefix         = "0.0.0.0/0"
                next_hop_type          = "Internet"
                next_hop_in_ip_address = null
              }
            ]
          },
          { 
            name   = "udr-P2Svpn-cpl-cn-uks-01"
            routes = []
          }
        ]
        nsgs = [{
            name      = "nsg-bas-cpl-cn-uks-01"
            nsg_rules = [
              {
                name                         = "AllowHttpsInBound"
                priority                     = 120
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "Tcp"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["Internet"]
                destination_address_prefixes = ["*"]
              }, 
              {
                name                         = "AllowGatewayManagerInBound"
                priority                     = 130
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["GatewayManager"]
                destination_address_prefixes = ["*"]
              }, 
              {
                name                         = "AllowLoadBalancerInBound"
                priority                     = 140
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "Tcp"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["AzureLoadBalancer"]
                destination_address_prefixes = ["*"]
              }, 
              {
                name                         = "AllowBastionHostCommunication"
                priority                     = 150
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["8080","5701"]
                source_address_prefixes      = ["VirtualNetwork"]
                destination_address_prefixes = ["VirtualNetwork"]
              },
              {
                name                         = "AllowSshRdpOutBound"
                priority                     = 100
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["22","3389"]
                source_address_prefixes      = ["*"]
                destination_address_prefixes = ["VirtualNetwork"]
              },
              {
                name                         = "AllowAzureCloudCommunicationOutBound"
                priority                     = 110
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "Tcp"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["*"]
                destination_address_prefixes = ["AzureCloud"]
              },
              {
                name                         = "AllowBastionHostCommunicationOutBound"
                priority                     = 120
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["8080","5701"]
                source_address_prefixes      = ["VirtualNetwork"]
                destination_address_prefixes = ["VirtualNetwork"]
              },
              {
                name                         = "AllowGetSessionInformationOutBound"
                priority                     = 130
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["80"]
                source_address_prefixes      = ["*"]
                destination_address_prefixes = ["Internet"]
              }
            ]
        }]
      }
    ]
    public_ips = [
      {
        name                    = "pip-bas-cpl-cn-uks-01"
        resource_group_name     = "rg-hub-cpl-cn-uks-01"
        allocation_method       = "Static"
        sku                     = "Standard"
        idle_timeout_in_minutes = "30"
        ip_version              = "IPv4"
      },
      {
        name                    = "pip-hubfw-cpl-cn-uks-01"
        resource_group_name     = "rg-hub-cpl-cn-uks-01"
        allocation_method       = "Static"
        sku                     = "Standard"
        zones                   = ["1"]
        idle_timeout_in_minutes = "30"
        ip_version              = "IPv4"
      },
      {
        name                    = "pip-P2Svpn-cpl-cn-uks-01"
        resource_group_name     = "rg-hub-cpl-cn-uks-01"
        allocation_method       = "Static"
        sku                     = "Standard"
        idle_timeout_in_minutes = "30"
        ip_version              = "IPv4"
      }
    ]
    bastions = [
      {
        name                          = "bas-cpl-cn-uks-01"
        resource_group_name           = "rg-hub-cpl-cn-uks-01"
        ip_configuration_name         = "IPConfiguration"
        public_ip_name                = "pip-bas-cpl-cn-uks-01"
        sku                           = "Standard"
        copy_paste_enabled            = "true"
        file_copy_enabled             = "true"
        ip_connect_enabled            = "true"
        scale_units                   = "2"
        shareable_link_enabled        = "true"
        tunneling_enabled             = "true"
      }
    ]
    firewall = {
      name                          = "afw-hub-cpl-cn-uks-01"
      virtual_network_name          = "vnet-hub-cpl-cn-uks-01"
      resource_group_name           = "rg-hub-cpl-cn-uks-01"
      sku_name                      = "AZFW_VNet"
      sku_tier                      = "Premium"
      zones                         = ["1"]
      ip_configuration_name         = "IPConfiguration"
      public_ip_name                = "pip-hubfw-cpl-cn-uks-01"
      policy_name                   = "afwp-hub-cpl-cn-uks-01"
      policy_resource_group_name    = "rg-hub-cpl-cn-uks-01"
    }
    azurerm_virtual_network_gateways = [
      {
        name                          = "vgw-P2Svpn-cpl-cn-uks-01"
        resource_group_name           = "rg-hub-cpl-cn-uks-01"
        public_ip_name                = "pip-P2Svpn-cpl-cn-uks-01"
        type                          = "Vpn"
        vpn_type                      = "RouteBased"
        active_active                 = false
        enable_bgp                    = false
        sku                           = "VpnGw1"
        ip_configuration_name         = "IPConfiguration"
        private_ip_address_allocation = "Dynamic"
        address_space                 = ["10.75.0.0/23"]
        # root_certificate_name         = "DigiCert-Federated-ID-Root-CA"
        # root_certificate_data         = ""
        vpn_client_protocols          = ["OpenVPN"]
        aad_tenant                    = "https://login.microsoftonline.com/191bf9b4-af72-44f9-825d-81b189aa4d38" 
        aad_audience                  = "41b23e61-6c1e-4545-b367-cd054e0ed4b4" 
        aad_issuer                    = "https://sts.windows.net/191bf9b4-af72-44f9-825d-81b189aa4d38/"
        vpn_auth_types                = ["AAD"]
      }
    ]
    virtual_network_peerings = [
      {
        id                                         = "HubToCore"
        allow_forwarded_traffic                    = false
        allow_gateway_transit                      = true
        allow_virtual_network_access               = true
        spoke_virtual_network_resource_group_name  = "rg-hub-cpl-cn-uks-01"
        spoke_virtual_network_name                 = "vnet-hub-cpl-cn-uks-01"
        hub_subscription_id                        = "dd3acce9-259b-454a-8b91-2b697a7dab8a"
        hub_virtual_network_resource_group_name    = "rg-core-cpl-mg-uks-01"
        hub_virtual_network_name                   = "vnet-core-cpl-mg-uks-01"
      },
      {
        id                                         = "HubToPba"
        allow_forwarded_traffic                    = false
        allow_gateway_transit                      = true
        allow_virtual_network_access               = true
        spoke_virtual_network_resource_group_name  = "rg-hub-cpl-cn-uks-01"
        spoke_virtual_network_name                 = "vnet-hub-cpl-cn-uks-01"
        hub_subscription_id                        = "dd3acce9-259b-454a-8b91-2b697a7dab8a"
        hub_virtual_network_resource_group_name    = "rg-pba-cpl-mg-uks-01"
        hub_virtual_network_name                   = "vnet-pba-cpl-mg-uks-01"
      },
      {
        id                                         = "HubToIam"
        allow_forwarded_traffic                    = false
        allow_gateway_transit                      = true
        allow_virtual_network_access               = true
        spoke_virtual_network_resource_group_name  = "rg-hub-cpl-cn-uks-01"
        spoke_virtual_network_name                 = "vnet-hub-cpl-cn-uks-01"
        hub_subscription_id                        = "b209c130-3a69-429d-90e0-f2639f5411f7"
        hub_virtual_network_resource_group_name    = "rg-iam-cpl-id-uks-01"
        hub_virtual_network_name                   = "vnet-iam-cpl-id-uks-01"
      },
      {
        id                                         = "HubToIamEUN"
        allow_forwarded_traffic                    = false
        allow_gateway_transit                      = true
        allow_virtual_network_access               = true
        spoke_virtual_network_resource_group_name  = "rg-hub-cpl-cn-uks-01"
        spoke_virtual_network_name                 = "vnet-hub-cpl-cn-uks-01"
        hub_subscription_id                        = "b209c130-3a69-429d-90e0-f2639f5411f7"
        hub_virtual_network_resource_group_name    = "rg-iam-cpl-id-eun-01"
        hub_virtual_network_name                   = "vnet-iam-cpl-id-eun-01"
      }
    ]
    monitor_diagnostic_shared_settings = {
      log_analytics_workspace_subscription_id     = "9d34b6fd-76e7-41f3-8d91-33a1e9aa4488"
      log_analytics_workspace_resource_group_name = "rg-sent-cpl-sec-uks-01"
      log_analytics_workspace_name                = "la-log-cpl-sec-uks-01"
    }
  },
  "northeurope" = {
    location = "northeurope" 
    resource_groups = [
      {
        name = "rg-hub-cpl-cn-eun-01"
      }
    ]
    networks = [
      {
        id                  = "hub"
        resource_group_name = "rg-hub-cpl-cn-eun-01"
        virtual_networks    = [
          {          
            name                 = "vnet-hub-cpl-cn-eun-01"
            address_space        = ["10.164.0.0/24"]
            dns_servers          = null
            is_ddos_enabled      = false
          },
          {          
            name                 = "vnet-P2Svpn-cpl-cn-eun-01"
            address_space        = ["10.164.1.0/24"]
            dns_servers          = null
            is_ddos_enabled      = false
          }
        ]
        subnets = [
          { 
            name                 = "AzureBastionSubnet"
            virtual_network_name = "vnet-hub-cpl-cn-eun-01"
            service_endpoints    = null
            address_prefixes     = ["10.164.0.64/26"]
            route_table_name     = null
            nsg_name             = "nsg-bas-cpl-cn-eun-01"
          },
          { 
            name                 = "AzureFirewallSubnet"
            virtual_network_name = "vnet-hub-cpl-cn-eun-01"
            service_endpoints    = null
            address_prefixes     = ["10.164.0.0/26"]
            route_table_name     = "udr-hub-cpl-cn-eun-01"
            nsg_name             = null
          },
          { 
            name                 = "GatewaySubnet"
            virtual_network_name = "vnet-P2Svpn-cpl-cn-eun-01"
            service_endpoints    = null
            address_prefixes     = ["10.164.1.0/25"]
            route_table_name     = "udr-P2Svpn-cpl-cn-eun-01"
            nsg_name             = null
          }
        ]
        route_tables = [
          { 
            name   = "udr-hub-cpl-cn-eun-01"
            routes = [
              {
                route_name             = "routeToInternet"
                address_prefix         = "0.0.0.0/0"
                next_hop_type          = "Internet"
                next_hop_in_ip_address = null
              }
            ]
          },
          { 
            name   = "udr-P2Svpn-cpl-cn-eun-01"
            routes = []
          }
        ]
        nsgs = [{
            name      = "nsg-bas-cpl-cn-eun-01"
            nsg_rules = [
              {
                name                         = "AllowHttpsInBound"
                priority                     = 120
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "Tcp"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["Internet"]
                destination_address_prefixes = ["*"]
              }, 
              {
                name                         = "AllowGatewayManagerInBound"
                priority                     = 130
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["GatewayManager"]
                destination_address_prefixes = ["*"]
              }, 
              {
                name                         = "AllowLoadBalancerInBound"
                priority                     = 140
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "Tcp"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["AzureLoadBalancer"]
                destination_address_prefixes = ["*"]
              }, 
              {
                name                         = "AllowBastionHostCommunication"
                priority                     = 150
                direction                    = "Inbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["8080","5701"]
                source_address_prefixes      = ["VirtualNetwork"]
                destination_address_prefixes = ["VirtualNetwork"]
              },
              {
                name                         = "AllowSshRdpOutBound"
                priority                     = 100
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["22","3389"]
                source_address_prefixes      = ["*"]
                destination_address_prefixes = ["VirtualNetwork"]
              },
              {
                name                         = "AllowAzureCloudCommunicationOutBound"
                priority                     = 110
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "Tcp"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["443"]
                source_address_prefixes      = ["*"]
                destination_address_prefixes = ["AzureCloud"]
              },
              {
                name                         = "AllowBastionHostCommunicationOutBound"
                priority                     = 120
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["8080","5701"]
                source_address_prefixes      = ["VirtualNetwork"]
                destination_address_prefixes = ["VirtualNetwork"]
              },
              {
                name                         = "AllowGetSessionInformationOutBound"
                priority                     = 130
                direction                    = "Outbound"
                access                       = "Allow"
                protocol                     = "*"
                source_port_ranges           = ["*"]
                destination_port_ranges      = ["80"]
                source_address_prefixes      = ["*"]
                destination_address_prefixes = ["Internet"]
              }
            ]
        }]
      }
    ]
    public_ips = [
      {
        name                    = "pip-bas-cpl-cn-eun-01"
        resource_group_name     = "rg-hub-cpl-cn-eun-01"
        allocation_method       = "Static"
        sku                     = "Standard"
        idle_timeout_in_minutes = "30"
        ip_version              = "IPv4"
      },
      {
        name                    = "pip-hubfw-cpl-cn-eun-01"
        resource_group_name     = "rg-hub-cpl-cn-eun-01"
        allocation_method       = "Static"
        sku                     = "Standard"
        zones                   = ["1"]
        idle_timeout_in_minutes = "30"
        ip_version              = "IPv4"
      },
      {
        name                    = "pip-P2Svpn-cpl-cn-eun-01"
        resource_group_name     = "rg-hub-cpl-cn-eun-01"
        allocation_method       = "Static"
        sku                     = "Standard"
        idle_timeout_in_minutes = "30"
        ip_version              = "IPv4"
      }
    ]
    bastions = [
      {
        name                          = "bas-cpl-cn-eun-01"
        resource_group_name           = "rg-hub-cpl-cn-eun-01"
        ip_configuration_name         = "IPConfiguration"
        subnet_name                   = "AzureBastionSubnet"
        subnet_vnet_name              = "vnet-hub-cpl-cn-eun-01"
        subnet_resource_group_name    = "rg-hub-cpl-cn-eun-01"
        public_ip_name                = "pip-bas-cpl-cn-eun-01"
        public_ip_resource_group_name = "rg-hub-cpl-cn-eun-01"
        sku                           = "Standard"
        copy_paste_enabled            = "true"
        file_copy_enabled             = "true"
        ip_connect_enabled            = "true"
        scale_units                   = "2"
        shareable_link_enabled        = "true"
        tunneling_enabled             = "true"
      }
    ]
    firewall = {
      name                          = "afw-hub-cpl-cn-eun-01"
      virtual_network_name          = "vnet-hub-cpl-cn-eun-01"
      resource_group_name           = "rg-hub-cpl-cn-eun-01"
      sku_name                      = "AZFW_VNet"
      sku_tier                      = "Premium"
      zones                         = ["1"]
      ip_configuration_name         = "IPConfiguration"
      subnet_name                   = "AzureFirewallSubnet"
      subnet_vnet_name              = "vnet-hub-cpl-cn-eun-01"
      subnet_resource_group_name    = "rg-hub-cpl-cn-eun-01"
      public_ip_name                = "pip-hubfw-cpl-cn-eun-01"
      public_ip_resource_group_name = "rg-hub-cpl-cn-eun-01"
      policy_name                   = "afwp-hub-cpl-cn-eun-01"
      policy_resource_group_name    = "rg-hub-cpl-cn-eun-01"
    }
    azurerm_virtual_network_gateways = [
      {
        name                          = "vgw-P2Svpn-cpl-cn-eun-01"
        resource_group_name           = "rg-hub-cpl-cn-eun-01"
        subnet_name                   = "GatewaySubnet"
        subnet_vnet_name              = "vnet-P2Svpn-cpl-cn-eun-01"
        subnet_resource_group_name    = "rg-hub-cpl-cn-eun-01"
        public_ip_name                = "pip-P2Svpn-cpl-cn-eun-01"
        public_ip_resource_group_name = "rg-hub-cpl-cn-eun-01"
        type                          = "Vpn"
        vpn_type                      = "RouteBased"
        active_active                 = false
        enable_bgp                    = false
        sku                           = "VpnGw1"
        ip_configuration_name         = "IPConfiguration"
        private_ip_address_allocation = "Dynamic"
        address_space                 = ["10.175.0.0/23"]
        # root_certificate_name         = "DigiCert-Federated-ID-Root-CA"
        # root_certificate_data         = ""
        vpn_client_protocols          = ["OpenVPN"]
        aad_tenant                    = "https://login.microsoftonline.com/191bf9b4-af72-44f9-825d-81b189aa4d38" 
        aad_audience                  = "41b23e61-6c1e-4545-b367-cd054e0ed4b4" 
        aad_issuer                    = "https://sts.windows.net/191bf9b4-af72-44f9-825d-81b189aa4d38/"
        vpn_auth_types                = ["AAD"]
      }
    ]
    virtual_network_peerings = [
      {
        id                                         = "HubToIam"
        allow_forwarded_traffic                    = false
        allow_gateway_transit                      = true
        allow_virtual_network_access               = true
        spoke_virtual_network_resource_group_name  = "rg-hub-cpl-cn-eun-01"
        spoke_virtual_network_name                 = "vnet-hub-cpl-cn-eun-01"
        hub_subscription_id                        = "b209c130-3a69-429d-90e0-f2639f5411f7"
        hub_virtual_network_resource_group_name    = "rg-iam-cpl-id-eun-01"
        hub_virtual_network_name                   = "vnet-iam-cpl-id-eun-01"
      }
    ]
    monitor_diagnostic_shared_settings = {
      log_analytics_workspace_subscription_id     = "9d34b6fd-76e7-41f3-8d91-33a1e9aa4488"
      log_analytics_workspace_resource_group_name = "rg-sent-cpl-sec-uks-01"
      log_analytics_workspace_name                = "la-log-cpl-sec-uks-01"
    }
  }
}