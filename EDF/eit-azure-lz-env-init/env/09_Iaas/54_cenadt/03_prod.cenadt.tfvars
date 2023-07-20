environment = "Production"

#cenadt key vault###
cenadtKvName   = "avmeitalzhscenadtsub01kv"
cenadtKvRgName = ".security"

###########################################################################
lzcenadtResourceLocation  = "uksouth"
cenadtSubnetName          = "eit-alz-hs-cenadt-audit-snet-01"
cenadtVnetName            = "eit-uks-alz-hs-cenadt-vnet-01"
cenadtNetworkingRgName    = "eit-uks-alz-hs-cenadt-vnet-rg-01"
cenadtvm01nicName         = "eitukshscef001-nic-01"
lzcenadtRgName            = "eit-uks-alz-hs-cenadt-loga-rg-01"
cenadtvm01nicIpConfigName = "eitukshscef001-nic-01-ip-Config"

cenadtvm01name = "eitukshscef001"

bootDiagLogStorageAccountName   = "eituksalzhsauditsa02"
bootDiagLogStorageAccountRgName = "eit-uks-alz-hs-audit-rg-01"

lzvm01zone           = ["1"]
create_option        = "Empty"
storage_account_type = "Standard_LRS"
caching              = "None"


cenadvm01_data_disk = "eitukshscef001-datadisk"
disk_lun_01         = "1"
############## VM02 #############
cenadtvm02nicName         = "eitukshscef02-nic-01"
cenadtvm02nicIpConfigName = "eitukshscef02-nic-01-ip-Config"
cenadtvm02name            = "eitukshscef02"
lzvm02zone                = ["2"]

cenadvm02_data_disk = "eitukshscef02-datadisk"

########## Azure Disk Encryption ############

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"

HsAdeKvName   = "e-uks-alz-cenadt-ade-kv"
HsAdeKvRgName = "eit-uks-alz-cenadt-ade-rg-01"

###########Data Disk ################33


disks = {
  "disk01" = {
    vm01diskname = "eitukshscef001-datadisk"
    vm02diskname = "eitukshscef02-datadisk"
    vmrgName     = "eit-uks-alz-hs-cenadt-loga-rg-01"
    diskSize     = "64"
  }
  # "disk02" = {
  #   vm02diskname = "eitukshscef02-datadisk"
  #   vmrgName = "eit-uks-alz-hs-cenadt-loga-rg-01"
  #   diskSize = "64"
  # }
}

# #################Domain Join#################

storageAccountName = "eituksalzhsauditsa02"
saContainerName    = "scripts"
ouPath             = "OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
adAdminGroup       = "%Sec-HS-SysLogCollector-LocalAdmin-SU"
adAdminGroup1      = "%Domain^Admins@EDF-HS.COM"
adAdminGroup2      = "%devops_temp_admins@EDF-HS.COM"
DomainJoinFilePath = "https://eituksalzhsauditsa02.blob.core.windows.net/scripts/ubuntu_domainjoin_updated.sh"
hostname           = "eitukshscef001.edf-hs.com"
hostname_epcvm01   = "eitukshspslc01.edf-hs.com"
ouPath_windows     = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"

################# Event Collector ##############
lzcenadtpecRgName                 = "eit-uks-alz-hs-cenadt-pec-rg-01"
cenadtpecvm01nicName              = "eitukshspslc01-nic-01"
cenadtpecvm02nicName              = "eitukshspwec01-nic-01"
cenadtpecvm01nicIpConfigName      = "eitukshspslc01-nic-01-ip-Config"
cenadtpecvm02nicIpConfigName      = "eitukshspwec01-nic-01-ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
cenadtpecvm01name                 = "eitukshspslc01"
cenadtpecvm02name                 = "eitukshspwec01"
pecvm01_ImageRGname               = "eit-uks-alz-hs-imagebuild-rg"
pecvm01_Imagegalleryname          = "eituksalzhsimagebuild01"
pecvm01_Imagename                 = "ubuntu20_04"
pecvm01_ImageVersion              = "latest"
pecvm02_ImageRGname               = "eit-uks-alz-hs-imagebuild-rg"
pecvm02_Imagegalleryname          = "eituksalzhsimagebuild01"
pecvm02_Imagename                 = "Windows2019"
pecvm02_ImageVersion              = "latest"
cenadtpecvm01size                 = "Standard_D4s_v3"
cenadtpecvm02size                 = "Standard_D4s_v3"
cenadtpecvm01osdiskname           = "eitukshspslc01-osdisk"
cenadtpecvm02osdiskname           = "eitukshspwec01-osdisk"
storageOsDiskCreateOption         = "FromImage"
storageOsDiskCaching              = "ReadWrite"
storagedataDiskCaching            = "None"
storagedataDiskCreateOption       = "Empty"
storagedataDiskType               = "Standard_LRS"
osdisksize                        = "64"
storagedataDisksize               = "1024"
osDisktype                        = "Standard_LRS"
storagedataDiskName               = "eitukshspwec01-datadisk"
storagedataDisklun                = "1"
#pecvm01diskname	= "eitukshspslc01-datadisk"
#pecvmrgName     = "eit-uks-alz-hs-cenadt-pec-rg-01"
pecvm_storage_account_type = "Standard_LRS"
#pecdiskSize	= "1024"
pecvm01zone            = ["1"]
cenadtpecSubnetName    = "eit-alz-hs-cenadt-pec-snet-01"
cenadpecvm01_data_disk = "eitukshspslc01-datadisk"

pecvmdisks = {
  "disk01" = {
    pecvm01diskname = "eitukshspslc01-datadisk"
    pecvmrgName     = "eit-uks-alz-hs-cenadt-pec-rg-01"
    pecdiskSize     = "1024"
  }
}

gbRegionXmlFilePath = "https://eituksalzhsauditsa02.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzhsauditsa02.blob.core.windows.net/scripts/PrepareVM.ps1"
lapsFilePath        = "https://eituksalzhsauditsa02.blob.core.windows.net/scripts/LAPS.x64.msi"


########### BAckup For CentAdt Servers ##########################

rsv_resourceGroupName    = "eit-alz-hs-audit-vmbackup-rg-01"
recovery_vault_name      = "eit-alz-hs-audit-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "eit-alz-hs-audit-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-audit-vmbackup-rg-01"
    vm_id                 = "source_epcvm01_id"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "eit-alz-hs-audit-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-audit-vmbackup-rg-01"
    vm_id                 = "source_epcvm02_id"
    policy_id             = "backup_policy_id_02"
  },
  vm3 = {
    recovery_vault_name   = "eit-alz-hs-audit-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-audit-vmbackup-rg-01"
    vm_id                 = "source_epcvm03_id"
    policy_id             = "backup_policy_id_01"
  },
  vm4 = {
    recovery_vault_name   = "eit-alz-hs-audit-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-audit-vmbackup-rg-01"
    vm_id                 = "source_epcvm04_id"
    policy_id             = "backup_policy_id_02"
  }
}
diagsettingnic = [
  {
    nicname = "eitukshscef001-nic-01",
    rg      = "eit-uks-alz-hs-cenadt-loga-rg-01"
  },
  {
    nicname = "eitukshscef02-nic-01",
    rg      = "eit-uks-alz-hs-cenadt-loga-rg-01"
  },
  {
    nicname = "eitukshspslc01-nic-01",
    rg      = "eit-uks-alz-hs-cenadt-pec-rg-01"
  },
  {
    nicname = "eitukshspwec01-nic-01",
    rg      = "eit-uks-alz-hs-cenadt-pec-rg-01"
  }
]
