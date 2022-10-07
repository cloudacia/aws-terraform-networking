################################################
#  TRANSIT GATEWAY                             #
################################################
resource "aws_ec2_transit_gateway" "tg01" {
  description = "Transit Gateway #1"
}

################################################
#  TRANSIT GATEWAY ATTACHMENT #1               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "tg01_attachment_01" {
  subnet_ids         = [aws_subnet.vpc_a_subnet01.id, aws_subnet.vpc_a_subnet02.id]
  transit_gateway_id = aws_ec2_transit_gateway.tg01.id
  vpc_id             = aws_vpc.vpc_a.id

  tags = {
    Name = "vpc_a"
  }
}

################################################
#  TRANSIT GATEWAY ATTACHMENT #2               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "tg01_attachment_02" {
  subnet_ids         = [aws_subnet.vpc_b_subnet01.id]
  transit_gateway_id = aws_ec2_transit_gateway.tg01.id
  vpc_id             = aws_vpc.vpc_b.id

  tags = {
    Name = "vpc_b"
  }
}
