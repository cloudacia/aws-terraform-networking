resource "aws_route53_zone" "phz_vpc_a" {
  name = "vpc-a.cloudacia.local"

  vpc {
    vpc_id = aws_vpc.vpc_a.id
  }

  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone" "phz_vpc_b" {
  name = "vpc-b.cloudacia.local"

  vpc {
    vpc_id = aws_vpc.vpc_b.id
  }

  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone" "phz_vpc_egress" {
  name = "vpc-egress.cloudacia.local"

  vpc {
    vpc_id = aws_vpc.vpc_egress.id
  }

  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone_association" "phz_as_vpc_a" {
  zone_id = aws_route53_zone.phz_vpc_a.id
  vpc_id  = aws_vpc.vpc_egress.id
}

resource "aws_route53_zone_association" "phz_as_vpc_b" {
  zone_id = aws_route53_zone.phz_vpc_b.id
  vpc_id  = aws_vpc.vpc_egress.id
}

resource "aws_route53_record" "web1_dns_record" {
  zone_id = aws_route53_zone.phz_vpc_a.id
  name    = "web1.vpc-a.cloudacia.local"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.web01.private_ip]
}

resource "aws_route53_record" "web2_dns_record" {
  zone_id = aws_route53_zone.phz_vpc_b.id
  name    = "web2.vpc-b.cloudacia.local"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.web02.private_ip]
}

resource "aws_route53_record" "web3_dns_record" {
  zone_id = aws_route53_zone.phz_vpc_egress.id
  name    = "web3.vpc-egress.cloudacia.local"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.web03.private_ip]
}

resource "aws_route53_resolver_endpoint" "vpc_egress_inbound" {
  name      = "inbound resolver"
  direction = "INBOUND"

  security_group_ids = [
    aws_security_group.vpc_egress_inbound_resolver.id,
  ]

  ip_address {
    subnet_id = aws_subnet.vpc_egress_subnet01.id
    ip        = "10.3.1.254"
  }

  ip_address {
    subnet_id = aws_subnet.vpc_egress_subnet02.id
    ip        = "10.3.2.254"
  }

  tags = {
    Environment = "Cloudacia"
  }
}


resource "aws_route53_resolver_endpoint" "vpc_egress_outbound" {
  name      = "outbound resolver"
  direction = "OUTBOUND"

  security_group_ids = [
    aws_security_group.vpc_egress_inbound_resolver.id,
  ]

  ip_address {
    subnet_id = aws_subnet.vpc_egress_subnet01.id
    ip        = "10.3.1.6"
  }

  ip_address {
    subnet_id = aws_subnet.vpc_egress_subnet02.id
    ip        = "10.3.2.6"
  }

  tags = {
    Environment = "Cloudacia"
  }
}

resource "aws_route53_resolver_rule" "vpc_egress_rule_1" {
  name                 = "vpc-a"
  domain_name          = "vpc-a.cloudacia.local"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.vpc_egress_outbound.id

  target_ip {
    ip = "10.3.1.254"
  }

  tags = {
    Environment = "cloudacia"
  }
}

resource "aws_route53_resolver_rule" "vpc_egress_rule_2" {
  domain_name          = "vpc-b.cloudacia.local"
  name                 = "vpc-b"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.vpc_egress_outbound.id

  target_ip {
    ip = "10.3.1.254"
  }

  tags = {
    Environment = "cloudacia"
  }
}

resource "aws_route53_resolver_rule_association" "vpc_egress_rule_1_as_1" {
  resolver_rule_id = aws_route53_resolver_rule.vpc_egress_rule_1.id
  vpc_id           = aws_vpc.vpc_b.id
}

resource "aws_route53_resolver_rule_association" "vpc_egress_rule_1_as_2" {
  resolver_rule_id = aws_route53_resolver_rule.vpc_egress_rule_2.id
  vpc_id           = aws_vpc.vpc_a.id
}
