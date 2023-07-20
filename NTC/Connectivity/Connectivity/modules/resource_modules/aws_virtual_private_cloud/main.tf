#create prod vpc
resource "aws_vpc" "prod_vpc" {
  cidr_block       = var.cidr_block[0]
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name[0]
    Env  = var.env[0]
  }
}
#Create prod subnet1
resource "aws_subnet" "prod_subnet1" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = var.cidr_block[0]

  tags = {
    Name = var.subnet_name[0]
    Env  = var.env[0]
  }
}
#Create prod subnet1 nacl
resource "aws_network_acl" "prodsubnet1_nacl" {
  vpc_id = aws_vpc.prod_vpc.id

  egress {
    protocol   = var.egress_protocol
    rule_no    = var.egress_rule_no 
    action     = var.egress_action
    cidr_block = var.cidr_block[0]
    from_port  = var.egress_from_port
    to_port    = var.egress_to_port
  }

  ingress {
    protocol   = var.ingress_protocol
    rule_no    = var.ingress_rule_no
    action     = var.ingress_action
    cidr_block = var.cidr_block[0]
    from_port  = var.ingress_from_port
    to_port    = var.ingress_to_port
  }

  tags = {
    Name = var.nacl_name[0]
    Env  = var.env[0]
  }
}
#Create Elastic Network Interface for prod subnet1
resource "aws_network_interface" "prodsubnet1_eni" {
  subnet_id = aws_subnet.prod_subnet1.id

  tags = {
    Name = var.eni_name[0]
    Env  = var.env[0]
  }
}
#Create Elastic Network Interface for prod subnet2
resource "aws_network_interface" "prodsubnet2_eni" {
  subnet_id = aws_subnet.prod_subnet2.id

  tags = {
    Name = var.eni_name[1]
    Env  = var.env[0]
  }
}
#Create Elastic Network Interface for prod subnet3
resource "aws_network_interface" "prodsubnet3_eni" {
  subnet_id = aws_subnet.prod_subnet3.id

  tags = {
    Name = var.eni_name[2]
    Env  = var.env[0]
  }
}

#Create Route table in vpchub
resource "aws_route_table" "vpchub_rt" {
  vpc_id = aws_vpc.vpc_hub.id

  route {
    cidr_block         = var.cidr_block[0]
    transit_gateway_id = aws_transit_gateway.vpchub_tgw.id
  }

  tags = {
    Name = var.rt
    Env  = var.env[2]
  }
}
#Create AWS Site to Site VPN
resource "aws_site_to_site_vpn_connection" "vpchub_stsvpn" {
  customer_gateway_id = aws_customer_gateway.example.id
  transit_gateway_id  = aws_ec2_transit_gateway.vpchub_tgw.id
  type                = aws_customer_gateway.example.type

  tags = {
    Name = vpchub_stsvpn
    Env  = var.env[2]
  }
}
#Create AWS transit gateway, peer prod vpc to it, then peer nonprod vpc to it, then connect aws site to site vpn to it
resource "aws_transit_gateway" "vpchub_tgw" {
  description                     = "Transit Gateway in the vpc hub"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = vpchub_tgw
    Env  = var.env[2]
  }
}
resource "aws_transit_gateway_vpc_attachment" "vpc_peering1" {
  subnet_ids         = [aws_subnet.vpchub_subnet.id]
  transit_gateway_id = aws_transit_gateway.vpchub_tgw.id
  vpc_id             = aws_vpc.nonprod_vpc.id
}
resource "aws_transit_gateway_vpc_attachment" "vpc_peering2" {
  subnet_ids         = [aws_subnet.vpchub_subnet.id]
  transit_gateway_id = aws_transit_gateway.vpchub_tgw.id
  vpc_id             = aws_vpc.prod_vpc.id
}
