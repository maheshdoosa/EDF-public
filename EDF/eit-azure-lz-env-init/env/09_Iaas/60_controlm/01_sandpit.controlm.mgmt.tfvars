# Control-M HS key vault
controlMHsKvName = "emersonvmtest"

scriptsstorageAccountName = "abtstauxscriptprd"
saContainerName           = "scripts"

ControlMHsprdvmRgName      = "eit-uks-prd-hs-ctrlm-rg-01"
ControlMHsResourceLocation = "uksouth"

ControlMHsprdvm01nicname          = "eitukhsprdctrlagt01-nic-01"
VM01nicIpConfigName               = "eitukhsprdctrlagt01-nic-01-Ip-Config"
ControlMHsprdvm02nicname          = "eitukhsprdctrlagt02-nic-01-nic-01"
VM02nicIpConfigName               = "eitukhsprdctrlagt02-nic-01-nic-01-Ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

ControlMHsprdvm01Name    = "eitukhsprdctrlagt01"
ControlMHsprdvm02Name    = "eitukhsprdctrlagt02"
ControlMHsvm01osDiskName = "eitukhsprdctrlagt01-osdisk"
ControlMHsvm02osDiskName = "eitukhsprdctrlagt02-osdisk"

ControlMHsprdSubnetName       = "eit-uks-prd-hs-ctrlm-snet-01"
ControlMHsprdVnetName         = "eit-uks-prd-hs-mngd-vnet-01"
ControlMHsprdNetworkingRgName = "eit-uks-prd-hs-ctrlm-rg-01"

bootDiagLogStorageAccountName   = "abtstvmlogssa01"
bootDiagLogStorageAccountRgName = "ab-prdvmlogs-rg-01"

DomainJoinFilePath = "https://abtstauxscriptprd.blob.core.windows.net/scripts/domainjoin.sh"

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
adAdminGroup = "%sec-HS-CTRLM-LocalAdmin-SU@EDF-HS.COM" #The security group to be added
#adAdminGroup variable should not contain any spaces and starts with %

# ######################### Variables for prd managed Disk Creation #######################

# ControlMHsprdmanageddiskvm01 = "gukshsprdctrlm01-datadisk"
# ControlMHsprdmanageddiskvm02 = "gukshsprdctrlm02-datadisk"
# managed_disk = {
#   sd1 = {
#     vmstorageDiskName    = "gukshsprdctrlm01-datadisk"
#     disk_size_gb         = "256"
#     storage_account_type = "StandardSSD_LRS"
#     create_option        = "Empty"
#     zone                 = "1"
#   },
#   sd2 = {
#     vmstorageDiskName    = "gukshsprdctrlm02-datadisk"
#     disk_size_gb         = "256"
#     storage_account_type = "StandardSSD_LRS"
#     create_option        = "Empty"
#     zone                 = "2"
#   }
# }

## Backup for ControlMHs Prd VM's #############

rsv_resourceGroupName    = "ab-prdvmbackup-rg-01"
recovery_vault_name      = "ab-prdvmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "ab-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "ab-prdvmbackup-rg-01"
    vm_id                 = "source_vm01_id"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "ab-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "ab-prdvmbackup-rg-01"
    vm_id                 = "source_vm02_id"
    policy_id             = "backup_policy_id_02"
  }
}
