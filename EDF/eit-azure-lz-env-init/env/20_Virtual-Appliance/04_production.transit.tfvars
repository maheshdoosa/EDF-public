environment = "Transit"

transitKvName   = "eitlztransitkv"
transitKvRgName = ".security"

f5RgName            = "eit-uks-alz-f5-rg"
hf5ResourceLocation = "Uk South"

f5VnetName              = "eit-uks-alz-transit-vnet-01"
f5VnetResourceGroupName = "eit-uks-alz-transit-vnet-rg"
f5mgmtSubnetName        = "eit-alz-f5mgmt-snet-01"

f5Vm1availabiltiyZone = ["1"]
f5Vm2availabiltiyZone = ["2"]

f5Subnet2Name              = "eit-alz-hs-transit-f5-int-snet-02"
f5Subnet2Vnet              = "eit-uks-alz-transit-vnet-01"
f5Subnet2ResourceGroupName = "eit-uks-alz-transit-vnet-rg"

F5VM1PrimarynicName                           = "eituksalzwafa-int-nic-01"
F5VM1PrimarynicIpConfigName                   = "eituksalzwafa-int-nic-01-Config"
F5VM1PrimaryipName                            = "eituksalzwafa-int-nic-01-Ip"
F5VM1mgmtnicName                              = "eituksalzwafa-mgmt-nic-01"
F5VM1mgmtnicIpConfigName                      = "eituksalzwafa-mgmt-nic-01-Config"
F5VM1mgmtipName                               = "eituksalzwafa-mgmt-nic-01-Ip"
f5Vm1primaryenable_nic_ip_forwarding          = "true"
f5Vm1primaryenable_nic_accelerated_networking = "false"
F5VM1mgmtenable_nic_ip_forwarding             = "false"
F5VM1mgmtenable_nic_accelerated_networking    = "false"

F5VM2secondarynicName                           = "eituksalzwafb-int-nic-01"
F5VM2secondarynicIpConfigName                   = "eituksalzwafb-int-nic-01-Config"
F5VM2secondaryipName                            = "eituksalzwafb-int-nic-01-Ip"
F5VM2mgmtnicName                                = "eituksalzwafb-mgmt-nic-01"
F5VM2mgmtnicIpConfigName                        = "eituksalzwafb-mgmt-nic-01-Config"
F5VM2mgmtipName                                 = "eituksalzwafb-mgmt-nic-01-Ip"
F5VM2secondaryenable_nic_ip_forwarding          = "true"
F5VM2secondaryenable_nic_accelerated_networking = "false"
F5VM2mgmtenable_nic_ip_forwarding               = "false"
F5VM2mgmtenable_nic_accelerated_networking      = "false"

load-distribution = "SourceIPProtocol"
Probe_interval    = "5" // in seconds
idleTimeout       = "5" // in minutes

############ Enabling F5 VM Backup ###########

# recovery_vault_name   = "eit-uks-alz-vmbackup-rsv-01" // RSV name for each value pupose
# resourceGroupName     = "eit-uks-alz-vmbackup-rg"     // Rsv Resource Group name
# infraVM_backup_policy = "Daily-2200-52W-InfraVM"
# vm_name = {
#   vm1 = {
#     recovery_vault_name = "eit-uks-alz-vmbackup-rsv-01"
#     resourceGroupName   = "eit-uks-alz-vmbackup-rg"
#     vm_id               = "source_vm_id"
#     policy_id           = "backup_policy_id"
#   },
#   vm2 = {
#     recovery_vault_name = "eit-uks-alz-vmbackup-rsv-01"
#     resourceGroupName   = "eit-uks-alz-vmbackup-rg"
#     vm_id               = "source_vm2_id"
#     policy_id           = "backup_policy_id"
#   }
# }

###################VM Details to get VM ID#################
# vmname_1               = "eituksalzf5a"
# vmname_2               = "eituksalzf5b"
# vm_resource_group_name = "eit-uks-alz-f5-rg"

diagsettingnic = [
  {
    nicname = "eituksalzwafa-int-nic-01",
    rg      = "eit-uks-alz-f5-rg"
  },
  {
    nicname = "eituksalzwafa-mgmt-nic-01",
    rg      = "eit-uks-alz-f5-rg"
  },
  {
    nicname = "eituksalzwafb-int-nic-01",
    rg      = "eit-uks-alz-f5-rg"
  },
  {
    nicname = "eituksalzwafb-mgmt-nic-01",
    rg      = "eit-uks-alz-f5-rg"
  }
]
