###############################################
#    AWS REGION                               #
###############################################
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr_a" {
  type        = string
  default     = "10.1.0.0/16"
  description = ""
}

###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr_b" {
  type        = string
  default     = "10.2.0.0/16"
  description = ""
}

###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr_egress" {
  type        = string
  default     = "10.3.0.0/16"
  description = ""
}

###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr_ingress" {
  type        = string
  default     = "10.4.0.0/16"
  description = ""
}


###############################################
#    VPC A SUBNET #1                            #
###############################################
variable "vpc_a_subnet01" {
  type        = string
  default     = "10.1.1.0/24"
  description = "A public network"
}

###############################################
#    VPC A SUBNET #2                            #
###############################################
variable "vpc_a_subnet02" {
  type        = string
  default     = "10.1.2.0/24"
  description = "A private network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_a_availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_a_availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}


###############################################
#    VPC B SUBNET #1                            #
###############################################
variable "vpc_b_subnet01" {
  type        = string
  default     = "10.2.1.0/24"
  description = "A private network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_b_availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}


###############################################
#    VPC EGRESS SUBNET #1                     #
###############################################
variable "vpc_egress_subnet01" {
  type        = string
  default     = "10.3.1.0/24"
  description = "A public network"
}

###############################################
#    VPC EGRESS SUBNET #2                     #
###############################################
variable "vpc_egress_subnet02" {
  type        = string
  default     = "10.3.2.0/24"
  description = "A public network"
}

###############################################
#    VPC EGRESS SUBNET #3                     #
###############################################
variable "vpc_egress_subnet03" {
  type        = string
  default     = "10.3.3.0/24"
  description = "A private network"
}

###############################################
#    VPC EGRESS SUBNET #4                     #
###############################################
variable "vpc_egress_subnet04" {
  type        = string
  default     = "10.3.4.0/24"
  description = "A private network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_egress_availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_egress_availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

###############################################
#    VPC INGRESS SUBNET #1                    #
###############################################
variable "vpc_ingress_subnet01" {
  type        = string
  default     = "10.4.1.0/24"
  description = "A public network"
}

###############################################
#    VPC INGRESS SUBNET #2                    #
###############################################
variable "vpc_ingress_subnet02" {
  type        = string
  default     = "10.4.2.0/24"
  description = "A public network"
}

###############################################
#    VPC INGRESS SUBNET #3                     #
###############################################
variable "vpc_ingress_subnet03" {
  type        = string
  default     = "10.4.3.0/24"
  description = "A private network"
}

###############################################
#    VPC INGRESS SUBNET #4                     #
###############################################
variable "vpc_ingress_subnet04" {
  type        = string
  default     = "10.4.4.0/24"
  description = "A private network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_ingress_availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "vpc_ingress_availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

###############################################
#    EC2 INSTANCE TYPE                         #
###############################################
variable "ec2_type" {
  type        = string
  default     = "t2.micro"
  description = ""
}

###############################################
#    EC2 AMI                                  #
###############################################
variable "aws_ami" {
  type        = string
  default     = "ami-026b57f3c383c2eec"
  description = "Amazon Linux 2"
}

###############################################
#    S3 VPC END-POINT FOR US-EAST REGION      #
###############################################
variable "s3_endpoint" {
  type        = string
  default     = "com.amazonaws.us-east-1.s3"
  description = "S3 vpc endpoint for us-east-1 region"
}

###############################################
#    SSM END-POINT FOR US-EAST REGION         #
###############################################
variable "ssm_enpoint_1" {
  type        = string
  default     = "com.amazonaws.us-east-1.ssm"
  description = "SSM endpoint for us-east-1 region"
}

###############################################
#    SSM END-POINT FOR US-EAST REGION         #
###############################################
variable "ssm_enpoint_2" {
  type        = string
  default     = "com.amazonaws.us-east-1.ssmmessages"
  description = "SSM endpoint for us-east-1 region"
}


###############################################
#    SSM END-POINT FOR US-EAST REGION         #
###############################################
variable "ssm_enpoint_3" {
  type        = string
  default     = "com.amazonaws.us-east-1.ec2messages"
  description = "SSM endpoint for us-east-1 region"
}

###############################################
#    SSH PUBLIC KEY                           #
###############################################
variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5PcvlG+/CdPKwiGirz0nHFetCcQBv3WGHuJ8ETcOwj4e88I2PAHB+PCB6kEDVJ6gf8E3XDBPV/C1WA4BhrTM+ksj1veroakfcjbC7i2JbwInlDwXCCD48u6dapQxyFf5I0PfB7V31xtDzvwnRatmgyw7huGSskaP36PKsMoEdOCbHt1nBHpzCujb8qSfr4biQiEau7ZPra/8EF+51TdqoprBB0bx+vTVez7hIjK0qv3MgMG1AdtCn4VzpNSgCXTaszJSLi/tOa9nT9rnweZNzQ0BrpfPrHcFqodI/Ec0h5ukaCZvgfX/USj9dSYMTB+24OXdiRKKJsZ+Q2vAAlOHUU1kn2edokOxIvPrbhjo2/5Ma1VgoYUDagdGW0QPudn8Kk5VfuUA2S/cXrZZDKzzsx1VHY9eX+DAd1rDSR1yhoxVXTkYlGyXSclweqSf1WF8GnvK40gHXvLyfBM6Jqh50ASG9yNVGvI0pQG3ZNg+UcbWw8S8cLipdegLEOQuJQmU="
}

###############################################
#    EC2 INSTANCE PRIVATE IP                 #
###############################################
variable "ec2_instance_private_ip_1" {
  type        = string
  default     = "10.1.1.100"
  description = "Web01"
}

###############################################
#    EC2 INSTANCE PRIVATE IP                 #
###############################################
variable "ec2_instance_private_ip_2" {
  type        = string
  default     = "10.2.1.39"
  description = "Web02"
}
