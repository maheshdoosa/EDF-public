variable "policies_initiative" {
  type        = list(any)
  description = "list of custom dns policies initiative"
  default     = []
}

variable "policies_assignment" {
  type        = list(any)
  description = "list of custom dns policies assignment"
  default     = []
}
