#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "us-east-1-vpc-a-instance-1" {
  connection {
    type = "ssh"
    user = "ec2-user"
  }
  ami                    = var.aws_ami
  instance_type          = var.ec2_type
  subnet_id              = aws_subnet.us_east_1_vpc_a_subnet01.id
  user_data              = filebase64("scripts/bootstrap.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2-ssm-profile.name
  vpc_security_group_ids = [aws_security_group.us-east-1-vpc-a.id]
  private_ip             = var.us_east_1_vpc_a_ec2_instance_private_ip_1
  depends_on             = [aws_vpc_endpoint.us_east_1_vpc_a_s3_endpoint_1, aws_vpc_endpoint.us_east_1_ssm_1]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "US-EAST-1-VPC-A-INSTANCE-1"
  }
}

#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "us-east-1-vpc-b-instance-1" {
  connection {
    type = "ssh"
    user = "ec2-user"
  }
  ami                    = var.aws_ami
  instance_type          = var.ec2_type
  subnet_id              = aws_subnet.us_east_1_vpc_a_subnet02.id
  user_data              = filebase64("scripts/bootstrap.sh")
  iam_instance_profile   = aws_iam_instance_profile.ec2-ssm-profile.name
  vpc_security_group_ids = [aws_security_group.us-east-1-vpc-a.id]
  private_ip             = var.us_east_1_vpc_a_ec2_instance_private_ip_2
  depends_on             = [aws_vpc_endpoint.us_east_1_vpc_b_s3_endpoint_1, aws_vpc_endpoint.us_east_1_ssm_1]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "US-EAST-1-VPC-A-INSTANCE-2"
  }
}
