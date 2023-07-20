locals {
  ######## Pre processing the subnets which are set to enable true ##################
  rgs      = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }
  vnets    = { for vnet in keys(var.vnets) : vnet => var.vnets[vnet] if var.vnets[vnet].enable == true }
  _subnets = [for vnet in keys(local.vnets) : { for subnet in keys(local.vnets[vnet].subnets) : subnet => merge({ vnetname = vnet }, local.vnets[vnet].subnets[subnet]) if local.vnets[vnet].subnets[subnet].enable == true }]
  subnets  = merge(local._subnets...)
  subnet_ids = { for subnet in azurerm_subnet.subnets : subnet.name => subnet.id }
  vnet_ids   = { for vnet in azurerm_virtual_network.vnets : vnet.name => vnet.id }

  ########################### VNet loop ##########################################
  vnet_address_secret_names   = [for vnet in keys(local.vnets) : local.vnets[vnet].addressSpace]
  subnet_address_secret_names = flatten([for vnet in keys(local.vnets) : [for subnet in keys(local.vnets[vnet].subnets) : local.vnets[vnet].subnets[subnet].address]])
  vnet_secret_names           = tolist(toset(concat(local.vnet_address_secret_names, local.subnet_address_secret_names, local.vnet_dns_secret_names)))
  vnet_secrets                = { for secret in data.azurerm_key_vault_secret.vnet_secrets : secret.name => split(",", secret.value) }
  vnet_dns_secret_names       = [for vnet in keys(local.vnets) : local.vnets[vnet].dnsServerList]



  UDR = { for udr in keys(var.UDR) : udr => var.UDR[udr] if var.UDR[udr]["enable"] == true }

  ############################### UDR loop ######################
  _udr_prefixes  = { for secret in data.azurerm_key_vault_secret.transit-udr-prefixes : secret.name => secret.value... }
  udr_prefixes   = { for udr in keys(var.UDR) : udr => split(",", local._udr_prefixes[var.UDR[udr]["kv_secret_udrprefixes"]][0]) }
  _udr_nexthopIp = { for secret in data.azurerm_key_vault_secret.transit-udr-nexthop : secret.name => secret.value... }
  udr_nexthopIp  = { for udr in keys(var.UDR) : udr => split(",", local._udr_nexthopIp[var.UDR[udr]["kv_secret_nexthopIP"]][0]) }


  # Enabled_UDR         = keys(local.UDR)
  # UDRSubnets          = toset(flatten([for udr in keys(var.UDR_Subnet_Mapping) : var.UDR_Subnet_Mapping[udr] if contains(local.Enabled_UDR, udr)]))
  # RouteTableIDs       = { for routetable in module.transithsNetworkUdrs : routetable.routetable_name => routetable.routetable_id }
  # _UDR_Subnet_Mapping = [for udr in keys(var.yt) : { for subnet in var.UDR_Subnet_Mapping[udr] : "${udr}-${subnet}" => { routetable = udr, subnet = subnet } }]
    RouteTableIDs       = { for routetable in module.transithsNetworkUdrs : routetable.routetable_name => routetable.routetable_id }
  _UDR_Subnet_Mapping = [for udr in keys(var.UDR_Subnet_Mapping) : { for subnet in var.UDR_Subnet_Mapping[udr] : "${udr}-${subnet}" => { routetable = udr, subnet = subnet } }]
  UDR_Subnet_Mapping  = merge(local._UDR_Subnet_Mapping...)
}

### Old Code #####

# locals {
#   tranVNetAddSpace     = data.azurerm_key_vault_secret.transitVnetAddressSpace.value
#   hsManageVNetAddSpace = data.azurerm_key_vault_secret.hsManageVnetAddressSpace.value

#   #t1fw-internal
#   t1fwIntRouteNextHopIps   = ["", "", data.azurerm_key_vault_secret.t2fw-ilb-ip.value]
#   t1fwIntAddPrefixMgmtSnet = cidrsubnet(local.tranVNetAddSpace, 4, 3) #eit-alz-t1mgmt-snet-01
#   t1fwIntAddPrefixExtSnet  = cidrsubnet(local.tranVNetAddSpace, 4, 0) #eit-alz-t1ext-snet-01
#   t1fwIntRoutePrefixes     = [local.t1fwIntAddPrefixMgmtSnet, local.t1fwIntAddPrefixExtSnet, local.hsManageVNetAddSpace]

#   #t1fw-external
#   t1fwExtRouteNextHopIps   = ["", "", ""]
#   t1fwExtAddPrefixMgmtSnet = cidrsubnet(local.tranVNetAddSpace, 4, 3) #eit-alz-t1mgmt-snet-01
#   t1fwExtAddPrefixIntSnet  = cidrsubnet(local.tranVNetAddSpace, 4, 1) #eit-alz-t1int-snet-01
#   t1fwExtRoutePrefixes     = [local.t1fwExtAddPrefixMgmtSnet, local.t1fwExtAddPrefixIntSnet, local.hsManageVNetAddSpace]

#   #t1fw-management
#   t1fwMgmtRouteNextHopIps  = ["", "", "", ""]
#   t1fwMgmtAddPrefixExtSnet = cidrsubnet(local.tranVNetAddSpace, 4, 0)  #eit-alz-t1ext-snet-01
#   t1fwMgmtAddPrefixIntSnet = cidrsubnet(local.tranVNetAddSpace, 4, 1)  #eit-alz-t1int-snet-01
#   t1fwMgmtAddPrefixGwSnet  = cidrsubnet(local.tranVNetAddSpace, 5, 31) #GatewaySubnet
#   t1fwMgmtRoutePrefixes    = [local.t1fwMgmtAddPrefixExtSnet, local.t1fwMgmtAddPrefixIntSnet, local.hsManageVNetAddSpace, local.t1fwMgmtAddPrefixGwSnet]

