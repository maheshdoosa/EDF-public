output "firewall_subnet_id" {
  value       = contains(keys(module.subnets), "AzureFirewallSubnet") ? module.subnets["AzureFirewallSubnet"].subnet_id : null
  description = "The ID of the subnet to be used by the firewall."
}
output "bastion_subnet_id" {
  value       = contains(keys(module.subnets),"AzureBastionSubnet") ? module.subnets["AzureBastionSubnet"].subnet_id : null
  description = "The ID of the subnet to be used by Bastion."
}
output "gateway_subnet_id" {
  value       = contains(keys(module.subnets), "GatewaySubnet") ? module.subnets["GatewaySubnet"].subnet_id : null
  description = "The ID of the subnet to be used by Virtual Network Gateway."
}
output "network_security_groups_ids" {
  value       = tolist([ for network_security_group in module.network_security_groups : "${network_security_group.nsg_id}" ])
  description = "The ID of all subnets."
}