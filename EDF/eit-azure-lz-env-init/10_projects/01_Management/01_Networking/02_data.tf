# #Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = var.managementHsKvRgName
}

#####################################################################
data "azurerm_key_vault_secret" "mgmtss-udr-nexthop" {
  for_each     = var.UDR
  name         = each.value.kv_secret_nexthopIP
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "mgmtss-udr-prefixes" {
  for_each     = var.UDR
  name         = each.value.kv_secret_udrprefixes
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "vnet_secrets" {
  count        = length(local.vnet_secret_names)
  name         = local.vnet_secret_names[count.index]
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

################# NSG's #############
# Fetch secrets for NSG Rules
data "azurerm_key_vault_secret" "nsgrule_secrets" {
  count        = length(local.nsgrules_kvsecretnames)
  name         = local.nsgrules_kvsecretnames[count.index]
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

# Fetch Application Security Group Ids
data "azurerm_application_security_group" "asg" {
  count               = length(local.nsgrules_asg)
  name                = local.nsgrules_asg[count.index]
  resource_group_name = var.asg_rg[local.nsgrules_asg[count.index]]
}
######## Diag Settings ######
data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_network_security_group" "imagebuilder_nsg" {
  name                = var.imagebuilder_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "ado_nsg" {
  name                = var.ado_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "afs_nsg" {
  name                = var.afs_nsg_name
  resource_group_name = var.nsg_rg_name
}

# data "azurerm_network_security_group" "snow01_nsg" {
#   name = var.snow01_nsg_name
#   resource_group_name = var.nsg_rg_name
# }

# data "azurerm_network_security_group" "snow02_nsg" {
#   name = var.snow02_nsg_name
#   resource_group_name = var.nsg_rg_name
# }

data "azurerm_network_security_group" "adds_nsg" {
  name                = var.adds_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "audit_nsg" {
  name                = var.audit_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "ca_nsg" {
  name                = var.ca_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "mgmt_nsg" {
  name                = var.mgmt_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "wac_nsg" {
  name                = var.wac_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "wsus_nsg" {
  name                = var.wsus_nsg_name
  resource_group_name = var.nsg_rg_name
}

data "azurerm_network_security_group" "pep_nsg" {
  name                = var.pep_nsg_name
  resource_group_name = var.nsg_rg_name
}

############################# Existing code ############
# # #Secrets
# data "azurerm_key_vault" "kvmanagementHsSecrets" {
#   name                = var.managementHsKvName
#   resource_group_name = var.managementHsKvRgName
# }

# data "azurerm_key_vault_secret" "managementHsVnetAddressSpace" {
#   name         = "hsmanage-vnet-address-space"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "hsManageVnetAddressSpace" {
#   name         = "hsmanage-vnet-address-space"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "transitVnetAddressSpace" {
#   name         = "transit-vnet-address-space"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "adDcIp1" {
#   name         = "lz-ad-dc-ip1"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "adDcIp2" {
#   name         = "lz-ad-dc-ip2"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "pkiIp1" {
#   name         = "lz-ad-pki-ip1"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "pkiIp2" {
#   name         = "lz-ad-pki-ip2"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# #Subnet Ids
# data "azurerm_subnet" "managementSubnet" {
#   name                 = var.managementSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsNetworkingRgName

#   depends_on = [module.createHsManagmentVNet]
# }
# data "azurerm_subnet" "adSubnet" {
#   name                 = var.addsSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsNetworkingRgName

#   depends_on = [module.createHsManagmentVNet]
# }
# data "azurerm_subnet" "wsusSubnet" {
#   name                 = var.wsusSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsNetworkingRgName

#   depends_on = [module.createHsManagmentVNet]
# }
# data "azurerm_subnet" "wacSubnet" {
#   name                 = var.wacSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsNetworkingRgName

#   depends_on = [module.createHsManagmentVNet]
# }
# data "azurerm_subnet" "caSubnet" {
#   name                 = var.caSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsNetworkingRgName

#   depends_on = [module.createHsManagmentVNet]
# }
# data "azurerm_subnet" "auditSubnet" {
#   name                 = var.auditSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsNetworkingRgName

#   depends_on = [module.createHsManagmentVNet]
# }

# data "azurerm_key_vault_secret" "t2fw-ilb-ip" {
#   name         = var.t2fwIlbIp
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id

#   depends_on = [module.createHsManagmentVNet]
# }
