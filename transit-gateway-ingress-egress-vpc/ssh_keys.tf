# Public Key for accessing EC2 instances
resource "aws_key_pair" "ec2_public_key" {
  key_name   = "ec2_public_key_cloudacia_1"
  public_key = var.ssh_public_key
}
