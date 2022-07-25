terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
