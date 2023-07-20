variable "dns_policies" {
  type        = list(any)
  description = "list of custom dns policies"
  default     = []
}

variable "dns_policies_initiative" {
  type        = list(any)
  description = "list of custom dns policies initiative"
  default     = []
}

variable "dns_policies_assignment" {
  type        = list(any)
  description = "list of custom dns policies assignment"
  default     = []
}
