###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "vpc_ingress" {
  cidr_block           = var.vpc_cidr_ingress
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_ingress"
  }
}

###############################################
#  VPC INGRESS SUBNET 01                      #
###############################################
resource "aws_subnet" "vpc_ingress_subnet01" {
  vpc_id            = aws_vpc.vpc_ingress.id
  cidr_block        = var.vpc_ingress_subnet01
  availability_zone = var.vpc_ingress_availability_zone01

  tags = {
    Name = "vpc_ingress_subnet01"
  }
}

###############################################
#  VPC INGRESS SUBNET 02                      #
###############################################
resource "aws_subnet" "vpc_ingress_subnet02" {
  vpc_id            = aws_vpc.vpc_ingress.id
  cidr_block        = var.vpc_ingress_subnet02
  availability_zone = var.vpc_ingress_availability_zone02

  tags = {
    Name = "vpc_ingress_subnet02"
  }
}

###############################################
#  VPC INGRESS SUBNET 03                      #
###############################################
resource "aws_subnet" "vpc_ingress_subnet03" {
  vpc_id            = aws_vpc.vpc_ingress.id
  cidr_block        = var.vpc_ingress_subnet03
  availability_zone = var.vpc_ingress_availability_zone01

  tags = {
    Name = "vpc_ingress_subnet03"
  }
}

###############################################
#  VPC INGRESS SUBNET 04                      #
###############################################
resource "aws_subnet" "vpc_ingress_subnet04" {
  vpc_id            = aws_vpc.vpc_ingress.id
  cidr_block        = var.vpc_ingress_subnet04
  availability_zone = var.vpc_ingress_availability_zone02

  tags = {
    Name = "vpc_ingress_subnet04"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "vpc_ingress_rt01" {
  vpc_id = aws_vpc.vpc_ingress.id

  tags = {
    Name = "vpc_ingress public route table"
  }
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_ingress_rta01" {
  subnet_id      = aws_subnet.vpc_ingress_subnet01.id
  route_table_id = aws_route_table.vpc_ingress_rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_ingress_rta02" {
  subnet_id      = aws_subnet.vpc_ingress_subnet02.id
  route_table_id = aws_route_table.vpc_ingress_rt01.id
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ingress_vpc_ig" {
  vpc_id = aws_vpc.vpc_ingress.id

  tags = {
    Name = "vpc_ingress internet gateway"
  }
}

################################################
#  ADDING DEFAULT GATEWAY TO ROUTE TABLE       #
################################################
resource "aws_route" "ingress_vpc_internet_gateway" {
  route_table_id         = aws_route_table.vpc_ingress_rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ingress_vpc_ig.id
}

################################################
#  ADDING NETWORK VPC A TO A ROUTE TABLE       #
################################################
resource "aws_route" "ingress_to_vpc_a" {
  route_table_id         = aws_route_table.vpc_ingress_rt01.id
  destination_cidr_block = var.vpc_cidr_a
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_ingress_rt01]
}

###############################################
#  ADDING NETWORK VPC B TO A ROUTE TABLE      #
################################################
resource "aws_route" "ingress_to_vpc_b" {
  route_table_id         = aws_route_table.vpc_ingress_rt01.id
  destination_cidr_block = var.vpc_cidr_b
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_ingress_rt01]
}

################################################
#  ADDING NETWORK VPC EGRESS TO A ROUTE TABLE  #
################################################
resource "aws_route" "ingress_to_vpc_egress" {
  route_table_id         = aws_route_table.vpc_ingress_rt01.id
  destination_cidr_block = var.vpc_cidr_egress
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_ingress_rt01]
}
