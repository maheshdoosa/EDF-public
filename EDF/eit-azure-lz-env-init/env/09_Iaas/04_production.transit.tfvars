environment = "Transit"

transitKvName   = "eitlztransitkv"
transitKvRgName = ".security"

f5RgName           = "eit-uks-alz-f5-rg"
f5ResourceLocation = "Uk South"

f5VnetName              = "eit-uks-alz-transit-vnet-01"
f5VnetResourceGroupName = "eit-uks-alz-transit-vnet-rg"
f5mgmtSubnetName        = "eit-alz-f5mgmt-snet-01"
f5externalSubnetName    = "eit-alz-f5ext-snet-01"
f5internalSubnetName    = "eit-alz-f5int-snet-01"
f5Vm1availabiltiyZone   = ["1"]
f5Vm2availabiltiyZone   = ["2"]

f5Vm1ExternalNicIpName        = "eituksalzf5a-external-nic-ip"
f5Vm1ExternalNicIpConfigName1 = "eituksalzf5a-external-nic-config1"
f5Vm1ExternalNicIpConfigName2 = "eituksalzf5a-external-nic-config2"
f5Vm1ExternalNicIpConfigName3 = "eituksalzf5a-external-nic-config3"


f5Vm2ExternalNicIpName        = "eituksalzf5b-external-nic-ip"
f5Vm2ExternalNicIpConfigName1 = "eituksalzf5b-external-nic-config1"
f5Vm2ExternalNicIpConfigName2 = "eituksalzf5b-external-nic-config2"
f5Vm2ExternalNicIpConfigName3 = "eituksalzf5b-external-nic-config3"

############ Enabling F5 VM Backup ###########

recovery_vault_name   = "eit-uks-alz-vmbackup-rsv-01" // RSV name for each value pupose
resourceGroupName     = "eit-uks-alz-vmbackup-rg"     // Rsv Resource Group name
infraVM_backup_policy = "Daily-2200-52W-InfraVM"
vm_name = {
  vm1 = {
    recovery_vault_name = "eit-uks-alz-vmbackup-rsv-01"
    resourceGroupName   = "eit-uks-alz-vmbackup-rg"
    vm_id               = "source_vm_id"
    policy_id           = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name = "eit-uks-alz-vmbackup-rsv-01"
    resourceGroupName   = "eit-uks-alz-vmbackup-rg"
    vm_id               = "source_vm2_id"
    policy_id           = "backup_policy_id"
  }
}

###################VM Details to get VM ID#################
vmname_1               = "eituksalzf5a"
vmname_2               = "eituksalzf5b"
vm_resource_group_name = "eit-uks-alz-f5-rg"
