###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "vpc_b" {
  cidr_block           = var.vpc_cidr_b
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_b"
  }
}

###############################################
#  VPC A SUBNET 01                            #
###############################################
resource "aws_subnet" "vpc_b_subnet01" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = var.vpc_b_subnet01
  availability_zone = var.vpc_b_availability_zone01

  tags = {
    Name = "vpc_b_subnet01"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "vpc_b_rt01" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name = "vpc_b private route table"
  }
}

################################################
#  ADDING VPC A NETOWRK TO A ROUTE TABLE       #
################################################
resource "aws_route" "vpc_a_network" {
  route_table_id            = aws_route_table.vpc_b_rt01.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_a_to_vpc_b.id
  depends_on                = [aws_route_table.vpc_b_rt01]
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "vpc_b_rta01" {
  subnet_id      = aws_subnet.vpc_b_subnet01.id
  route_table_id = aws_route_table.vpc_b_rt01.id
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "vpc_b_s3_endpoint" {
  vpc_id          = aws_vpc.vpc_b.id
  service_name    = var.s3_endpoint
  route_table_ids = [aws_route_table.vpc_b_rt01.id]

  tags = {
    Name = "S3 VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "vpc_b_ssm" {
  vpc_id              = aws_vpc.vpc_b.id
  subnet_ids          = [aws_subnet.vpc_b_subnet01.id]
  service_name        = var.ssm_enpoint_1
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_b_ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "vpc_b_ssm_messages" {
  vpc_id              = aws_vpc.vpc_b.id
  subnet_ids          = [aws_subnet.vpc_b_subnet01.id]
  service_name        = var.ssm_enpoint_2
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_b_ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM MESSAGES VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "vpc_b_ec2messages" {
  vpc_id              = aws_vpc.vpc_b.id
  subnet_ids          = [aws_subnet.vpc_b_subnet01.id]
  service_name        = var.ssm_enpoint_3
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.vpc_b_ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM EC2MESSAGES VPC ENDPOINT"
  }
}
