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

resource "aws_security_group" "http" {
  name        = "http"
  description = "Allow inbound HTTP traffic"
}

resource "aws_security_group_rule" "bad_example" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.http.id
}

resource "aws_security_group_rule" "good_example" {
    description = "HTTPS from VPC"
    type        = "ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_group_id = aws_security_group.http.id
}
