resource "aws_security_group" "bgl_sg" {
  name        = var.sg_tag_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = [
      for rule in var.ingress_rules : {
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = rule.cidr_blocks
      }
    ]
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = [
      for rule in var.egress_rules : {
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = rule.cidr_blocks
      }
    ]
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  vpc_id = var.vpc_id

  tags = {
    Name = var.sg_tag_name
  }
}