#   #t2fw-internal
#   t2fwIntRouteNextHopIps   = ["", data.azurerm_key_vault_secret.t1fw-ilb-ip.value]
#   t2fwIntAddPrefixMgmtSnet = cidrsubnet(local.tranVNetAddSpace, 4, 5) #eit-alz-t2mgmt-snet-01
#   t2fwIntAddPrefixIntrSnet = "0.0.0.0/0"                              #internet
#   t2fwIntRoutePrefixes     = [local.t2fwIntAddPrefixMgmtSnet, local.t2fwIntAddPrefixIntrSnet]

#   #t2fw-management
#   t2fwMgmtRouteNextHopIps   = ["", "", data.azurerm_key_vault_secret.t1fw-ilb-ip.value, ""]
#   t2fwMgmtAddPrefixIntSnet  = cidrsubnet(local.tranVNetAddSpace, 4, 4)  #eit-alz-t2int-snet-01
#   t2fwMgmtAddPrefixIntrSnet = "0.0.0.0/0"                               #internet
#   t2fwMgmtAddPrefixGwSnet   = cidrsubnet(local.tranVNetAddSpace, 5, 31) #GatewaySubnet
#   t2fwMgmtRoutePrefixes     = [local.t2fwMgmtAddPrefixIntSnet, local.hsManageVNetAddSpace, local.t2fwMgmtAddPrefixIntrSnet, local.t2fwMgmtAddPrefixGwSnet]

#   #t1fw-hasync
#   t1fwHaSyncRouteNextHopIps   = ["", "", "", ""]
#   t1fwHaSyncAddPrefixExtSnet  = cidrsubnet(local.tranVNetAddSpace, 4, 0) #eit-alz-t1ext-snet-01
#   t1fwHaSyncAddPrefixIntSnet  = cidrsubnet(local.tranVNetAddSpace, 4, 1) #eit-alz-t1int-snet-01
#   t1fwHaSyncAddPrefixMgmtSnet = cidrsubnet(local.tranVNetAddSpace, 4, 3) #eit-alz-t1mgmt-snet-01
#   t1fwHaSyncRoutePrefixes     = [local.t1fwHaSyncAddPrefixExtSnet, local.t1fwHaSyncAddPrefixIntSnet, local.hsManageVNetAddSpace, local.t1fwHaSyncAddPrefixMgmtSnet]

#   #   ######## Pre processing the subnets which are set to enable true ##################
#   # rgs        = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }
#   # vnets      = { for vnet in keys(var.vnets) : vnet => var.vnets[vnet] if var.vnets[vnet].enable == true }
#   # _subnets   = [for vnet in keys(local.vnets) : { for subnet in keys(local.vnets[vnet].subnets) : subnet => merge({ vnetname = vnet }, local.vnets[vnet].subnets[subnet]) if local.vnets[vnet].subnets[subnet].enable == true }]
#   # subnets    = merge(local._subnets...)
#   # subnet_ids = { for subnet in azurerm_subnet.subnets : subnet.name => subnet.id }
#   # vnet_ids   = { for vnet in azurerm_virtual_network.vnets : vnet.name => vnet.id }

# }
# /*
# #t1fw-internal
# module "t1fwIntGetNextHopIps" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-kv"

#   spName = data.azurerm_key_vault_secret.contributorSpName.value
#   spSecret = data.azurerm_key_vault_secret.contributorSpSecret.value
#   tenant = data.azurerm_key_vault_secret.tenantId.value
#   subscriptionId = data.azurerm_key_vault_secret.subscriptionId.value

#   vaultName = "eitlztransitkv"
#   secretsName  = var.t1fwIntRouteNextHopIpSecrets
# }
# #t1fw-external
# module "t1fwExtGetNextHopIps" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-kv"

#   spName = data.azurerm_key_vault_secret.contributorSpName.value
#   spSecret = data.azurerm_key_vault_secret.contributorSpSecret.value
#   tenant = data.azurerm_key_vault_secret.tenantId.value
#   subscriptionId = data.azurerm_key_vault_secret.subscriptionId.value

#   vaultName = "eitlztransitkv"
#   secretsName  = var.t1fwExtRouteNextHopIpSecrets
# }
# #t1fw-internal
# module "t2fwIntGetNextHopIps" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-kv"

#   spName = data.azurerm_key_vault_secret.contributorSpName.value
#   spSecret = data.azurerm_key_vault_secret.contributorSpSecret.value
#   tenant = data.azurerm_key_vault_secret.tenantId.value
#   subscriptionId = data.azurerm_key_vault_secret.subscriptionId.value

#   vaultName = "eitlztransitkv"
#   secretsName  = var.t2fwIntRouteNextHopIpSecrets
# }
# #t1fw-management
# module "t2fwMgmtGetNextHopIps" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-kv"

#   spName = data.azurerm_key_vault_secret.contributorSpName.value
#   spSecret = data.azurerm_key_vault_secret.contributorSpSecret.value
#   tenant = data.azurerm_key_vault_secret.tenantId.value
#   subscriptionId = data.azurerm_key_vault_secret.subscriptionId.value

#   vaultName = "eitlztransitkv"
#   secretsName  = var.t2fwMgmtRouteNextHopIpSecrets
# }*/
