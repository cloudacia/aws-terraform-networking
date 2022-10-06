resource "aws_vpc_peering_connection" "peering_vpc_a_to_vpc_b" {
  peer_vpc_id = aws_vpc.vpc_a.id
  vpc_id      = aws_vpc.vpc_b.id
  auto_accept = true

  tags = {
    Name = "VPC Peering between vpc_a and vpc_b"
  }
}
