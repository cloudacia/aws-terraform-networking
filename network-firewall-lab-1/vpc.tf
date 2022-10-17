###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Cloudacia"
  }
}

###############################################
#  SUBNET 01                                  #
###############################################
resource "aws_subnet" "firewall_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = "Firewall Subnet"
  }
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "protected_subnet" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet02
  availability_zone = var.availability_zone02

  tags = {
    Name = "Protected Subnet"
  }
}


###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "IGW Ingress route table"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt02" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Firewall Subnet Route Table"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt03" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Protected Subnet Route Table"
  }
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.firewall_subnet.id
  route_table_id = aws_route_table.rt02.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta02" {
  subnet_id      = aws_subnet.protected_subnet.id
  route_table_id = aws_route_table.rt03.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta03" {
  route_table_id = aws_route_table.rt01.id
  gateway_id     = aws_internet_gateway.ig.id

}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Cloudacia"
  }
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.rt02.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "ingress_routing" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = var.subnet02
  vpc_endpoint_id        = aws_networkfirewall_firewall.firewall_1.*.firewall_status[0].*.sync_states[0].*.attachment[0].0.endpoint_id
}

################################################
#  ADDING DEFAULT ROUTE TO FIREWALL SUBNET     #
################################################
resource "aws_route" "firewall_endpoint_01" {
  route_table_id         = aws_route_table.rt03.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_networkfirewall_firewall.firewall_1.*.firewall_status[0].*.sync_states[0].*.attachment[0].0.endpoint_id
}

#resource "aws_route" "fw_endpoint_01" {
#  count                  = length(aws_subnet.subnet03.*.id)
#  route_table_id         = aws_route_table.rt02.id
#  destination_cidr_block = "0.0.0.0/0"
#  vpc_endpoint_id        = aws_networkfirewall_firewall.firewall_1.*.firewall_status[count.index].*.sync_states[0].*.attachment[0].0.endpoint_id
#}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.this.id
  service_name    = var.s3_endpoint
  route_table_ids = [aws_route_table.rt03.id]

  tags = {
    Name = "S3 VPC ENDPOINT"
  }
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.this.id
  subnet_ids          = [aws_subnet.protected_subnet.id]
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
  subnet_ids          = [aws_subnet.protected_subnet.id]
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
  subnet_ids          = [aws_subnet.protected_subnet.id]
  service_name        = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "SSM EC2MESSAGES VPC ENDPOINT"
  }
}
