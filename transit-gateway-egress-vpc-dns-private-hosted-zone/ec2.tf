#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web01" {
  connection {
    type = "ssh"
    user = "ec2-user"
  }
  ami                    = var.aws_ami
  instance_type          = var.ec2_type
  subnet_id              = aws_subnet.vpc_a_subnet01.id
  user_data              = filebase64("scripts/bootstrap.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2-ssm-profile.name
  vpc_security_group_ids = [aws_security_group.web01.id]
  depends_on             = [aws_vpc_endpoint.vpc_a_s3_endpoint, aws_vpc_endpoint.ssm]
  private_ip             = "10.1.1.10"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "Web01"
  }
}

#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web02" {
  connection {
    type = "ssh"
    user = "ec2-user"
  }
  ami                    = var.aws_ami
  instance_type          = var.ec2_type
  subnet_id              = aws_subnet.vpc_b_subnet01.id
  user_data              = filebase64("scripts/bootstrap.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2-ssm-profile.name
  vpc_security_group_ids = [aws_security_group.web02.id]
  depends_on             = [aws_vpc_endpoint.vpc_a_s3_endpoint, aws_vpc_endpoint.ssm]
  private_ip             = "10.2.1.10"


  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "Web02"
  }
}

#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web03" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
  }
  ami                         = var.aws_ami
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.vpc_egress_subnet01.id
  user_data                   = filebase64("scripts/bootstrap.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2-ssm-profile.name
  vpc_security_group_ids      = [aws_security_group.web03.id]
  key_name                    = aws_key_pair.ec2_public_key.key_name
  associate_public_ip_address = true
  private_ip                  = "10.3.1.10"


  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "Web03"
  }
}