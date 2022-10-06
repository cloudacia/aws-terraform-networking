###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Development"
  }
}

###############################################
#  SUBNET 01                                  #
###############################################
resource "aws_subnet" "subnet01" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = "Subnet01"
  }
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "subnet02" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet02
  availability_zone = var.availability_zone02

  tags = {
    Name = "Subnet02"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Public Route Table"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt02" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Private Route Table"
  }
}


###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta02" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.rt02.id
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Development"
  }
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}


################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.this.id
  service_name    = var.s3_endpoint
  route_table_ids = [aws_route_table.rt02.id]

  tags = {
    Name = "S3 VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.this.id
  subnet_ids          = [aws_subnet.subnet02.id]
  service_name        = "com.amazonaws.us-east-1.ssm"
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
  vpc_id              = aws_vpc.this.id
  subnet_ids          = [aws_subnet.subnet02.id]
  service_name        = "com.amazonaws.us-east-1.ssmmessages"
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
  vpc_id              = aws_vpc.this.id
  subnet_ids          = [aws_subnet.subnet02.id]
  service_name        = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM EC2MESSAGES VPC ENDPOINT"
  }
}
