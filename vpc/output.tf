output "vpc" {
  value = aws_vpc.vpc.id
}

output "subnet_public" {
  value = aws_subnet.subnet_public.id
}

output "subnet_private" {
  value = aws_subnet.subnet_private.id
}

output "default_route_id" {
  value = aws_vpc.vpc.default_route_table_id
}

output "vpc_igw" {
  value = aws_internet_gateway.vpc_igw.id
}
