

variable "ApexHsResourceLocation" {
  description = "apexHsResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ApexHsprdvmRgName" {
  description = "apexHsprdvmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsprdvm01nicname" {
  description = "apexHsprdvm01nicname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsprdvm02nicname" {
  description = "apexHsprdvm02nicname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "VM01nicIpConfigName" {
  description = "VM01nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "VM02nicIpConfigName" {
  description = "VM02nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


variable "ApexHsprdvm01Name" {
  description = "ApexHsprdvm01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsprdvm02Name" {
  description = "ApexHsprdvm02Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsvm01osDiskName" {
  description = "ApexHsvm01osDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsvm02osDiskName" {
  description = "ApexHsvm02osDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "scriptsstorageAccountName" {
  description = "scriptsstorageAccountName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "saContainerName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountName" {
  description = "boot diagnostics logs storage account name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountRgName" {
  description = "boot diagnostics logs storage Rg name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsprdVnetName" {
  description = "ApexHsprdVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ApexHsprdSubnetName" {
  description = "ApexHsprdSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ApexHsprdNetworkingRgName" {
  description = "ApexHsprdNetworkingRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "apexHsKvName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "DomainJoinFilePath" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "adAdminGroup" {
  description = "The AD group that needs to be added in sudoers"
  type        = string
}


################# Variables for managed disk ####################################

variable "managed_disk" {
  description = "(Optional) create disk"
  type = map(object({
    vmstorageDiskName    = string,
    disk_size_gb         = string,
    storage_account_type = string,
    create_option        = string,
    zone                 = string
  }))
}

variable "ApexHsprdmanageddiskvm01" {
  type        = string
  description = "Data disk for VM"

}

variable "ApexHsprdmanageddiskvm02" {
  type        = string
  description = "Data disk for VM"

}

######### RecoveryServiceVault ############

variable "rsv_resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}


variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "infraVM_backup_policy_01" {
  description = "Name of the backup policy which will be applied"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "vm_name" {
  description = "(Optional) sku of the resource"
  type = map(object({
    recovery_vault_name   = string,
    rsv_resourceGroupName = string,
    vm_id                 = string,
    policy_id             = string
  }))
}
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
