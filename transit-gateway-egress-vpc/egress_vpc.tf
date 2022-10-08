###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "vpc_egress" {
  cidr_block           = var.vpc_cidr_egress
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_egress"
  }
}

###############################################
#  VPC A SUBNET 01                            #
###############################################
resource "aws_subnet" "vpc_egress_subnet01" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.vpc_egress_subnet01
  availability_zone = var.vpc_egress_availability_zone01

  tags = {
    Name = "vpc_egress_subnet01"
  }
}


###############################################
#  VPC A SUBNET 02                            #
###############################################
resource "aws_subnet" "vpc_egress_subnet02" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.vpc_egress_subnet02
  availability_zone = var.vpc_egress_availability_zone02

  tags = {
    Name = "vpc_egress_subnet02"
  }
}

###############################################
#  VPC A SUBNET 03                            #
###############################################
resource "aws_subnet" "vpc_egress_subnet03" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.vpc_egress_subnet03
  availability_zone = var.vpc_egress_availability_zone01

  tags = {
    Name = "vpc_egress_subnet03"
  }
}

###############################################
#  VPC A SUBNET 04                            #
###############################################
resource "aws_subnet" "vpc_egress_subnet04" {
  vpc_id            = aws_vpc.vpc_egress.id
  cidr_block        = var.vpc_egress_subnet04
  availability_zone = var.vpc_egress_availability_zone02

  tags = {
    Name = "vpc_egress_subnet04"
  }
}

###############################################
#  ROUTING TABLE #1                           #
###############################################
resource "aws_route_table" "vpc_egress_rt01" {
  vpc_id = aws_vpc.vpc_egress.id

  tags = {
    Name = "vpc_egress route table #1 (public)"
  }
}

###############################################
#  ROUTING TABLE #2                           #
###############################################
resource "aws_route_table" "vpc_egress_rt02" {
  vpc_id = aws_vpc.vpc_egress.id

  tags = {
    Name = "vpc_egress route table #2 (private)"
  }
}

###############################################
#  ROUTING TABLE #3                           #
###############################################
resource "aws_route_table" "vpc_egress_rt03" {
  vpc_id = aws_vpc.vpc_egress.id

  tags = {
    Name = "vpc_egress route table #3 (private)"
  }
}


###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_egress_rta01" {
  subnet_id      = aws_subnet.vpc_egress_subnet01.id
  route_table_id = aws_route_table.vpc_egress_rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_egress_rta02" {
  subnet_id      = aws_subnet.vpc_egress_subnet02.id
  route_table_id = aws_route_table.vpc_egress_rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_egress_rta03" {
  subnet_id      = aws_subnet.vpc_egress_subnet03.id
  route_table_id = aws_route_table.vpc_egress_rt02.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_egress_rta04" {
  subnet_id      = aws_subnet.vpc_egress_subnet04.id
  route_table_id = aws_route_table.vpc_egress_rt03.id
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc_egress.id

  tags = {
    Name = "vpc_egress internet gateway"
  }
}

################################################
#  ADDING DEFAULT GATEWAY TO ROUTE TABLE       #
################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.vpc_egress_rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

################################################
#  ADDING DEFAULT GATEWAY TO ROUTE TABLE       #
################################################
resource "aws_route" "default_gateway_2" {
  route_table_id         = aws_route_table.vpc_egress_rt02.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.egress_vpc_nat_gateway_1.id
}

################################################
#  ADDING DEFAULT GATEWAY TO ROUTE TABLE       #
################################################
resource "aws_route" "default_gateway_3" {
  route_table_id         = aws_route_table.vpc_egress_rt03.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.egress_vpc_nat_gateway_2.id
}

################################################
#  ADDING NETWORK VPC A TO A ROUTE TABLE       #
################################################
resource "aws_route" "vpc_a_route" {
  route_table_id         = aws_route_table.vpc_egress_rt01.id
  destination_cidr_block = var.vpc_cidr_a
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_b_rt01]
}

################################################
#  ADDING NETWORK VPC B TO A ROUTE TABLE       #
################################################
resource "aws_route" "vpc_b_route" {
  route_table_id         = aws_route_table.vpc_egress_rt01.id
  destination_cidr_block = var.vpc_cidr_b
  transit_gateway_id     = aws_ec2_transit_gateway.tg01.id
  depends_on             = [aws_route_table.vpc_b_rt01]
}

####################################################
# EIP for a NAT Gateway                            #
####################################################
resource "aws_eip" "ip_nat01" {
  vpc = true

  tags = {
    Name = "NAT Gateway #1"
  }
}

################################################
#  NAT GATEWAY #1                              #
################################################
resource "aws_nat_gateway" "egress_vpc_nat_gateway_1" {
  allocation_id = aws_eip.ip_nat01.id
  subnet_id     = aws_subnet.vpc_egress_subnet01.id

  tags = {
    Name = "gw NAT #1"
  }

  depends_on = [aws_internet_gateway.ig]
}

####################################################
# EIP for a NAT Gateway                            #
####################################################
resource "aws_eip" "ip_nat02" {
  vpc = true

  tags = {
    Name = "NAT Gateway #2"
  }
}

################################################
#  NAT GATEWAY #1                              #
################################################
resource "aws_nat_gateway" "egress_vpc_nat_gateway_2" {
  allocation_id = aws_eip.ip_nat02.id
  subnet_id     = aws_subnet.vpc_egress_subnet02.id

  tags = {
    Name = "gw NAT #2"
  }

  depends_on = [aws_internet_gateway.ig]
}
