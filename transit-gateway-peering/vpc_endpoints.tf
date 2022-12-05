################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_a_s3_endpoint_1" {
  vpc_id          = aws_vpc.us_east_1_vpc_a.id
  service_name    = var.s3_endpoint
  route_table_ids = [aws_route_table.us_east_1_vpc_a_rt01.id]

  tags = {
    Name = "US-EAST-1-VPC-A-S3-VPC-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_a_ssm_1" {
  vpc_id              = aws_vpc.us_east_1_vpc_a.id
  subnet_ids          = [aws_subnet.us_east_1_vpc_a_subnet01.id]
  service_name        = var.ssm_enpoint_1
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-1-VPC-A-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_a_ssm_messages_1" {
  vpc_id              = aws_vpc.us_east_1_vpc_a.id
  subnet_ids          = [aws_subnet.us_east_1_vpc_a_subnet01.id]
  service_name        = var.ssm_enpoint_2
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-1-VPC-A-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_a_ec2messages_1" {
  vpc_id              = aws_vpc.us_east_1_vpc_a.id
  subnet_ids          = [aws_subnet.us_east_1_vpc_a_subnet01.id]
  service_name        = var.ssm_enpoint_3
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-1-VPC-A-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_b_s3_endpoint_1" {
  vpc_id          = aws_vpc.us_east_1_vpc_b.id
  service_name    = var.s3_endpoint
  route_table_ids = [aws_route_table.us_east_1_vpc_b_rt01.id]

  tags = {
    Name = "US-EAST-1-VPC-B-S3-VPC-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_2_vpc_c_s3_endpoint_1" {
  vpc_id          = aws_vpc.us_east_2_vpc_c.id
  service_name    = var.s3_endpoint_us_east_2
  route_table_ids = [aws_route_table.us_east_2_vpc_c_rt01.id]

  tags = {
    Name = "US-EAST-2-VPC-B-S3-VPC-ENDPOINT"
  }

  provider = aws.us-east-2
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_b_ssm_2" {
  vpc_id              = aws_vpc.us_east_1_vpc_b.id
  subnet_ids          = [aws_subnet.us_east_1_vpc_b_subnet01.id]
  service_name        = var.ssm_enpoint_1
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint_vpc_b.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-1-VPC-B-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_b_ssm_messages_2" {
  vpc_id              = aws_vpc.us_east_1_vpc_b.id
  subnet_ids          = [aws_subnet.us_east_1_vpc_b_subnet01.id]
  service_name        = var.ssm_enpoint_2
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint_vpc_b.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-1-VPC-B-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-1
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_1_vpc_b_ec2messages_2" {
  vpc_id              = aws_vpc.us_east_1_vpc_b.id
  subnet_ids          = [aws_subnet.us_east_1_vpc_b_subnet01.id]
  service_name        = var.ssm_enpoint_3
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint_vpc_b.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-1-VPC-B-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-1
}


################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_2_vpc_c_ssm_2" {
  vpc_id              = aws_vpc.us_east_2_vpc_c.id
  subnet_ids          = [aws_subnet.us_east_2_vpc_c_subnet01.id]
  service_name        = var.us_east_2_ssm_enpoint_1
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint_vpc_c.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-2-VPC-C-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-2
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_2_vpc_c_ssm_messages_2" {
  vpc_id              = aws_vpc.us_east_2_vpc_c.id
  subnet_ids          = [aws_subnet.us_east_2_vpc_c_subnet01.id]
  service_name        = var.us_east_2_ssm_enpoint_2
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint_vpc_c.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-2-VPC-C-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-2
}

################################################
#  VPC ENDPOINT                                #
################################################
resource "aws_vpc_endpoint" "us_east_2_vpc_c_ec2messages_2" {
  vpc_id              = aws_vpc.us_east_2_vpc_c.id
  subnet_ids          = [aws_subnet.us_east_2_vpc_c_subnet01.id]
  service_name        = var.us_east_2_ssm_enpoint_3
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.ssm_endpoint_vpc_c.id]
  private_dns_enabled = true


  tags = {
    Name = "US-EAST-2-VPC-C-VPC-SSM-ENDPOINT"
  }

  provider = aws.us-east-2
}
