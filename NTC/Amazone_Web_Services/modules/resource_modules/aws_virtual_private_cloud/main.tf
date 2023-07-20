#create prod vpc
resource "aws_vpc" "prod_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags = var.tags
}
#Create prod subnet1
resource "aws_subnet" "prod_subnet1" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = var.cidr_block
  tags = var.tags
}
#Create prod subnet1 nacl
resource "aws_network_acl" "prodsubnet1_nacl" {
  vpc_id = aws_vpc.prod_vpc.id

  egress {
    protocol   = var.egress_protocol
    rule_no    = var.egress_rule_no 
    action     = var.egress_action
    cidr_block = var.cidr_block
    from_port  = var.egress_from_port
    to_port    = var.egress_to_port
  }

  ingress {
    protocol   = var.ingress_protocol
    rule_no    = var.ingress_rule_no
    action     = var.ingress_action
    cidr_block = var.cidr_block
    from_port  = var.ingress_from_port
    to_port    = var.ingress_to_port
  }
  tags = var.tags
}
#Create Elastic Network Interface for prod subnet1
resource "aws_network_interface" "prodsubnet1_eni" {
  subnet_id = aws_subnet.prod_subnet1.id
  tags = var.tags
}

#Create Route table in vpchub
resource "aws_route_table" "vpchub_rt" {
  vpc_id = aws_vpc.vpc_hub.id

  route {
    cidr_block         = var.cidr_block
    transit_gateway_id = aws_transit_gateway.vpchub_tgw.id
  }
  tags = var.tags
}
#Create AWS Site to Site VPN
resource "aws_site_to_site_vpn_connection" "vpchub_stsvpn" {
  customer_gateway_id = aws_customer_gateway.example.id
  transit_gateway_id  = aws_ec2_transit_gateway.vpchub_tgw.id
  type                = aws_customer_gateway.example.type
  tags = var.tags
}
#Create AWS transit gateway, peer prod vpc to it, then peer nonprod vpc to it, then connect aws site to site vpn to it
resource "aws_transit_gateway" "vpchub_tgw" {
  description                     = var.description
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  tags = var.tags
}
resource "aws_transit_gateway_vpc_attachment" "vpc_peering1" {
  subnet_ids         = [aws_subnet.vpchub_subnet.id]
  transit_gateway_id = aws_transit_gateway.vpchub_tgw.id
  vpc_id             = aws_vpc.prod_vpc.id
}