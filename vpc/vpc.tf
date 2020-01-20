resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_tag_name
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone.az_1
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_tag
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone.az_2

  tags = {
    Name = var.private_subnet_tag
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw_tag_name
  }
}

