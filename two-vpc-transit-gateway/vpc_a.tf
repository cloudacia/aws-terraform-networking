###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "vpc_a" {
  cidr_block           = var.vpc_cidr_a
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_a"
  }
}


###############################################
#  VPC A SUBNET 01                            #
###############################################
resource "aws_subnet" "vpc_a_subnet01" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = var.vpc_a_subnet01
  availability_zone = var.vpc_a_availability_zone01

  tags = {
    Name = "vpc_a_subnet01"
  }
}

###############################################
#  VPC A SUBNET 02                            #
###############################################
resource "aws_subnet" "vpc_a_subnet02" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = var.vpc_a_subnet02
  availability_zone = var.vpc_a_availability_zone02

  tags = {
    Name = "vpc_a_subnet02"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "vpc_a_rt01" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "vpc_a public route table"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "vpc_a_rt02" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "vpc_a private route table"
  }
}


###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_a_rta01" {
  subnet_id      = aws_subnet.vpc_a_subnet01.id
  route_table_id = aws_route_table.vpc_a_rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_a_rta02" {
  subnet_id      = aws_subnet.vpc_a_subnet02.id
  route_table_id = aws_route_table.vpc_a_rt02.id
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "vpc_a internet gateway"
  }
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.vpc_a_rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

################################################
#  ADDING VPC B NETOWRK TO A ROUTE TABLE       #
################################################
resource "aws_route" "vpc_b_network" {
  route_table_id         = aws_route_table.vpc_a_rt01.id
  destination_cidr_block = var.vpc_cidr_b
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_a_rt01]
}

################################################
#  ADDING VPC B NETOWRK TO A ROUTE TABLE       #
################################################
resource "aws_route" "vpc_b_network_2" {
  route_table_id         = aws_route_table.vpc_a_rt02.id
  destination_cidr_block = var.vpc_cidr_b
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_a_rt02]
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "vpc_a_s3_endpoint" {
  vpc_id          = aws_vpc.vpc_a.id
  service_name    = var.s3_endpoint
  route_table_ids = [aws_route_table.vpc_a_rt02.id]

  tags = {
    Name = "S3 VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.vpc_a.id
  subnet_ids          = [aws_subnet.vpc_a_subnet02.id]
  service_name        = var.ssm_enpoint_1
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id              = aws_vpc.vpc_a.id
  subnet_ids          = [aws_subnet.vpc_a_subnet02.id]
  service_name        = var.ssm_enpoint_2
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM MESSAGES VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.vpc_a.id
  subnet_ids          = [aws_subnet.vpc_a_subnet02.id]
  service_name        = var.ssm_enpoint_3
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM EC2MESSAGES VPC ENDPOINT"
  }
}
