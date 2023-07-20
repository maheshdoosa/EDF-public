environment = "Sandpit"

#cenadt key vault
cenadtKvName   = "eitlzmanagementhsk"
cenadtKvRgName = ".security"

###########################################################################
lzcenadtResourceLocation  = "uksouth"
cenadtSubnetName          = "eit-alz-hs-cenadt-audit-snet-01"
cenadtVnetName            = "eit-uks-alz-hs-cenadt-vnet-01"
cenadtNetworkingRgName    = "eit-uks-alz-hs-cenadt-vnet-rg-01"
cenadtvm01nicName         = "eituksssvsent01-nic-01"
lzcenadtRgName            = "ab-eit-uks-alz-hs-cenadt-loga-rg-01"
cenadtvm01nicIpConfigName = "eituksssvsent01-nic-01-ip-Config"

cenadtvm01name = "eitukshscef01"

bootDiagLogStorageAccountName   = "abteststore13"
bootDiagLogStorageAccountRgName = "ab-test-rg1"

lzvm01zone           = ["1"]
create_option        = "Empty"
storage_account_type = "Standard_LRS"
caching              = "None"

disks = {
  "disk01" = {
    vm01diskname = "eituksssvent01-datadisk"
    vm02diskname = "eituksssvent02-datadisk"
    vmrgName     = "eit-uks-alz-hs-cenadt-loga-rg-01"
    diskSize     = "64"
  }
  # "disk02" = {
  #   vm02diskname = "eituksssvent02-datadisk"
  #   vmrgName = "eit-uks-alz-hs-cenadt-loga-rg-01"
  #   diskSize = "64"
  # }
}

cenadvm01_data_disk = "eituksssvnet01-datadisk"
disk_lun_01         = "1"
############## VM02 #############
cenadtvm02nicName         = "eituksssvsent02-nic-01"
cenadtvm02nicIpConfigName = "eituksssvsent02-nic-01-ip-Config"
cenadtvm02name            = "eitukshscef02"
lzvm02zone                = ["1"]
# disks = {
#       "disk01" = {
#         diskname = "eituksssvent02-datadisk"
#         vmrgName = "eit-uks-alz-hs-cenadt-loga-rg-01"
#         diskSize = "64"
#       }
# }

cenadvm02_data_disk = "eituksssvnet02-datadisk"
# disk_lun_01 = "1"
