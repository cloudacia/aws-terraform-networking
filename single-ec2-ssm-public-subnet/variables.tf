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
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = ""
}

###############################################
#    VPC SUBNET #1                            #
###############################################
variable "subnet01" {
  type        = string
  default     = "10.0.1.0/24"
  description = "A public network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone01" {
  type        = string
  default     = "us-east-1a"
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
#    SSH PUBLIC KEY                           #
###############################################
variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5PcvlG+/CdPKwiGirz0nHFetCcQBv3WGHuJ8ETcOwj4e88I2PAHB+PCB6kEDVJ6gf8E3XDBPV/C1WA4BhrTM+ksj1veroakfcjbC7i2JbwInlDwXCCD48u6dapQxyFf5I0PfB7V31xtDzvwnRatmgyw7huGSskaP36PKsMoEdOCbHt1nBHpzCujb8qSfr4biQiEau7ZPra/8EF+51TdqoprBB0bx+vTVez7hIjK0qv3MgMG1AdtCn4VzpNSgCXTaszJSLi/tOa9nT9rnweZNzQ0BrpfPrHcFqodI/Ec0h5ukaCZvgfX/USj9dSYMTB+24OXdiRKKJsZ+Q2vAAlOHUU1kn2edokOxIvPrbhjo2/5Ma1VgoYUDagdGW0QPudn8Kk5VfuUA2S/cXrZZDKzzsx1VHY9eX+DAd1rDSR1yhoxVXTkYlGyXSclweqSf1WF8GnvK40gHXvLyfBM6Jqh50ASG9yNVGvI0pQG3ZNg+UcbWw8S8cLipdegLEOQuJQmU="
}
