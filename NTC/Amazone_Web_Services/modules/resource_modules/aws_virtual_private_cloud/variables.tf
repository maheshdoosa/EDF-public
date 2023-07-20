variable "location" {
  type = string
}
variable "vpc_name" {
  type = list(any)
}
variable "cidr_block" {
  type = list(any)
}
variable "subnet_name" {
  type = list(any)
}
variable "rt" {
  type = string
}
variable "tags" {
  type = list(any)
}
variable "egress_protocol" {
  type = list(any)
}
variable "egress_rule_no" {
  type = list(any)
}
variable "egress_action" {
  type = list(any)
}
variable "egress_from_port" {
  type = list(any)
}
variable "egress_to_port" {
  type = list(any)
}
variable "ingress_protocol" {
  type = list(any)
}
variable "ingress_rule_no" {
  type = list(any)
}
variable "ingress_action" {
  type = list(any)
}
variable "ingress_from_port" {
  type = list(any)
}
variable "ingress_to_port" {
  type = list(any)
}
variable "instance_tenancy" {
  type = list(any)
}
variable "description" {
  type = list(any)
}
variable "default_route_table_association" {
  type = list(any)
}
variable "default_route_table_propagation" {
  type = list(any)
}