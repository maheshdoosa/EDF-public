################### Common variable #######################

variable "MDWHs-Prd-environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHs-Uat-environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsResourceLocation" {
  description = "MDWHSResourceLocation"
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

variable "prjKvName" {
  description = "prjKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "prjKvRgName" {
  description = "prjKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsprdkv" {
  description = "MDWHsprdkv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsprdkvrg" {
  description = "MDWHsprdkvrg"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatkv" {
  description = "MDWHsprdkv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatkvrg" {
  description = "MDWHsprdkvrg"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdwhsprdbootDiagLogStName" {
  description = "mdwhsprdbootDiagLogStName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdwhsprdbootDiagLogStRgName" {
  description = "mdwhsprdbootDiagLogStRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdwhsUatbootDiagLogStName" {
  description = "mdwhsprdbootDiagLogStName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdwhsUatbootDiagLogStRgName" {
  description = "mdwhsprdbootDiagLogStRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


################### Prep Scripts variable ####################

# variable "MDWHsPrdAuxRgName" {
#   description = "MDWHSPrdAUXRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "auxScriptsSA" {
  description = "auxScriptsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "auxContainerName" {
  description = "var.auxContainerName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "auxScriptsSAAccountKey" {
#   description = "auxScriptsSAAccountKey"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

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

variable "MDWHsPrdNetworkingRgName" {
  description = "MDWHsPrdNetworkingRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdVnetName" {
  description = "MDWHsPrdVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdSubnetName" {
  description = "MDWHsPrdSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}



variable "MDWHsPrdWebVM01nicName" {
  description = "MDWHsPrdWebVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdWebVM01nicIpConfigName" {
  description = "MDWHsPrdWebVM01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdAppVM01nicName" {
  description = "MDWHsPrdAppVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdAppVM01nicIpConfigName" {
  description = "MDWHsPrdAppVM01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdAppVM02nicName" {
  description = "MDWHsPrdAppVM02nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "MDWHsPrdAppVM02nicIpConfigName" {
  description = "MDWHsPrdAppVM02nicIpConfigName"
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

################### UAT NIC variable ####################

variable "MDWHsUatNetworkingRgName" {
  description = "MDWHsUatNetworkingRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatVnetName" {
  description = "MDWHsUatVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatSubnetName" {
  description = "MDWHsUatSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}



variable "MDWHsUatWebVM01nicName" {
  description = "MDWHsUatWebVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatWebVM01nicIpConfigName" {
  description = "MDWHsUatWebVM01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatAppVM01nicName" {
  description = "MDWHsUatAppVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatAppVM01nicIpConfigName" {
  description = "MDWHsUatAppVM01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatAppVM02nicName" {
  description = "MDWHsUatAppVM02nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "MDWHsUatAppVM02nicIpConfigName" {
  description = "MDWHsUatAppVM02nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Uat_enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Uat_enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


################### Prod VM variable ####################

variable "MDWHsPrdVmRgName" {
  description = "MDWHsPrdVmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdWebVM01" {
  description = "MDWHsPrdWebVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "WebVM01OSDiskName" {
  description = "WebVM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Webvm01storageDiskName" {
  description = "Webvm01storageDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdAppVM01" {
  description = "MDWHsPrdAppVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AppVM01OSDiskName" {
  description = "AppVM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Appvm01storageDiskName" {
  description = "Appvm01storageDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdAppVM02" {
  description = "MDWHsPrdAppVM02"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AppVM02OSDiskName" {
  description = "AppVM02OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Appvm02storageDiskName" {
  description = "Appvm01storageDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################### UAT VM variable ####################

variable "MDWHsUatVmRgName" {
  description = "MDWHsUatVmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatWebVM01" {
  description = "MDWHsUatWebVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UatWebVM01OSDiskName" {
  description = "UatWebVM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UatWebvm01storageDiskName" {
  description = "UatWebvm01storageDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatAppVM01" {
  description = "MDWHsUatAppVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UatAppVM01OSDiskName" {
  description = "UatAppVM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UatAppvm01storageDiskName" {
  description = "UatAppvm01storageDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatAppVM02" {
  description = "MDWHsUatAppVM02"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UatAppVM02OSDiskName" {
  description = "UatAppVM02OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UatAppvm02storageDiskName" {
  description = "UatAppvm01storageDiskName"
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
########## Enabling MDWHs- Prod & UAT VM Backup ######################

variable "MDWHsPrdRSVName" {
  description = "MDWHsPrdRSVName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdRSVRgName" {
  description = "MDWHsPrdRSVRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatRSVName" {
  description = "MDWHsUatRSVName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatRSVRgName" {
  description = "MDWHsUatRSVRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHs_infraVM_backup_policy_01" {
  description = "MDWHs_infraVM_backup_policy_01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

# variable "MDWHs_infraVM_backup_policy_02" {
#   description = "MDWHs_infraVM_backup_policy_02"
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

###################


variable "mdw_prd_bastion_rg_name" {
  description = "mdw_prd_bastion_rg_name"
  default     = ".tmp-rg-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_uat_bastion_rg_name" {
  description = "mdw_uat_bastion_rg_name"
  default     = ".tmp-rg-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw-prd-bastion_pip_name" {
  description = "mdw-prd-bastion_pip_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw-uat-bastion_pip_name" {
  description = "mdw-uat-bastion_pip_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_bastion_pip_sku" {
  description = "mdw_bastion_pip_sku"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_prd_bastion_host_name" {
  description = "mdw_prd_bastion_host_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_uat_bastion_host_name" {
  description = "mdw_uat_bastion_host_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_bastion_host_ipname" {
  description = "mdw_bastion_host_ipname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_prd_bastion_diag_name" {
  description = "mdw_prd_bastion_diag_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_uat_bastion_diag_name" {
  description = "mdw_uat_bastion_diag_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsPrdBastionSubnetName" {
  description = "MDWHsPrdBastionSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsUatBastionSubnetName" {
  description = "MDWHsUatBastionSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

######### Import MDW VM's ####################

variable "MDWHsUatPrdVM04kv" {
  description = "MDWHsUatPrdVM04kv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatPrdVM04kvrg" {
  description = "MDWHsUatPrdVM04kvrg"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatVm04Subnet" {
  description = "MDWHsUatVm04Subnet"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsPrdVm04Subnet" {
  description = "MDWHsPrdVm04Subnet"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatVm04RgName" {
  description = "MDWHsUatVm04RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsPrdVm04RgName" {
  description = "MDWHsPrdVm04RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "MDWHsUatVM04nicName" {
  description = "MDWHsUatVM04nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsPrdVM04nicName" {
  description = "MDWHsPrdVM04nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "enable_nic_accelerate_networking" {
  description = "enable_nic_accelerate_networking"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "enable_nic_ip_forward" {
  description = "enable_nic_ip_forward"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatVM04nicIpConfigName" {
  description = "MDWHsUatVM04nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsPrdVM04nicIpConfigName" {
  description = "MDWHsPrdVM04nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatVM04" {
  description = "MDWHsUatVM04"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "UatVM04OSDiskName" {
  description = "UatVM04OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsPrdVM04" {
  description = "MDWHsPrdVM04"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "PrdVM04OSDiskName" {
  description = "PrdVM04OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "prepVm01Ps1FilePath" {
  description = "prepVm01Ps1FilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatPrdrsv_name" {
  description = "MDWHsUatPrdrsv_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "MDWHsUatPrdrsv_rg_name" {
  description = "MDWHsUatPrdrsv_rg_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
