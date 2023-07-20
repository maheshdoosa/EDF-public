
eitmngdhsResourceLocation         = "uk south"
eitmngdHssecretsKvName            = "avmeitprdhsmngdsub01kv"
eitmngdHsVnetName                 = "eit-uks-prd-hs-mngd-vnet-01"
eitmngdHsNetworkingRgName         = "eit-uks-prd-hs-mngd-vnet-rg-01"
MIMDBSubnetName                   = "eit-uks-prd-hs-mngd-mimdb-snet-01"
MIMAPPSubnetName                  = "eit-uks-prd-hs-mngd-mimapp-snet-01"
bootDiagLogStorageAccountName     = "eituksprdmngdvmlogssa01"
bootDiagLogStorageAccountRgName   = "eit-uks-prd-hs-vmlogs-rg-01"
eitHsmngdAdeKvName                = "eit-uks-prd-hs-ade-kv-01"
eitHsmngdAdeKvRgName              = "eit-uks-prd-hs-ade-kv-01"
mimdbvmRgName                     = "eit-prd-hs-mngd-mimdb-rg-01"
mimappvmRgName                    = "eit-prd-hs-mngd-mimapp-rg-01"
scriptsstorageAccountName         = "eitprdmngdauxscript"
saContainerName                   = "scripts"
mimdbvm01nicName                  = "eitukshspmdb01-nic-01"
mimdbvm01nicIpConfigName          = "eitukshspmdb01-nic-01-Ip-Config"
mimappvm01nicName                 = "eitukshspmap01-nic-01"
mimappvm01nicIpConfigName         = "eitukshspmap01-nic-01-Ip-Config"
mimappvm02nicName                 = "eitukshspmap02-nic-01"
mimappvm02nicIpConfigName         = "eitukshspmap02-nic-01-Ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
mimdbvm01name                     = "eitukshspmdb01"
mimappvm01name                    = "eitukshspmap01"
mimappvm02name                    = "eitukshspmap02"
eitmngdhs_ImageRGname             = "eit-uks-alz-hs-imagebuild-rg"
eitmngdhs_Imagegalleryname        = "eituksalzhsimagebuild01"
eitmngdhs_Imagename               = "Windows2019"
eitmngdhs_ImageVersion            = "latest"
mimdbvm01size                     = "Standard_E4s_v5"
mimappvm01size                    = "Standard_D4s_V5"
mimappvm02size                    = "Standard_D4s_V5"
mimdbvm01osdiskname               = "eitukshspmdb01-osdisk"
mimappvm01osdiskname              = "eitukshspmap01-osdisk"
mimappvm02osdiskname              = "eitukshspmap02-osdisk"
storageOsDiskCreateOption         = "FromImage"
storageOsDiskCaching              = "ReadWrite"
storagedataDiskCaching            = "None"
storagedataDiskCreateOption       = "Empty"
storagedataDiskType               = "Standard_LRS"
ouPath_windows                    = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"
EncryptionOperation               = "EnableEncryption"
KeyEncryptionAlgorithm            = "RSA-OAEP"
VolumeType                        = "All"
gbRegionXmlFilePath               = "https://eitprdmngdauxscript.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath                 = "https://eitprdmngdauxscript.blob.core.windows.net/scripts/PrepareVM.ps1"
lapsFilePath                      = "https://eitprdmngdauxscript.blob.core.windows.net/scripts/LAPS.x64.msi"
mimdbvm01_storagedataDisk1size    = 256
mimdbvm01_storagedataDisk1Name    = "eitukshspmdb01-datadisk-01"
mimdbvm01_storagedataDisk1lun     = 1
mimdbvm01_storagedataDisk2size    = 64
mimdbvm01_storagedataDisk2Name    = "eitukshspmdb01-datadisk-02"
mimdbvm01_storagedataDisk2lun     = 2
mimdbvm01_storagedataDisk3size    = 256
mimdbvm01_storagedataDisk3Name    = "eitukshspmdb01-datadisk-03"
mimdbvm01_storagedataDisk3lun     = 3
mimappvm01_storagedataDisksize    = 32
mimappvm01_storagedataDiskName    = "eitukshspmap01-datadisk-01"
mimappvm01_storagedataDisklun     = 1
mimappvm02_storagedataDisksize    = 32
mimappvm02_storagedataDiskName    = "eitukshspmap02-datadisk-01"
mimappvm02_storagedataDisklun     = 1

########################### Backup #####################
recovery_services_vault_rgname = "eit-uks-prd-hs-vmbackup-rg"
recovery_services_vault_name   = "eit-uks-prd-hs-vmbackup-rsv-01"
infraVM_backup_policy_01       = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02       = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_services_vault_name   = "eit-uks-prd-hs-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-prd-hs-vmbackup-rg"
    vm_id                          = "source_vm_id_01"
    policy_id                      = "backup_policy_id_01"
  },
  vm2 = {
    recovery_services_vault_name   = "eit-uks-prd-hs-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-prd-hs-vmbackup-rg"
    vm_id                          = "source_vm_id_02"
    policy_id                      = "backup_policy_id_01"
  },
  vm3 = {
    recovery_services_vault_name   = "eit-uks-prd-hs-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-prd-hs-vmbackup-rg"
    vm_id                          = "source_vm_id_03"
    policy_id                      = "backup_policy_id_02"
  }
}
