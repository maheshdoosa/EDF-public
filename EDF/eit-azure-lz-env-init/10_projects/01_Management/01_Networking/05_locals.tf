locals {
  ######## Pre processing the subnets which are set to enable true ##################
  rgs        = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }
  vnets      = { for vnet in keys(var.vnets) : vnet => var.vnets[vnet] if var.vnets[vnet].enable == true }
  _subnets   = [for vnet in keys(local.vnets) : { for subnet in keys(local.vnets[vnet].subnets) : subnet => merge({ vnetname = vnet }, local.vnets[vnet].subnets[subnet]) if local.vnets[vnet].subnets[subnet].enable == true }]
  subnets    = merge(local._subnets...)
  subnet_ids = { for subnet in azurerm_subnet.subnets : subnet.name => subnet.id }
  #  vnet_ids   = { for vnet in azurerm_virtual_network.vnets : vnet.name => vnet.id }

  UDR = { for udr in keys(var.UDR) : udr => var.UDR[udr] if var.UDR[udr]["enable"] == true }
  # ############################### UDR loop ######################
  _udr_prefixes  = { for secret in data.azurerm_key_vault_secret.mgmtss-udr-prefixes : secret.name => secret.value... }
  udr_prefixes   = { for udr in keys(var.UDR) : udr => split(",", local._udr_prefixes[var.UDR[udr]["kv_secret_udrprefixes"]][0]) }
  _udr_nexthopIp = { for secret in data.azurerm_key_vault_secret.mgmtss-udr-nexthop : secret.name => secret.value... }
  udr_nexthopIp  = { for udr in keys(var.UDR) : udr => [local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0]] }


  # Enabled_UDR         = keys(local.UDR)
  # UDRSubnets          = toset(flatten([for udr in keys(var.UDR_Subnet_Mapping) : var.UDR_Subnet_Mapping[udr] if contains(local.Enabled_UDR, udr)]))

  RouteTableIDs       = { for routetable in module.mgmthsNetworkUdrs : routetable.routetable_name => routetable.routetable_id }
  _UDR_Subnet_Mapping = [for udr in keys(var.UDR_Subnet_Mapping) : { for subnet in var.UDR_Subnet_Mapping[udr] : "${udr}-${subnet}" => { routetable = udr, subnet = subnet } }]
  UDR_Subnet_Mapping  = merge(local._UDR_Subnet_Mapping...)

  ########################### VNet loop ##########################################
  vnet_address_secret_names   = [for vnet in keys(local.vnets) : local.vnets[vnet].addressSpace]
  subnet_address_secret_names = flatten([for vnet in keys(local.vnets) : [for subnet in keys(local.vnets[vnet].subnets) : local.vnets[vnet].subnets[subnet].address]])
  vnet_secret_names           = tolist(toset(concat(local.vnet_address_secret_names, local.subnet_address_secret_names, local.vnet_dns_secret_names)))
  vnet_secrets                = { for secret in data.azurerm_key_vault_secret.vnet_secrets : secret.name => split(",", secret.value) }
  vnet_dns_secret_names       = [for vnet in keys(local.vnets) : local.vnets[vnet].dnsServerList]
  ############### NSGs #######################
  # Filter enabled nsg
  nsg = { for nsg in keys(var.nsg) : nsg => var.nsg[nsg] if var.nsg[nsg].enable == true }

  # Map : NSGName-SubnetName -> Map(NSG, Subnet)
  nsg_subnets = merge([for nsg in keys(local.nsg) : { for subnet in keys(var.nsg_subnet_mapping[nsg]) : "${nsg}-${subnet}" => { nsg = nsg, subnet = subnet } if var.nsg_subnet_mapping[nsg][subnet] == true }]...)

  # List of unique secret names from all the nsg(enabled) rules to fetch from keyvault
  nsgrules_kvsecretnames = tolist(toset(flatten(flatten([for nsg in keys(local.nsg) : [for rule in var.nsgrules[nsg] : [for kvattr in rule.fetch_from_kv : rule[kvattr]]]]))))

  # List of unique secret names from all the nsg(enabled) rules to fetch from asg
  nsgrules_asg = compact(tolist(toset(flatten(flatten(flatten([for nsg in keys(local.nsg) : [for rule in var.nsgrules[nsg] : [for asgattr in rule.fetch_from_asg : split(",", rule[asgattr])]]]))))))

  # Map : ASGName -> ASGId
  asg_ids = { for asg in data.azurerm_application_security_group.asg : asg.name => asg.id }

  # Map: SecretName -> SecretValue
  nsgrules_kvsecretvalues = { for secret in data.azurerm_key_vault_secret.nsgrule_secrets : secret.name => secret.value }

  # Map: NSG -> List of rules with rendered secret values (if any)
  _nsgrules = { for nsg in keys(local.nsg) : nsg => [for rule in var.nsgrules[nsg] : merge(rule, { for kvattr in rule.fetch_from_kv : kvattr => local.nsgrules_kvsecretvalues[rule[kvattr]] })] }

  # Map: NSG -> List of rules with rendered asg ids (if any)
  nsgrules = { for nsg in keys(local._nsgrules) : nsg => [for rule in local._nsgrules[nsg] : merge(rule, { for asgattr in rule.fetch_from_asg : asgattr => join(",", [for asg in split(",", rule[asgattr]) : local.asg_ids[asg]]) if rule[asgattr] != "" })] }

  # Map : NSGName -> NSGID
  nsg_ids = { for nsg in module.nsgs : nsg.network_security_group_name => nsg.network_security_group_id }

}

