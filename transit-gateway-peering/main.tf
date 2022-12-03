###############################################
#  TERRAFORM PROVIDER CONFIGURATION           #
###############################################
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

###############################################
#  AWS DEFAULT REGION                         #
###############################################
provider "aws" {
  region = var.aws_region_1
  alias  = "us-east-1"
}

provider "aws" {
  region = var.aws_region_2
  alias  = "us-east-2"
}
