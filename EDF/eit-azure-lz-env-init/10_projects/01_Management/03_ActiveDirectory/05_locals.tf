locals {
  subId   = data.azurerm_key_vault_secret.subscriptionId.value
  ad1vmId = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/Microsoft.Compute/virtualMachines/${var.virtualMachineName1}"
  ad2vmId = "/subscriptions/${local.subId}/resourceGroups/${var.resourceGroupName}/providers/Microsoft.Compute/virtualMachines/${var.virtualMachineName2}"
}
