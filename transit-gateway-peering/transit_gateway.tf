################################################
#  TRANSIT GATEWAY                             #
################################################
resource "aws_ec2_transit_gateway" "us-east-1-tsg01" {
  description = "Transit Gateway US-EAST-1"

  provider = aws.us-east-1
}


################################################
#  TRANSIT GATEWAY                             #
################################################
resource "aws_ec2_transit_gateway" "us-east-2-tsg02" {
  description = "Transit Gateway US-EAST-2"

  provider = aws.us-east-2
}


################################################
#  TRANSIT GATEWAY ATTACHMENT #1               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "us-east-1-tsg01-attachment-01" {
  subnet_ids                                      = [aws_subnet.us_east_1_vpc_a_subnet01.id, aws_subnet.us_east_1_vpc_a_subnet02.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.us-east-1-tsg01.id
  vpc_id                                          = aws_vpc.us_east_1_vpc_a.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "US-EAST-1-VPC-A"
  }

  provider = aws.us-east-1
}

################################################
#  TRANSIT GATEWAY ATTACHMENT #2               #
################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "us-east-1-tsg01-attachment-02" {
  subnet_ids                                      = [aws_subnet.us_east_1_vpc_b_subnet01.id, aws_subnet.us_east_1_vpc_b_subnet02.id]
  transit_gateway_id                              = aws_ec2_transit_gateway.us-east-1-tsg01.id
  vpc_id                                          = aws_vpc.us_east_1_vpc_b.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "US-EAST-1-VPC-B"
  }

  provider = aws.us-east-1
}


################################################
#  TRANSIT GATEWAY ROUTE TABLE #1              #
################################################
resource "aws_ec2_transit_gateway_route_table" "us-east-1-tsg-route-table-1" {
  transit_gateway_id = aws_ec2_transit_gateway.us-east-1-tsg01.id

  provider = aws.us-east-1
}


################################################
#  TRANSIT GATEWAY ROUTE TABLE ASOC #1         #
################################################
resource "aws_ec2_transit_gateway_route_table_association" "us-east-1-tsg-route-table-1-asoc-1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.us-east-1-tsg01-attachment-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-1-tsg-route-table-1.id

  provider = aws.us-east-1
}

################################################
#  TRANSIT GATEWAY ROUTE TABLE ASOC #2         #
################################################
resource "aws_ec2_transit_gateway_route_table_association" "us-east-1-tsg-route-table-1-asoc-2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.us-east-1-tsg01-attachment-02.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-1-tsg-route-table-1.id

  provider = aws.us-east-1
}


################################################
#  TRANSIT GATEWAY ROUTE TABLE PROPAGATION #1  #
################################################
resource "aws_ec2_transit_gateway_route_table_propagation" "us-east-1-tsg-route-table-1-propa-1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.us-east-1-tsg01-attachment-01.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-1-tsg-route-table-1.id

  provider = aws.us-east-1
}

################################################
#  TRANSIT GATEWAY ROUTE TABLE PROPAGATION #2  #
################################################
resource "aws_ec2_transit_gateway_route_table_propagation" "us-east-1-tsg-route-table-1-propa-2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.us-east-1-tsg01-attachment-02.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.us-east-1-tsg-route-table-1.id

  provider = aws.us-east-1
}
