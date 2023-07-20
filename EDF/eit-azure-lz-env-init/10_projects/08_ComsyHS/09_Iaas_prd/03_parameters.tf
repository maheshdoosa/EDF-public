################### Common variable #######################

variable "ComsyHS-Prd-environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSResourceLocation" {
  description = "ComsyHSResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "additionalTags" {
#   type        = map(string)
#   description = "Additional tags to be enforced"
#   default     = {}
# }

# variable "costcentre" {
#   description = "cost centre"
#   default     = "eit"
#   type        = string
# }

variable "ComsyHSKvName" {
  description = "ComsyHSKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSprdkv" {
  description = "ComsyHSprdkv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSprdkvrg" {
  description = "ComsyHSprdkv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageAccountName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageAccountRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################### Prep Scripts variable ####################

# variable "ComsyHSPrdAuxRgName" {
#   description = "ComsyHSPrdAUXRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "ComsyHSPrdAuxScriptsSA" {
  description = "auxScriptsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "auxContainerName" {
  description = "var.auxContainerName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "gbRegionXmlFilePath" {
  description = "gbRegionXmlFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "prepVmPs1FilePath" {
  description = "prepVmPs1FilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################### Prod NIC variable ####################

variable "ComsyHSprdNetworkingRgName" {
  description = "ComsyHSprdNetworkingRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSprdVnetName" {
  description = "ComsyHSprdVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSprdSubnetName" {
  description = "ComsyHSprdSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}



variable "ComsyHSPrdVM01nicName" {
  description = "ComsyHSPrdVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSPrdVM01nicIpConfigName" {
  description = "ComsyHSPrdVM01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################### Prod VM variable ####################

variable "ComsyHSPrdVmRgName" {
  description = "ComsyHSPrdVmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSPrdVM01" {
  description = "ComsyHSPrdVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "VM01OSDiskName" {
  description = "VM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "VM01storageDiskName" {
  description = "VM01storageDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


################# VM Encription ####################
variable "EncryptionOperation" {
  description = "EncryptionOperation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "VolumeType" {
  description = "VolumeType"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "KeyEncryptionAlgorithm" {
  description = "KeyEncryptionAlgorithm"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
########## Enabling ComsyHS- Prod & UAT VM Backup ######################

variable "ComsyHSPrdRSVName" {
  description = "ComsyHSPrdRSVName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHSPrdRSVRgName" {
  description = "ComsyHSPrdRSVRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHS_infraVM_backup_policy_01" {
  description = "ComsyHS_infraVM_backup_policy_01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

# variable "ComsyHS_infraVM_backup_policy_02" {
#   description = "ComsyHS_infraVM_backup_policy_02"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }


variable "vm_name" {
  description = "(Optional) sku of the resource"
  type = map(object({
    recovery_vault_name   = string,
    rsv_resourceGroupName = string,
    vm_id                 = string,
    policy_id             = string
  }))
}

#############
variable "lapsFilePath" {
  description = "lapsFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
