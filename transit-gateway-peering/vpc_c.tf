###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "us_east_2_vpc_c" {
  cidr_block           = var.vpc_cidr_c
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "US-EAST-2-VPC-C"
  }
  provider = aws.us-east-2
}

###############################################
#  VPC C SUBNET 01                            #
###############################################
resource "aws_subnet" "us_east_2_vpc_c_subnet01" {
  vpc_id            = aws_vpc.us_east_2_vpc_c.id
  cidr_block        = var.us_east_2_vpc_c_subnet01
  availability_zone = var.us_east_2_vpc_c_availability_zone01

  tags = {
    Name = "US-EAST-2-VPC-C-SUBNET-01"
  }
  provider = aws.us-east-2
}

###############################################
#  VPC C SUBNET 02                            #
###############################################
resource "aws_subnet" "us_east_2_vpc_c_subnet02" {
  vpc_id            = aws_vpc.us_east_2_vpc_c.id
  cidr_block        = var.us_east_2_vpc_c_subnet02
  availability_zone = var.us_east_2_vpc_c_availability_zone02

  tags = {
    Name = "US-EAST-2-VPC-C-SUBNET-02"
  }
  provider = aws.us-east-2
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "us_east_2_vpc_c_rt01" {
  vpc_id = aws_vpc.us_east_2_vpc_c.id

  tags = {
    Name = "VPC C PRIVATE ROUTING TABLE"
  }
  provider = aws.us-east-2
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "us_east_2_vpc_c_rta01" {
  subnet_id      = aws_subnet.us_east_2_vpc_c_subnet01.id
  route_table_id = aws_route_table.us_east_2_vpc_c_rt01.id
  provider       = aws.us-east-2
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "us_east_2_vpc_c_rta02" {
  subnet_id      = aws_subnet.us_east_2_vpc_c_subnet02.id
  route_table_id = aws_route_table.us_east_2_vpc_c_rt01.id
  provider       = aws.us-east-2
}

################################################
#  ADDING DEFAULT NETWORK TO A ROUTE TABLE     #
################################################
resource "aws_route" "vpc_c_default_route" {
  route_table_id         = aws_route_table.us_east_2_vpc_c_rt01.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.us-east-2-tsg02.id
  provider               = aws.us-east-2
}
