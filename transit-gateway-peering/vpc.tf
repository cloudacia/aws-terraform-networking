###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "us_east_1_vpc_a" {
  cidr_block           = var.vpc_cidr_a
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "US-EAST-1-VPC-A"
  }
  provider = aws.us-east-1
}


###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "us_east_1_vpc_b" {
  cidr_block           = var.vpc_cidr_b
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "US-EAST-1-VPC-B"
  }
  provider = aws.us-east-1
}

###############################################
#  VPC A SUBNET 01                            #
###############################################
resource "aws_subnet" "us_east_1_vpc_a_subnet01" {
  vpc_id            = aws_vpc.us_east_1_vpc_a.id
  cidr_block        = var.us_east_1_vpc_a_subnet01
  availability_zone = var.us_east_1_vpc_a_availability_zone01

  tags = {
    Name = "US-EAST-1-VPC-A-SUBNET-01"
  }
  provider = aws.us-east-1
}

###############################################
#  VPC A SUBNET 02                            #
###############################################
resource "aws_subnet" "us_east_1_vpc_a_subnet02" {
  vpc_id            = aws_vpc.us_east_1_vpc_a.id
  cidr_block        = var.us_east_1_vpc_a_subnet02
  availability_zone = var.us_east_1_vpc_a_availability_zone02

  tags = {
    Name = "US-EAST-1-VPC-A-SUBNET-02"
  }
  provider = aws.us-east-1
}

###############################################
#  VPC B SUBNET 01                            #
###############################################
resource "aws_subnet" "us_east_1_vpc_b_subnet01" {
  vpc_id            = aws_vpc.us_east_1_vpc_b.id
  cidr_block        = var.us_east_1_vpc_b_subnet01
  availability_zone = var.us_east_1_vpc_b_availability_zone01

  tags = {
    Name = "US-EAST-1-VPC-B-SUBNET-01"
  }
  provider = aws.us-east-1
}

###############################################
#  VPC B SUBNET 02                            #
###############################################
resource "aws_subnet" "us_east_1_vpc_b_subnet02" {
  vpc_id            = aws_vpc.us_east_1_vpc_b.id
  cidr_block        = var.us_east_1_vpc_b_subnet02
  availability_zone = var.us_east_1_vpc_b_availability_zone02

  tags = {
    Name = "US-EAST-1-VPC-B-SUBNET-02"
  }
  provider = aws.us-east-1
}


###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "us_east_1_vpc_a_rt01" {
  vpc_id = aws_vpc.us_east_1_vpc_a.id

  tags = {
    Name = "VPC A PRIVATE ROUTING TABLE"
  }
  provider = aws.us-east-1
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "us_east_1_vpc_b_rt01" {
  vpc_id = aws_vpc.us_east_1_vpc_b.id

  tags = {
    Name = "VPC B PRIVATE ROUTING TABLE"
  }
  provider = aws.us-east-1
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "us_east_1_vpc_a_rta01" {
  subnet_id      = aws_subnet.us_east_1_vpc_a_subnet01.id
  route_table_id = aws_route_table.us_east_1_vpc_a_rt01.id
  provider       = aws.us-east-1
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "us_east_1_vpc_a_rta02" {
  subnet_id      = aws_subnet.us_east_1_vpc_a_subnet02.id
  route_table_id = aws_route_table.us_east_1_vpc_a_rt01.id
  provider       = aws.us-east-1
}


###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "us_east_1_vpc_b_rta01" {
  subnet_id      = aws_subnet.us_east_1_vpc_b_subnet01.id
  route_table_id = aws_route_table.us_east_1_vpc_b_rt01.id
  provider       = aws.us-east-1
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "us_east_1_vpc_b_rta02" {
  subnet_id      = aws_subnet.us_east_1_vpc_b_subnet02.id
  route_table_id = aws_route_table.us_east_1_vpc_b_rt01.id
  provider       = aws.us-east-1
}
