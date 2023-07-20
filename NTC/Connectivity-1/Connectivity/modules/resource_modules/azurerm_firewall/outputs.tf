output "id" {
  value       = azurerm_firewall.firewall.id
  description = "The ID of the Azure Firewall."
}

output "ip_configuration" {
  value       = azurerm_firewall.firewall.ip_configuration
  description = "The ip_configuration block exports private_ip_address of the azure firewall as a sub attribute."
}

output "virtual_hub" {
  value       = azurerm_firewall.firewall.virtual_hub
  description = "The virtual_hub block exports private and public ip addresses as sub attributes. Property names are private_ip_address and public_ip_address."
}

output "name" {
  value       = azurerm_firewall.firewall.name
  description = "The name of the Azure Firewall."
}
