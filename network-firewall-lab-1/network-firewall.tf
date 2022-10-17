###############################################
#  NETWORK FIREWALL                           #
###############################################
resource "aws_networkfirewall_firewall" "firewall_1" {
  name                = "firewall01"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.fw_rule01.arn
  vpc_id              = aws_vpc.this.id
  subnet_mapping {
    subnet_id = aws_subnet.firewall_subnet.id

  }
}

###############################################
#  NETWORK FIREWALL POLICY                    #
###############################################
resource "aws_networkfirewall_firewall_policy" "fw_rule01" {
  name = "rule01"

  firewall_policy {
    stateless_default_actions          = ["aws:forward_to_sfe"]
    stateless_fragment_default_actions = ["aws:forward_to_sfe"]

    stateful_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.fw_rule_group_1.arn
    }
  }
}

###############################################
#  NETWORK FIREWALL RULE GROUP                #
###############################################
resource "aws_networkfirewall_rule_group" "fw_rule_group_1" {
  capacity = 100
  name     = "rule01"
  type     = "STATEFUL"
  rule_group {
    rules_source {
      rules_source_list {
        generated_rules_type = "ALLOWLIST"
        target_types         = ["HTTP_HOST"]
        targets              = ["www.cloudacia.com", "www.github.com", "www.google.com"]
      }
    }
  }
}
