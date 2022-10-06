#################################################
# IAM PROFILE                                   #
#################################################
resource "aws_iam_instance_profile" "ec2-ssm-profile" {
  name = "ec2_profile"
  role = aws_iam_role.dev-resources-iam-role.name
}

#################################################
# IAM ROLES                                     #
#################################################
resource "aws_iam_role" "dev-resources-iam-role" {
  name               = "dev-ssm-role"
  description        = "The role for the developer resources EC2"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Principal": {"Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
      }
    }
EOF
}

#################################################
# IAM ROLE POLICY ATTACHMENT                    #
#################################################
resource "aws_iam_role_policy_attachment" "dev-resources-ssm-policy" {
  role       = aws_iam_role.dev-resources-iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
