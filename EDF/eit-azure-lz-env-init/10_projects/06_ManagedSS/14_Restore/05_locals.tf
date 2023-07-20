locals {
  emersonams01PrivateIpAddress = data.azurerm_key_vault_secret.emersonams01PrivateIpAddress.value
  os_disk_id                   = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.lzmanagedSsEmerson_vmrestoretargetRgName}/providers/Microsoft.Compute/disks/${var.vmosDiskName}"
  data_disk_id                 = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.lzmanagedSsEmerson_vmrestoretargetRgName}/providers/Microsoft.Compute/disks/${var.vmstorageDiskName}"
  vm_id                        = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.lzmanagedSsEmerson_vmrestoretargetRgName}/providers/Microsoft.Compute/virtualMachines/${var.eamvmName}"

  data_disk_id_r = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.lzmanagedSsEmerson_vmrestoretargetRgName}/providers/Microsoft.Compute/disks/${var.vmstorageDiskName_r}"
}
