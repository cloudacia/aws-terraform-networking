#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web01" {
  connection {
    type = "ssh"
    user = "ec2-user"
  }
  ami                         = var.aws_ami
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.subnet01.id
  user_data                   = filebase64("scripts/bootstrap.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2-ssm-profile.name
  vpc_security_group_ids      = [aws_security_group.web01.id]
  associate_public_ip_address = true

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
