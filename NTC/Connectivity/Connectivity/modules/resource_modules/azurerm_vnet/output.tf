output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network."
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network."
}

output "ddos_id" {
  value       = azurerm_network_ddos_protection_plan.ddos.*.id
  description = "The ID of the DDoS Protection Plan (if enabled)."
}