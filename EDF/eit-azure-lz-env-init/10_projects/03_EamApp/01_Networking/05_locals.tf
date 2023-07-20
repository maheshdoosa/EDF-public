locals {
  ######## Pre processing the subnets which are set to enable true ##################
  rgs        = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }
  vnets      = { for vnet in keys(var.vnets) : vnet => var.vnets[vnet] if var.vnets[vnet].enable == true }
  _subnets   = [for vnet in keys(local.vnets) : { for subnet in keys(local.vnets[vnet].subnets) : subnet => merge({ vnetname = vnet }, local.vnets[vnet].subnets[subnet]) if local.vnets[vnet].subnets[subnet].enable == true }]
  subnets    = merge(local._subnets...)
  subnet_ids = { for subnet in azurerm_subnet.subnets : subnet.name => subnet.id }
  vnet_ids   = { for vnet in azurerm_virtual_network.vnets : vnet.name => vnet.id }
  UDR        = { for udr in keys(var.UDR) : udr => var.UDR[udr] if var.UDR[udr]["enable"] == true }
  ############################### UDR loop ######################
  _udr_prefixes  = { for secret in data.azurerm_key_vault_secret.eam-udr-prefixes : secret.name => secret.value... }
  udr_prefixes   = { for udr in keys(var.UDR) : udr => split(",", local._udr_prefixes[var.UDR[udr]["kv_secret_udrprefixes"]][0]) }
  _udr_nexthopIp = { for secret in data.azurerm_key_vault_secret.eam-udr-nexthop : secret.name => secret.value... }
  #udr_nexthopIp  = { for udr in keys(var.UDR) : udr => [local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], "", "", local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0]] }
  udr_nexthopIp = { for udr in keys(var.UDR) : udr => [local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0]] }


  # Enabled_UDR         = keys(local.UDR)
  # UDRSubnets          = toset(flatten([for udr in keys(var.UDR_Subnet_Mapping) : var.UDR_Subnet_Mapping[udr] if contains(local.Enabled_UDR, udr)]))
  RouteTableIDs       = { for routetable in module.udrs : routetable.routetable_name => routetable.routetable_id }
  _UDR_Subnet_Mapping = [for udr in keys(var.UDR_Subnet_Mapping) : { for subnet in var.UDR_Subnet_Mapping[udr] : "${udr}-${subnet}" => { routetable = udr, subnet = subnet } }]
  UDR_Subnet_Mapping  = merge(local._UDR_Subnet_Mapping...)
  ########################### VNet loop ##########################################
  vnet_address_secret_names   = [for vnet in keys(local.vnets) : local.vnets[vnet].addressSpace]
  subnet_address_secret_names = flatten([for vnet in keys(local.vnets) : [for subnet in keys(local.vnets[vnet].subnets) : local.vnets[vnet].subnets[subnet].address]])
  vnet_secret_names           = tolist(toset(concat(local.vnet_address_secret_names, local.subnet_address_secret_names, local.vnet_dns_secret_names)))
  vnet_secrets                = { for secret in data.azurerm_key_vault_secret.vnet_secrets : secret.name => split(",", secret.value) }
  vnet_dns_secret_names       = [for vnet in keys(local.vnets) : local.vnets[vnet].dnsServerList]


}

########## Diag SettingS ###############
locals {
  diag_settings = {
    "vnet-diag-setting_logs" = {
      resource_ids     = data.azurerm_virtual_network.eamapp_vnet.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category2
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
    },
    "vnet-diag-setting_metrics" = {
      resource_ids     = data.azurerm_virtual_network.eamapp_vnet.id
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category1
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category2
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
    }
  }
}
