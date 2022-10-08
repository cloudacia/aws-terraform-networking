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
  subnet_ids         = [aws_subnet.vpc_a_subnet01.id]
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

################################################
#  TRANSIT GATEWAY ATTACHMENT #3               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "tg01_attachment_03" {
  subnet_ids         = [aws_subnet.vpc_egress_subnet03.id, aws_subnet.vpc_egress_subnet04.id]
  transit_gateway_id = aws_ec2_transit_gateway.tg01.id
  vpc_id             = aws_vpc.vpc_egress.id

  tags = {
    Name = "vpc_egress"
  }
}

################################################
#  TRANSIT GATEWAY ATTACHMENT #4               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "tg01_attachment_04" {
  subnet_ids         = [aws_subnet.vpc_ingress_subnet03.id, aws_subnet.vpc_ingress_subnet04.id]
  transit_gateway_id = aws_ec2_transit_gateway.tg01.id
  vpc_id             = aws_vpc.vpc_ingress.id

  tags = {
    Name = "vpc_ingress"
  }
}

################################################
#  TRANSIT GATEWAY ROUTE #1                    #
################################################
resource "aws_ec2_transit_gateway_route" "default_route" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tg01_attachment_03.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tg01.association_default_route_table_id
}
