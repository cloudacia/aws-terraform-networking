################################################
#  TRANSIT GATEWAY                             #
################################################
resource "aws_ec2_transit_gateway" "us-east-2-tsg02" {
  description = "Transit Gateway US-EAST-2"

  default_route_table_association = "disable"

  provider = aws.us-east-2
}

################################################
#  TRANSIT GATEWAY PERRING ATTACHMENT #1       #
################################################
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "tsg-peering-01" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tsg-peering-01.id


  tags = {
    Name = "cross-account attachment"
  }
  provider = aws.us-east-2
}


################################################
#  TRANSIT GATEWAY ATTACHMENT #1               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "us-east-2-tsg01-attachment-01" {
  subnet_ids                                      = [aws_subnet.us_east_2_vpc_c_subnet01.id, aws_subnet.us_east_2_vpc_c_subnet02.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.us-east-2-tsg02.id
  vpc_id                                          = aws_vpc.us_east_2_vpc_c.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "US-EAST-2-VPC-C"
  }

  provider = aws.us-east-2
}

################################################
#  TRANSIT GATEWAY ROUTE TABLE #1              #
################################################
resource "aws_ec2_transit_gateway_route_table" "us-east-2-tsg-route-table-1" {
  transit_gateway_id = aws_ec2_transit_gateway.us-east-2-tsg02.id

  provider = aws.us-east-2
}


################################################
#  TRANSIT GATEWAY ROUTE TABLE ASOC #1         #
################################################
resource "aws_ec2_transit_gateway_route_table_association" "us-east-2-tsg-route-table-1-asoc-1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.us-east-2-tsg01-attachment-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-2-tsg-route-table-1.id

  provider = aws.us-east-2
}


################################################
#  TRANSIT GATEWAY ROUTE TABLE ASOC #2         #
################################################
resource "aws_ec2_transit_gateway_route_table_association" "us-east-2-tsg-route-table-1-asoc-2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.tsg-peering-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-2-tsg-route-table-1.id
  depends_on                     = [aws_ec2_transit_gateway_peering_attachment_accepter.tsg-peering-01]

  provider = aws.us-east-2
}

################################################
#  TRANSIT GATEWAY ROUTE TABLE PROPAGATION #1  #
################################################
resource "aws_ec2_transit_gateway_route_table_propagation" "us-east-2-tsg-route-table-1-propa-1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.us-east-2-tsg01-attachment-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-2-tsg-route-table-1.id

  provider = aws.us-east-2
}


################################################
#  TRANSIT GATEWAY STATIC ROUTE 1              #
################################################
resource "aws_ec2_transit_gateway_route" "us-east-2-tsg-route-1" {
  destination_cidr_block         = "10.1.1.0/24"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.tsg-peering-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-2-tsg-route-table-1.id

  provider = aws.us-east-2
}

################################################
#  TRANSIT GATEWAY STATIC ROUTE 2              #
################################################
resource "aws_ec2_transit_gateway_route" "us-east-2-tsg-route-2" {
  destination_cidr_block         = "10.2.1.0/24"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.tsg-peering-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-2-tsg-route-table-1.id

  provider = aws.us-east-2
}
