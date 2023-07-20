locals {
  ######## Pre processing the subnets which are set to enable true ##################
  rgs        = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }
  vnets      = { for vnet in keys(var.vnets) : vnet => var.vnets[vnet] if var.vnets[vnet].enable == true }
  _subnets   = [for vnet in keys(local.vnets) : { for subnet in keys(local.vnets[vnet].subnets) : subnet => merge({ vnetname = vnet }, local.vnets[vnet].subnets[subnet]) if local.vnets[vnet].subnets[subnet].enable == true }]
  subnets    = merge(local._subnets...)
  subnet_ids = { for subnet in azurerm_subnet.subnets : subnet.name => subnet.id }
  vnet_ids   = { for vnet in azurerm_virtual_network.vnets : vnet.name => vnet.id }

  UDR = { for udr in keys(var.UDR) : udr => var.UDR[udr] if var.UDR[udr]["enable"] == true }
  # ############################### UDR loop ######################
  _udr_prefixes  = { for secret in data.azurerm_key_vault_secret.apex-udr-prefixes : secret.name => secret.value... }
  udr_prefixes   = { for udr in keys(var.UDR) : udr => split(",", local._udr_prefixes[var.UDR[udr]["kv_secret_udrprefixes"]][0]) }
  _udr_nexthopIp = { for secret in data.azurerm_key_vault_secret.apex-udr-nexthop : secret.name => secret.value... }
  udr_nexthopIp  = { for udr in keys(var.UDR) : udr => [local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0], local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0]] }

  # Enabled_UDR         = keys(local.UDR)
  # UDRSubnets          = toset(flatten([for udr in keys(var.UDR_Subnet_Mapping) : var.UDR_Subnet_Mapping[udr] if contains(local.Enabled_UDR, udr)]))

  RouteTableIDs       = { for routetable in module.apexuatNetworkUdrs : routetable.routetable_name => routetable.routetable_id }
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

  # ################ Private endpoint ##################

  # subId                         = data.azurerm_key_vault_secret.spokeSubscriptionId.value
  # laAzMonitorPrivateLinkScopeId = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/microsoft.insights/privateLinkScopes/${var.laPrivateServiceConnName}"
  # saAzMonitorPrivateLinkScopeId = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/microsoft.automation/automationAccounts/${var.saPrivateServiceConnName}"

}
########## NSG Diag SettingS ###############
locals {
  diag_settings = {
    "apex_nsg-diag-setting" = {
      resource_ids     = data.azurerm_network_security_group.apex_nsg.id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
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
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
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
    "vnet-diag-setting_logs" = {
      resource_ids     = data.azurerm_virtual_network.apexuaths_vnet.id
      law_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category3
        enabled  = var.category_enabled
        retention_policy = {
          enabled = var.retention_policy_enabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category4
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
    },
    "vnet-diag-setting_metrics" = {
      resource_ids     = data.azurerm_virtual_network.apexuaths_vnet.id
      law_workspace_id = data.azurerm_key_vault_secret.hsmgmt-laworkspaceResourceId.value
      diagnostic_log = [{
        category = var.category3
        enabled  = var.category_disabled
        retention_policy = {
          enabled = var.retention_policy_disabled
          days    = var.retention_policydays
        }
        }
      ]
      diagnostic_metrics = [{
        category = var.category4
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
