################### Common variable #######################

variable "MDWHs-Tst-environment" {
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

variable "MDWHsTstkv" {
  description = "MDWHsTstkv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstkvrg" {
  description = "MDWHsTstkvrg"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "mdwhsTstbootDiagLogStName" {
  description = "mdwhsTstbootDiagLogStName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdwhsTstbootDiagLogStRgName" {
  description = "mdwhsTstbootDiagLogStRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################### Prep Scripts variable ####################

# variable "MDWHsTstAuxRgName" {
#   description = "MDWHSTstAUXRgName"
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

variable "MDWHsTstNetworkingRgName" {
  description = "MDWHsTstNetworkingRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVnetName" {
  description = "MDWHsTstVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstSubnetName" {
  description = "MDWHsTstSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}



variable "MDWHsTstAppVM01nicName" {
  description = "MDWHsTstAppVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstAppVM01nicIpConfigName" {
  description = "MDWHsTstAppVM01nicIpConfigName"
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

################### TEST VM variable ####################

variable "MDWHsTstVmRgName" {
  description = "MDWHsTstVmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstAppVM01" {
  description = "MDWHsTstAppVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "TstAppVM01OSDiskName" {
  description = "TstAppVM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "TstAppvm01storageDiskName" {
  description = "TstAppvm01storageDiskName"
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
########## Enabling MDWHs- TEST VM Backup ######################

variable "MDWHsTstRSVName" {
  description = "MDWHsTstRSVName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstRSVRgName" {
  description = "MDWHsTstRSVRgName"
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

variable "mdw_dev_bastion_rg_name" {
  description = "mdw_dev_bastion_rg_name"
  default     = ".tmp-rg-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_tst_bastion_rg_name" {
  description = "mdw_tst_bastion_rg_name"
  default     = ".tmp-rg-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw-dev-bastion_pip_name" {
  description = "mdw-dev-bastion_pip_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw-tst-bastion_pip_name" {
  description = "mdw-tst-bastion_pip_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_bastion_pip_sku" {
  description = "mdw_bastion_pip_sku"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_dev_bastion_host_name" {
  description = "mdw_dev_bastion_host_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_tst_bastion_host_name" {
  description = "mdw_tst_bastion_host_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_bastion_host_ipname" {
  description = "mdw_bastion_host_ipname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_dev_bastion_diag_name" {
  description = "mdw_dev_bastion_diag_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mdw_tst_bastion_diag_name" {
  description = "mdw_tst_bastion_diag_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevBastionSubnetName" {
  description = "MDWHsDevBastionSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstBastionSubnetName" {
  description = "MDWHsTstBastionSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVnetName" {
  description = "MDWHsDevVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevNetworkingRgName" {
  description = "MDWHsDevNetworkingRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

############### MDW VM Import #####################

variable "MDWHs-Dev-environment" {
  description = "MDWHs-Dev-environment"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevkv" {
  description = "MDWHsTstkv"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevkvrg" {
  description = "MDWHsTstkvrg"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM01SubnetName" {
  description = "MDWHsDevVM01SubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM02SubnetName" {
  description = "MDWHsDevVM02SubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVM02SubnetName" {
  description = "MDWHsTstVM02SubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVmRgName" {
  description = "MDWHsDevVmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVm02RgName" {
  description = "MDWHsDevVm02RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVm02RgName" {
  description = "MDWHsTstVm02RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM01nicName" {
  description = "MDWHsDevVM01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM02nicName" {
  description = "MDWHsDevVM02nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVM02nicName" {
  description = "MDWHsTstVM02nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_accelerate_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM01nicIpConfigName" {
  description = "MDWHsDevVM01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM02nicIpConfigName" {
  description = "MDWHsDevVM02nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVM02nicIpConfigName" {
  description = "MDWHsTstVM02nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM01" {
  description = "MDWHsDevVM01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "DevVM01OSDiskName" {
  description = "DevVM01OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevVM02" {
  description = "MDWHsDevVM02"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "DevVM02OSDiskName" {
  description = "DevVM02OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVM02" {
  description = "MDWHsDevVM02"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "TstVM02OSDiskName" {
  description = "DevVM02OSDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "prepVm01Ps1FilePath" {
  description = "prepVm01Ps1FilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevrsv_name" {
  description = "MDWHsDevrsv_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsDevrsv_rg_name" {
  description = "MDWHsDevrsv_rg_name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
