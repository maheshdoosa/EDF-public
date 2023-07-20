variable "location" {
  type = string
}
variable "vpc_name" {
  type = list(any)
}
variable "az" {
  type = list(any)
}
variable "cidr_block" {
  type = list(any)
}
variable "env" {
  type = list(any)
}
variable "igw_name" {
  type = list(any)
}
variable "nacl_name" {
  type = list(any)
}
variable "subnet_name" {
  type = list(any)
}
variable "rt" {
  type = string
}
variable "eni_name" {
  type = list(any)
}