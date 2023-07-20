variable "f5RgName" {
  description = "f5RgName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "hf5ResourceLocation" {
  description = "hf5ResourceLocation"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}


variable "f5Vm1availabiltiyZone" {
  description = "f5Vm1availabiltiyZone"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "f5Vm2availabiltiyZone" {
  description = "f5Vm2availabiltiyZone"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}


variable "transitKvName" {
  description = "transitKvName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "transitKvRgName" {
  description = "transitKvRgName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "f5Subnet2Name" {
  description = "f5Subnet2Name"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
variable "f5Subnet2Vnet" {
  description = "f5Subnet2Vnet"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
variable "f5Subnet2ResourceGroupName" {
  description = "f5Subnet2ResourceGroupName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "f5mgmtSubnetName" {
  description = "f5mgmtSubnetName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

# variable "f5externalSubnetName" {
#   description = "f5externalSubnetName"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "f5internalSubnetName" {
#   description = "f5internalSubnetName"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "f5VnetName" {
  description = "f5VnetName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
variable "f5VnetResourceGroupName" {
  description = "f5VnetResourceGroupName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
variable "environment" {
  description = "environment"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

# variable "f5Vm1ExternalNicIpName" {
#   description = "f5Vm1ExternalNicIpName"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "f5Vm2ExternalNicIpName" {
#   description = "f5Vm2ExternalNicIpName"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "load-distribution" {
  description = "load-distribution"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
variable "Probe_interval" {
  description = "Probe_interval"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
variable "idleTimeout" {
  description = "idleTimeout"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}
# variable "f5Vm1secondaryIPAdressesList" {
#   description = "Secondary multiple IP address assginment"
#   type        = map
#   default     = {}
# }
# variable "f5Vm2secondaryIPAdressesList" {
#   description = "Secondary multiple IP address assginment"
#   type        = map
#   default     = {}
# }

###################### Enabling F5 VM Backup ######################
# variable "vm_name" {
#   description = "(Optional) sku of the resource"
#   type = map(object({
#     recovery_vault_name = string,
#     resourceGroupName   = string,
#     vm_id               = string,
#     policy_id           = string
#   }))
# }

# variable "vmname_1" {
#   description = "VM1 Name"
#   type        = string
#   default     = ""
# }

# variable "vmname_2" {
#   description = "VM2 Name"
#   type        = string
#   default     = ""
# }

# variable "vm_resource_group_name" {
#   description = "VM RG Name"
#   type        = string
#   default     = ""
# }

# variable "infraVM_backup_policy" {
#   description = "Name of the backup policy which will be applied"
#   default     = ""
#   type        = string
# }

# variable "resourceGroupName" {
#   description = "RSV RG Name"
#   type        = string
#   default     = ""
# }



# variable "recovery_vault_name" {
#   description = "RSV  Name"
#   type        = string
#   default     = ""
# }
# variable "logcategory" {
#   description = "logcategory"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "metricstatus" {
#   description = "metricstatus"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "retentionstatus" {
#   description = "retentionstatus"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "diag_name" {
#   description = "diag_name"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "updateManagmentRgName" {
#   description = "updateManagmentRgName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "laWorkspacename" {
#   description = "laWorkspacename"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "F5VM1PrimarynicName" {
  description = "F5VM1PrimarynicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM1PrimarynicIpConfigName" {
  description = "F5VM1PrimarynicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "F5VM1PrimaryipName" {
#   description = "F5VM1PrimaryipName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "F5VM1mgmtnicName" {
  description = "F5VM1mgmtnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM1mgmtnicIpConfigName" {
  description = "F5VM1mgmtnicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "F5VM1mgmtipName" {
#   description = "F5VM1mgmtipName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "F5VM2secondarynicName" {
  description = "F5VM2secondarynicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM2secondarynicIpConfigName" {
  description = "F5VM2secondarynicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "F5VM2secondaryipName" {
#   description = "F5VM2secondaryipName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "F5VM2mgmtnicName" {
  description = "F5VM2mgmtnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM2mgmtnicIpConfigName" {
  description = "F5VM2mgmtnicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "F5VM2mgmtipName" {
#   description = "F5VM2mgmtipName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "F5VM2mgmtenable_nic_ip_forwarding" {
  description = "F5VM2mgmtenable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM2mgmtenable_nic_accelerated_networking" {
  description = "F5VM2mgmtenable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "f5Vm1primaryenable_nic_ip_forwarding" {
  description = "f5Vm1primaryenable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "f5Vm1primaryenable_nic_accelerated_networking" {
  description = "f5Vm1primaryenable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM1mgmtenable_nic_ip_forwarding" {
  description = "F5VM1mgmtenable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM1mgmtenable_nic_accelerated_networking" {
  description = "F5VM1mgmtenable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM2secondaryenable_nic_ip_forwarding" {
  description = "F5VM2secondaryenable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "F5VM2secondaryenable_nic_accelerated_networking" {
  description = "F5VM2secondaryenable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
