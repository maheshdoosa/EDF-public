
eitmngdhsResourceLocation         = "uk south"
eitmngdHssecretsKvName            = "avmeitnphsmngdsub01kv"
eitmngdHsVnetName                 = "eit-uks-np-hs-mngd-vnet-01"
eitmngdHsNetworkingRgName         = "eit-uks-np-hs-mngd-vnet-rg-01"
MIMDBSubnetName                   = "eit-uks-np-hs-mngd-mimdb-snet-01"
MIMAPPSubnetName                  = "eit-uks-np-hs-mngd-mimapp-snet-01"
bootDiagLogStorageAccountName     = "eituksnpmngdvmlogssa01"
bootDiagLogStorageAccountRgName   = "eit-uks-np-hs-vmlogs-rg-01"
eitHsmngdAdeKvName                = "eit-uks-np-hs-ade-kv-01"
eitHsmngdAdeKvRgName              = "eit-uks-np-hs-ade-rg-01"
mimdbvmRgName                     = "eit-np-hs-mngd-mimdb-rg-01"
mimappvmRgName                    = "eit-np-hs-mngd-mimapp-rg-01"
scriptsstorageAccountName         = "eitnpmngdauxscript"
saContainerName                   = "scripts"
mimdbvm01nicName                  = "eitukshsnpmdb01-nic-01"
mimdbvm01nicIpConfigName          = "eitukshsnpmdb01-nic-01-Ip-Config"
mimappvm01nicName                 = "eitukshsnpmap01-nic-01"
mimappvm01nicIpConfigName         = "eitukshsnpmap01-nic-01-Ip-Config"
mimappvm02nicName                 = "eitukshsnpmap02-nic-01"
mimappvm02nicIpConfigName         = "eitukshsnpmap02-nic-01-Ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
mimdbvm01name                     = "eitukshsnpmdb01"
mimappvm01name                    = "eitukshsnpmap01"
mimappvm02name                    = "eitukshsnpmap02"
eitmngdhs_ImageRGname             = "eit-uks-alz-hs-imagebuild-rg"
eitmngdhs_Imagegalleryname        = "eituksalzhsimagebuild01"
eitmngdhs_Imagename               = "Windows2019"
eitmngdhs_ImageVersion            = "latest"
mimdbvm01size                     = "Standard_E4s_v5"
mimappvm01size                    = "Standard_D4s_V5"
mimappvm02size                    = "Standard_D4s_V5"
mimdbvm01osdiskname               = "eitukshsnpmdb01-osdisk"
mimappvm01osdiskname              = "eitukshsnpmap01-osdisk"
mimappvm02osdiskname              = "eitukshsnpmap02-osdisk"
storageOsDiskCreateOption         = "FromImage"
storageOsDiskCaching              = "ReadWrite"
storagedataDiskCaching            = "None"
storagedataDiskCreateOption       = "Empty"
storagedataDiskType               = "Standard_LRS"
ouPath_windows                    = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"
EncryptionOperation               = "EnableEncryption"
KeyEncryptionAlgorithm            = "RSA-OAEP"
VolumeType                        = "All"
gbRegionXmlFilePath               = "https://eitnpmngdauxscript.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath                 = "https://eitnpmngdauxscript.blob.core.windows.net/scripts/PrepareVM.ps1"
lapsFilePath                      = "https://eitnpmngdauxscript.blob.core.windows.net/scripts/LAPS.x64.msi"
mimdbvm01_storagedataDisk1size    = 256
mimdbvm01_storagedataDisk1Name    = "eitukshsnpmdb01-datadisk-01"
mimdbvm01_storagedataDisk1lun     = 1
mimdbvm01_storagedataDisk2size    = 64
mimdbvm01_storagedataDisk2Name    = "eitukshsnpmdb01-datadisk-02"
mimdbvm01_storagedataDisk2lun     = 2
mimdbvm01_storagedataDisk3size    = 256
mimdbvm01_storagedataDisk3Name    = "eitukshsnpmdb01-datadisk-03"
mimdbvm01_storagedataDisk3lun     = 3
mimappvm01_storagedataDisksize    = 32
mimappvm01_storagedataDiskName    = "eitukshsnpmap01-datadisk-01"
mimappvm01_storagedataDisklun     = 1
mimappvm02_storagedataDisksize    = 32
mimappvm02_storagedataDiskName    = "eitukshsnpmap02-datadisk-01"
mimappvm02_storagedataDisklun     = 1

########################### Backup #####################
recovery_services_vault_rgname = "eit-uks-np-hs-vmbackup-rg"
recovery_services_vault_name   = "eit-uks-np-hs-vmbackup-rsv-01"
infraVM_backup_policy_01       = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02       = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_services_vault_name   = "eit-uks-np-hs-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-np-hs-vmbackup-rg"
    vm_id                          = "source_vm_id_01"
    policy_id                      = "backup_policy_id_01"
  },
  vm2 = {
    recovery_services_vault_name   = "eit-uks-np-hs-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-np-hs-vmbackup-rg"
    vm_id                          = "source_vm_id_02"
    policy_id                      = "backup_policy_id_01"
  },
  vm3 = {
    recovery_services_vault_name   = "eit-uks-np-hs-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-np-hs-vmbackup-rg"
    vm_id                          = "source_vm_id_03"
    policy_id                      = "backup_policy_id_02"
  }
}