########## NSG Diag SettingS ###############
locals {
  diag_settings = {
    "imagebuilder_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.imagebuilder_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "ado_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.ado_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "afs_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.afs_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    # "snow01_nsg-diag-setting" = {
    #     resource_ids = data.azurerm_network_security_group.snow01_nsg.id
    #     law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
    #     diagnostic_log= [ {
    #        category = var.category1
    #        enabled  = var.category1enabled
    #        retention_policy = {
    #          enabled = var.retention_policy
    #          days    = var.retention_policydays
    #        }
    #     },
    #        {
    #        category = var.category2
    #        enabled  = var.category1enabled
    #        retention_policy = {
    #          enabled = var.retention_policy
    #          days    = var.retention_policydays
    #        } }
    #      ]
    #      diagnostic_metrics = []
    # },
    # "snow02_nsg-diag-setting" = {
    #     resource_ids = data.azurerm_network_security_group.snow02_nsg.id
    #     law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
    #     diagnostic_log= [ {
    #        category = var.category1
    #        enabled  = var.category1enabled
    #        retention_policy = {
    #          enabled = var.retention_policy
    #          days    = var.retention_policydays
    #        }
    #     },
    #        {
    #        category = var.category2
    #        enabled  = var.category1enabled
    #        retention_policy = {
    #          enabled = var.retention_policy
    #          days    = var.retention_policydays
    #        } }
    #      ]
    #      diagnostic_metrics = []
    # },
    "adds_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.adds_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "audit_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.audit_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "ca_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.ca_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "mgmt_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.mgmt_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "wac_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.wac_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "wsus_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.wsus_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    },
    "pep_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.pep_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category1enabled
        retention_policy = {
          enabled = var.retention_policy
          days    = var.retention_policydays
        }
        },
        {
          category = var.category2
          enabled  = var.category1enabled
          retention_policy = {
            enabled = var.retention_policy
            days    = var.retention_policydays
        } }
      ]
      diagnostic_metrics = []
    }
  }
}

###################### Existing code ##########
# locals {
#      tranVNetAddSpace = data.azurerm_key_vault_secret.transitVnetAddressSpace.value
#      hsManageVNetAddSpace = data.azurerm_key_vault_secret.hsManageVnetAddressSpace.value
#      internetAddPrefix = "0.0.0.0/0"


#      #mgmt-routes
#      mgmtRouteNextHopIps = [data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#      mgmtRoutePrefixes = [local.internetAddPrefix]

#      #ad-routes
#      adRouteNextHopIps = [data.azurerm_key_vault_secret.t2fw-ilb-ip.value, data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#      t1intsnetAddPrefix = cidrsubnet(local.tranVNetAddSpace, 4, 1) #eit-alz-t1int-snet-01
#      t2intsnetAddPrefix = cidrsubnet(local.tranVNetAddSpace, 4, 4) #eit-alz-t2int-snet-01
#      adRoutePrefixes = [local.t1intsnetAddPrefix, local.t2intsnetAddPrefix]

#      #wsus-routes
#      wsusRouteNextHopIps = [data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#      wsusRoutePrefixes = [local.internetAddPrefix]

#      #wac-routes
#      wacRouteNextHopIps = [data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#      wacRoutePrefixes = [local.internetAddPrefix]

#      #pki-routes
#      pkiRouteNextHopIps = [data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#      pkiRoutePrefixes = [local.internetAddPrefix]

