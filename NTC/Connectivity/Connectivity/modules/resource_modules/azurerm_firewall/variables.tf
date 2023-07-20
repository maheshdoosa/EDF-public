variable "name" {
  type        = string
  description = "Specifies the name of the Firewall. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku_name" {
  type        = string
  description = "Sku name of the Firewall. Possible values are `AZFW_Hub` and `AZFW_VNet`. Changing this forces a new resource to be created."
  default     = null
}

variable "sku_tier" {
  type        = string
  description = "Sku tier of the Firewall. Possible values are `Premium` and `Standard`. Changing this forces a new resource to be created."
  default     = null
}

variable "firewall_policy_id" {
  type        = string
  description = "The ID of the Firewall Policy applied to this Firewall."
  default     = null
}

variable "dns_servers" {
  type        = list(string)
  description = "A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution."
  default     = null
}

variable "private_ip_ranges" {
  type        = list(string)
  description = "A list of SNAT private CIDR IP ranges, or the special string `IANAPrivateRanges`, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918."
  default     = null
}

# variable "threat_intel_mode" {
#   type        = string
#   description = <<-EOT
#   The operation mode for threat intelligence-based filtering. Possible values are: `Off`, `Alert`,`Deny` and `""` (empty string).
#   EOT
#   default     = "Alert"
# }

variable "zones" {
  type        = list(string)
  description = "Specifies the availability zones in which the Azure Firewall should be created. Changing this forces a new resource to be created."
  default     = null
}

variable "virtual_hub" {
  type = object({
    virtual_hub_id  = string
    public_ip_count = number
  })

  description = <<-EOT
    A virtual_hub object with the below properties:

    &bull; `virtual_hub_id` = string - Specifies the ID of the Virtual Hub where the Firewall resides in.

    &bull; `public_ip_count` = number - Specifies the number of public IPs to assign to the Firewall. Default would normally be 1

    **NOTE**: Although `virtual_hub` itself is an optional variable, if a value is provided then both attributes in the object must be populated.
    EOT
  default     = null
}

variable "management_ip_configuration" {
  type = object({
    name                 = string
    subnet_id            = string
    public_ip_address_id = string
  })
  description = <<-EOT
    A management_ip_configuration block, which allows force-tunnelling of traffic to be performed by the firewall. Adding or removing this block or changing the subnet_id in an existing block forces a new resource to be created.
    
    It is provided as an object as per below:

    &bull; `name` = string - Specifies the name of the IP Configuration.

    &bull; `subnet_id` = string - Reference to the subnet associated with the IP Configuration. Changing this forces a new resource to be created.

    &bull; `public_ip_address_id` = string - The ID of the Public IP Address associated with the firewall.

    **NOTE**: Although `management_ip_configuration` itself is an optional variable, if you do provide a value then all properties need to be populated.
    EOT

  default = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."

  default = {}
}

variable "ip_configuration_name" {
  type = string
  description = "A name used for this IP Configuration."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in."
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the Public IP where this Network Interface should be located in."
}

variable "policy_name" {
  type        = string
  description = "The name of this Firewall Policy."
  default     = null
}

variable "policy_resource_group_name" {
  type        = string
  description = "The name of the Resource Grouptop assocaite to the Firewall."
  default     = null
}

variable "policy_subscription_id" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}

# ==================== #
# LOG ANALYTICS 
# ==================== #
variable "monitor_diagnostic_settings_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_subscription_id" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}