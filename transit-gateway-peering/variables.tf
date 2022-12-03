###############################################
#    AWS REGION                               #
###############################################
variable "aws_region_1" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

variable "aws_region_2" {
  type        = string
  default     = "us-east-2"
  description = "US East (Ohio)"
}

variable "vpc_cidr_a" {
  type        = string
  default     = "10.1.0.0/16"
  description = ""
}

variable "vpc_cidr_b" {
  type        = string
  default     = "10.2.0.0/16"
  description = ""
}

variable "us_east_1_vpc_a_subnet01" {
  type        = string
  default     = "10.1.1.0/24"
  description = "US-EAST-1-VPC-A-SUBNET-1"
}

variable "us_east_1_vpc_a_subnet02" {
  type        = string
  default     = "10.1.2.0/24"
  description = "US-EAST-1-VPC-A-SUBNET-2"
}

variable "us_east_1_vpc_b_subnet01" {
  type        = string
  default     = "10.2.1.0/24"
  description = "US-EAST-1-VPC-B-SUBNET-1"
}

variable "us_east_1_vpc_b_subnet02" {
  type        = string
  default     = "10.2.2.0/24"
  description = "US-EAST-1-VPC-B-SUBNET-2"
}

variable "us_east_1_vpc_a_availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

variable "us_east_1_vpc_a_availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

variable "us_east_1_vpc_b_availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

variable "us_east_1_vpc_b_availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
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
#    EC2 INSTANCE PRIVATE IP                 #
###############################################
variable "us_east_1_vpc_a_ec2_instance_private_ip_1" {
  type        = string
  default     = "10.1.1.10"
  description = "US-EAST-1-VPC-A-SUBNET-01"
}

###############################################
#    EC2 INSTANCE PRIVATE IP                 #
###############################################
variable "us_east_1_vpc_a_ec2_instance_private_ip_2" {
  type        = string
  default     = "10.1.2.10"
  description = "US-EAST-1-VPC-A-SUBNET-02"
}