#      #audit-routes
#      auditRouteNextHopIps = [data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#      auditRoutePrefixes = [local.internetAddPrefix]

#      #adds-nsg
#      addsNsgRules = [
#      {
#           direction                   = "Inbound"
#           priority                    = "500"
#           name                        = "AIT-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "tcp"
#           source_address_prefix       = local.hsManageVNetAddSpace
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AIT-VNET_ADDS"
#      },
#      {
#           direction                   = "Inbound"
#           priority                    = "600"
#           name                        = "AIU-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "udp"
#           source_address_prefix       = local.hsManageVNetAddSpace
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AIT-VNET_ADDS"
#      },
#      {
#           direction                   = "Inbound"
#           priority                    = "4000"
#           name                        = "Deny-VNET_VNET"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "VirtualNetwork"
#           access                      = "Deny"
#           description                 = "Deny-VNET_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "500"
#           name                        = "AOT-ADDS_VNET"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "tcp"
#           source_address_prefix       = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           source_port_range           = "*"
#           destination_address_prefix  = local.hsManageVNetAddSpace
#           access                      = "Allow"
#           description                 = "AOT-ADDS_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "600"
#           name                        = "AOU-ADDS_VNET"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "udp"
#           source_address_prefix       = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           source_port_range           = "*"
#           destination_address_prefix  = local.hsManageVNetAddSpace
#           access                      = "Allow"
#           description                 = "AOT-ADDS_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "700"
#           name                        = "AOT-ADDS_WAC"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           source_port_range           = "*"
#           destination_address_prefix  = local.hsManageVNetAddSpace
#           access                      = "Allow"
#           description                 = "AOT-ADDS_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2000"
#           name                        = "AOT-ADDS_AzureAgent"
#           destination_port_range      = "*"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "168.63.129.16/32" #MS fixed address prefix
#           access                      = "Allow"
#           description                 = "AOT-ADDS_AzureAgent"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2100"
#           name                        = "AOT-ADDS_AzureCloud"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           access                      = "Allow"
#           description                 = "AOT-ADDS_AzureCloud"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2200"
#           name                        = "AOT-ADDS_AzureStorage"
#           destination_port_range      = "443, 445"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           access                      = "Allow"
#           description                 = "AOT-ADDS_AzureStorage"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2300"
#           name                        = "AOT-ADDS_KMS"
#           destination_port_range      = "1688"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           access                      = "Allow"
#           description                 = "AOT-ADDS_KMS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2400"
#           name                        = "AOT-ADDS_WSUS"
#           destination_port_range      = "80,443,8530,8531"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 9)
#           access                      = "Allow"
#           description                 = "AOT-ADDS_WSUS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "4000"
#           name                        = "Deny_Internet"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "*"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           access                      = "Deny"
#           description                 = "Deny_Internet"
#      }
#   ]

# #wsus-nsg
# wsusNsgRules = [
#      {
#           direction                   = "Inbound"
#           priority                    = "500"
#           name                        = "AIT-VNET_WSUS"
#           destination_port_range      = "80,443,8530,8531"
#           protocol                    = "tcp"
#           source_address_prefix       = local.hsManageVNetAddSpace
#           source_port_range           = "*"
#           destination_address_prefix  = "VirtualNetwork"
#           access                      = "Allow"
#           description                 = "AIT-VNET_WSUS"
#      },
#      {
#           direction                   = "Inbound"
#           priority                    = "4000"
#           name                        = "Deny-VNET_VNET"
#           destination_port_range      = "*"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "VirtualNetwork"
#           access                      = "Deny"
#           description                 = "Deny-VNET_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "500"
#           name                        = "AOT-VNET_Internet"
#           destination_port_range      = "80,443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AOT-ADDS_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "700"
#           name                        = "AOU-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "udp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AOT-ADDS_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2000"
#           name                        = "AOT-WAC_AzureAgent"
#           destination_port_range      = "*"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "168.63.129.16/32" #MS fixed address prefix
#           access                      = "Allow"
#           description                 = "AOT-WAC_AzureAgent"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2100"
#           name                        = "AOT-WAC_AzureCloud"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           access                      = "Allow"
#           description                 = "AOT-WAC_AzureCloud"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2200"
#           name                        = "AOT-WAC_AzureStorage"
#           destination_port_range      = "443,445"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           access                      = "Allow"
#           description                 = "AOT-WAC_AzureCloud"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2300"
#           name                        = "AOT-WAC_KMS"
#           destination_port_range      = "1688"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           access                      = "Allow"
#           description                 = "AOT-WAC_KMS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "4000"
#           name                        = "Deny_Internet"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "*"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           access                      = "Deny"
#           description                 = "Deny_Internet"
#      }
#   ]

