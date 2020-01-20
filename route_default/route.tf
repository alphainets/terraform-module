resource "aws_default_route_table" "default_route" {
  default_route_table_id = var.default_route_table_id

  dynamic "route" {
    for_each = [
      for item in var.routes : {
        cidr_block = item.cidr_block
        gateway_id = item.gateway_id
      }
    ]

    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = {
    Name = var.default_route_tag
  }
}

resource "aws_route_table_association" "subnet-public" {
  subnet_id      = var.subnet_public
  route_table_id = var.default_route_table_id
}

resource "aws_route_table_association" "subnet-private" {
  subnet_id      = var.subnet_private
  route_table_id = var.default_route_table_id
}