################################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "web01" {
  name        = "web01"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.vpc_a.id

  # SSH port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
    Name = "Web01"
  }
}

###############################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "web02" {
  name        = "web02"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.vpc_b.id

  # SSH port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
    Name = "Web02"
  }
}

###############################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "web03" {
  name        = "web03"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.vpc_egress.id

  # SSH port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 22
    to_port     = 22
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
    Name = "Web03"
  }
}

################################################
#  VPC ENDPOINT SECURITY GROUP                 #
################################################
resource "aws_security_group" "ssm_endpoint" {
  name        = "ssm_endpoint"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.vpc_a.id


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
resource "aws_security_group" "vpc_b_ssm_endpoint" {
  name        = "ssm_endpoint"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.vpc_b.id


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