# #wac-nsg
# wacNsgRules = [
#      {
#           direction                   = "Inbound"
#           priority                    = "500"
#           name                        = "AIT-VNET_WAC"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 10)
#           access                      = "Allow"
#           description                 = "AIT-VNET_WAC"
#      },
#      {
#           direction                   = "Inbound"
#           priority                    = "600"
#           name                        = "AIT-EDF_Clients_VNET"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork" #to be updated later
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 10)
#           access                      = "Allow"
#           description                 = "AIT-EDF_Clients_VNET"
#      },
#      {
#           direction                   = "Inbound"
#           priority                    = "700"
#           name                        = "AIT- BastionHost_VNET"
#           destination_port_range      = "3389"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork" #to be updated later
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 10)
#           access                      = "Allow"
#           description                 = "AIT- BastionHost_VNET"
#      },
#      {
#           direction                   = "Inbound"
#           priority                    = "4000"
#           name                        = "Deny-VNET_VNET"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "VirtualNetwork"
#           access                      = "Deny"
#           description                 = "Deny-VNET_VNET"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "600"
#           name                        = "AOT-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AOT-VNET_ADDS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "700"
#           name                        = "AOU-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "udp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AOT-VNET_ADDS"
#      },
#      # {
#      #      direction                   = "Outbound"
#      #      priority                    = "800"
#      #      name                        = "AOT-VNET_CA"
#      #      destination_port_range      = "135, 443, 49152-65535"
#      #      protocol                    = "tcp"
#      #      source_address_prefix       = "VirtualNetwork"
#      #      source_port_range           = "*"
#      #      #destination_address_prefix  = "${data.azurerm_key_vault_secret.pkiIp1.value}, ${data.azurerm_key_vault_secret.pkiIp2.value}"
#      #      destination_address_prefix  = ""
#      #      access                      = "Allow"
#      #      description                 = "AOT-VNET_ADDS"
#      # },
#      {
#           direction                   = "Outbound"
#           priority                    = "2000"
#           name                        = "AOT-WAC_AzureAgent"
#           destination_port_range      = "135, 443, 49152-65535"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "168.63.129.16/32" #this is static MS address
#           access                      = "Allow"
#           description                 = "AOT-WAC_AzureAgent"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2100"
#           name                        = "AOT-WAC_AzureCloud"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           access                      = "Allow"
#           description                 = "AOT-WAC_AzureCloud"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2200"
#           name                        = "OT-WAC_AzureStorage"
#           destination_port_range      = "443,445"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           access                      = "Allow"
#           description                 = "OT-WAC_AzureStorage"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2300"
#           name                        = "AOT-WAC_KMS"
#           destination_port_range      = "1688"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           access                      = "Allow"
#           description                 = "AOT-WAC_KMS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2400"
#           name                        = "AOT-WAC_WSUS"
#           destination_port_range      = "80,443,8530,8531"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 8)
#           access                      = "Allow"
#           description                 = "AOT-WAC_WSUS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "4000"
#           name                        = "Deny_Internet"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "*"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           access                      = "Deny"
#           description                 = "Deny_Internet"
#      }
#   ]

# #ca-nsg
# caNsgRules = [
#      {
#           direction                   = "Inbound"
#           priority                    = "500"
#           name                        = "AIT-VNET_PKI"
#           destination_port_range      = "443,135,49152-65535"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = null
#           destination_address_prefixes= ("${data.azurerm_key_vault_secret.pkiIp1.value},${data.azurerm_key_vault_secret.pkiIp2.value}")
#           access                      = "Allow"
#           description                 = "AIT-VNET_PKI"
#       },
#      {
#           direction                   = "Inbound"
#           priority                    = "4000"
#           name                        = "Deny-VNET_VNET"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefixes= null
#           destination_address_prefix  = "VirtualNetwork"
#           access                      = "Deny"
#           description                 = "Deny-VNET_VNET"
#      },
#           {
#           direction                   = "Outbound"
#           priority                    = "500"
#           name                        = "AOT-PKI_ADDS"
#           description                 = "AOT-PKI_ADDS"
#           destination_port_range      = "464,389,636"
#           protocol                    = "tcp"
#           source_address_prefixes     = ("${data.azurerm_key_vault_secret.pkiIp1.value},${data.azurerm_key_vault_secret.pkiIp2.value}")
#           source_address_prefix       = null
#           source_port_range           = "*"
#           destination_address_prefix  = null
#           destination_address_prefixes= ("${data.azurerm_key_vault_secret.adDcIp1.value},${data.azurerm_key_vault_secret.adDcIp2.value}")
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "600"
#           name                        = "AOT-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = null
#           destination_address_prefixes= ("${data.azurerm_key_vault_secret.adDcIp1.value},${data.azurerm_key_vault_secret.adDcIp2.value}")
#           access                      = "Allow"
#           description                 = "AOT-VNET_ADDS"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "700"
#           name                        = "AOU-VNET_ADDS"
#           description                 = "AOU-VNET_ADDS"
#           destination_port_range      = "53,88,123,135,137,138,139,389,445,636,3268,3269"
#           protocol                    = "udp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = null
#           destination_address_prefixes= ("${data.azurerm_key_vault_secret.adDcIp1.value},${data.azurerm_key_vault_secret.adDcIp2.value}")
#           access                      = "Allow"

