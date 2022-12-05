################################################
#  VPC ENDPOINT SECURITY GROUP                 #
################################################
resource "aws_security_group" "ssm_endpoint" {
  name        = "ssm_endpoint"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.us_east_1_vpc_a.id


  # http port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSM"
  }
}

################################################
#  VPC ENDPOINT SECURITY GROUP                 #
################################################
resource "aws_security_group" "ssm_endpoint_vpc_b" {
  name        = "ssm_endpoint"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.us_east_1_vpc_b.id


  # http port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSM"
  }
}

################################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "us-east-1-vpc-a" {
  name        = "US-EAST-1-VPC-A-INSTANCE-1"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.us_east_1_vpc_a.id

  # https port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "US-EAST-1-VPC-A-INSTANCE-1"
  }
}

################################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "us-east-1-vpc-b" {
  name        = "US-EAST-1-VPC-B-INSTANCE-1"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.us_east_1_vpc_b.id

  # https port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "US-EAST-1-VPC-B-INSTANCE-1"
  }
}

################################################
#  VPC ENDPOINT SECURITY GROUP                 #
################################################
resource "aws_security_group" "ssm_endpoint_vpc_c" {
  name        = "ssm_endpoint"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.us_east_2_vpc_c.id


  # http port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSM"
  }
  provider = aws.us-east-2
}


################################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "us-east-2-vpc-c" {
  name        = "US-EAST-2-VPC-C-INSTANCE-1"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.us_east_2_vpc_c.id

  # https port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "US-EAST-2-VPC-C-INSTANCE-1"
  }

  provider = aws.us-east-2
}
