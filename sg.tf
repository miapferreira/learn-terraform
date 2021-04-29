resource "aws_vpc" "terraform" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = var.tags
}

resource "aws_security_group" "liberando_geral" {
  name        = "liberando_geral"
  description = "Allow specifics inbound traffic"
  vpc_id      = aws_vpc.terraform.id

  dynamic "ingress" {
    for_each = var.services_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [aws_vpc.terraform.cidr_block]
    }
  }

  dynamic "egress" {
    for_each = var.services_ip
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = var.tags
}