#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2000"
#           name                        = "AOT-PKI_AzureAgent"
#           description                 = "AOT-PKI_AzureAgent"
#           destination_port_range      = "*"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = "168.63.129.16/32" ##MS cider - publicly available
#           destination_address_prefixes= null
#           access                      = "Allow"

#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2100"
#           name                        = "AOT-PKI_AzureCloud"
#           description                 = "AOT-PKI_AzureCloud"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           destination_address_prefixes= null
#           access                      = "Allow"

#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2200"
#           name                        = "AOT-PKI_AzureStorage"
#           description                 = "AOT-PKI_AzureStorage"
#           destination_port_range      = "443,445"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           destination_address_prefixes= null
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2300"
#           name                        = "AOT-PKI_KMS"
#           description                 = "AOT-PKI_KMS"
#           destination_port_range      = "1688"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           destination_address_prefixes= null
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2400"
#           name                        = "AOT-PKI_WSUS"
#           description                 = "AOT-PKI_WSUS"
#           destination_port_range      = "80,443,8530,8531"
#           protocol                    = "tcp"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = cidrsubnet(local.hsManageVNetAddSpace, 6, 9)
#           destination_address_prefixes= null
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "4000"
#           name                        = "Deny_Internet"
#           description                 = "Deny_Internet"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "*"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           destination_address_prefixes= null
#           access                      = "Deny"
#      }
#   ]


# #audit-nsg
# auditNsgRules = [
#      {
#           direction                   = "Inbound"
#           priority                    = "4000"
#           name                        = "Deny-VNET_VNET"
#           description                 = "Deny-VNET_VNET"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefix       = "VirtualNetwork"
#           source_address_prefixes     = null
#           source_port_range           = "*"
#           destination_address_prefix  = "VirtualNetwork"
#           destination_address_prefixes= null
#           access                      = "Deny"
#       },
#       {
#           direction                   = "Outbound"
#           priority                    = "2000"
#           name                        = "AOT-Audit_AzureAgent"
#           description                 = "AOT-Audit_AzureAgent"
#           destination_port_range      = "*"
#           protocol                    = "tcp"
#           source_address_prefixes     = null
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "168.63.129.16/32" # MS static CIDR - publicly available
#           destination_address_prefixes= null
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2100"
#           name                        = "AOT-Audit_AzureCloud"
#           description                 = "AOT-Audit_AzureCloud"
#           destination_port_range      = "443"
#           protocol                    = "tcp"
#           source_address_prefixes     = null
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           destination_address_prefixes= null
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "2200"
#           name                        = "AOT-Audit_AzureStorage"
#           description                 = "AOT-Audit_AzureStorage"
#           destination_port_range      = "443,445"
#           protocol                    = "tcp"
#           source_address_prefixes     = null
#           source_address_prefix       = "VirtualNetwork"
#           source_port_range           = "*"
#           destination_address_prefix  = "AzureCloud.UKSouth"
#           destination_address_prefixes= null
#           access                      = "Allow"
#      },
#      {
#           direction                   = "Outbound"
#           priority                    = "4000"
#           name                        = "Deny_Internet"
#           description                 = "Deny_Internet"
#           destination_port_range      = "*"
#           protocol                    = "*"
#           source_address_prefixes     = null
#           source_address_prefix       = "*"
#           source_port_range           = "*"
#           destination_address_prefix  = "Internet"
#           destination_address_prefixes= null
#           access                      = "Deny"
#      }
#   ]

# }
