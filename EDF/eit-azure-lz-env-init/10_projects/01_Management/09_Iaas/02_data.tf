# #Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}


data "azurerm_key_vault_secret" "pkiEaRootPrivateIpAddress" {
  name         = "pkiCaRootPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "pkiCA01PrivateIpAddress" {
  name         = "pkiCA01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "pkiCA02PrivateIpAddress" {
  name         = "pkiCA02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "webpki01PrivateIpAddress" {
  name         = "webpki01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "webpki02PrivateIpAddress" {
  name         = "webpki02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "wac01PrivateIpAddress" {
  name         = "wac01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "wac02PrivateIpAddress" {
  name         = "wac02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "dc03PrivateIpAddress" {
  name         = "dc03PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "dc04PrivateIpAddress" {
  name         = "dc04PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "eitukshswac02-osdisk1" {
  name         = "eitukshswac02-osdisk1"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "eitukshswac02-datadisk1" {
  name         = "eitukshswac02-datadisk1"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

# Subnets
data "azurerm_subnet" "pkiSubnet" {
  name                 = var.pkiSubnetName
  virtual_network_name = var.lzmanagementHsVnetName
  resource_group_name  = var.lzmanagementHsNetworkingRgName
}
data "azurerm_subnet" "wacSubnet" {
  name                 = var.wacSubnetName
  virtual_network_name = var.lzmanagementHsVnetName
  resource_group_name  = var.lzmanagementHsNetworkingRgName
}
data "azurerm_resource_group" "dcRg" {
  name = var.lzmanagementHsDc03RgName
}
data "azurerm_subnet" "dcSubnet" {
  name                 = var.dcSubnetName
  virtual_network_name = var.lzmanagementHsVnetName
  resource_group_name  = var.lzmanagementHsNetworkingRgName
}
#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-hsafs-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

##################### Extensions LAW #######################

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "HsAdeKeyVault" {
  name                = var.managementHsAdeKvName
  resource_group_name = var.managementHsAdeKvRgName
}

data "azurerm_key_vault_secret" "afs01EncryptKeyURL" {
  name         = "eitukshsafs01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

# data "azurerm_key_vault_key" "wacvm" {
#   name         = "eitukshswac01-ade-01"
#   key_vault_id = data.azurerm_key_vault.HsAdeKeyVault.id
# }
data "azurerm_key_vault_secret" "dc03EncryptKeyURL" {
  name         = "eituksalzhsdc03-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "dc04EncryptKeyURL" {
  name         = "eituksalzhsdc04-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
###################### AFS Server ################################

data "azurerm_subnet" "AFSSubnetName" {
  name                 = var.AFSSubnetName
  virtual_network_name = var.lzmanagementHsAFSVnetName
  resource_group_name  = var.lzmanagementHsAFSRgName
}

data "azurerm_key_vault_secret" "AFS01PrivateIpAddress" {
  name         = "AFS01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_client_config" "current" {

}

############# asg ############
data "azurerm_application_security_group" "asgdc" {
  name                = "eit-uks-alz-hs-adds-asg"
  resource_group_name = "eit-uks-alz-hs-adds-rg"
}
############## WAC 01 ##########
data "azurerm_key_vault_secret" "wac01osdiskid" {
  name         = "wac01osdiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "wac01datadiskid" {
  name         = "wac01datadiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
############ WEB 01 #############
data "azurerm_key_vault_secret" "web01osdiskid" {
  name         = "web01osdiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "web01datadiskid" {
  name         = "web01datadiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
############ WEB 02 #############
data "azurerm_key_vault_secret" "web02osdiskid" {
  name         = "web02osdiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "web02datadiskid" {
  name         = "web02datadiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
############ ica 01 #############
data "azurerm_key_vault_secret" "ica01osdiskid" {
  name         = "ica01osdiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "ica01datadiskid" {
  name         = "ica01datadiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
############ ica 02 #############
data "azurerm_key_vault_secret" "ica02osdiskid" {
  name         = "ica02osdiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "ica02datadiskid" {
  name         = "ica02datadiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
############ rca 01 #############
data "azurerm_key_vault_secret" "rca01osdiskid" {
  name         = "rca01osdiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "rca01datadiskid" {
  name         = "rca01datadiskid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
########### Ansible Patching VM ###############

data "azurerm_key_vault_secret" "AnsPrivateIpAddress" {
  name         = "AnsPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "ans01EncryptKeyURL" {
  name         = "eitukshsans01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "ImageSubIds" {
  name         = "subscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}


data "azurerm_key_vault_secret" "nameserverip1" {
  name         = "nameserverip1"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
  #nameserverip represents the domain controller IP
}
data "azurerm_key_vault_secret" "nameserverip2" {
  name         = "nameserverip2"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
  #nameserverip represents the domain controller IP
}

data "azurerm_key_vault_secret" "dNSHostName1" {
  name         = "dNSHostName1"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}

data "azurerm_key_vault_secret" "dNSHostName2" {
  name         = "dNSHostName2"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
  #dNSHostName is the domain controller FQDN (dc01@abc-test.com)
}
data "azurerm_key_vault_secret" "dchostname1" {
  name         = "dchostname1"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
  #dchostname is (dc01)
}
data "azurerm_key_vault_secret" "dchostname2" {
  name         = "dchostname2"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
  #dchostname is (dc01)
}

# data "azurerm_key_vault_secret" "adAdminUsersvc" {
#   name         = "domain-join-svc-user"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

# data "azurerm_key_vault_secret" "adAdminsvcPassword" {
#   name         = "domain-join-svc-pass"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
