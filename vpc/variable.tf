
########## VPC Config ########
variable "vpc_tag_name" {}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
}

variable "enable_dns_hostnames" {
  default = true
}

########## VPC Subnet ########
variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
}

variable "public_subnet_tag" {}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
}

variable "private_subnet_tag" {}

variable "availability_zone" {
  default = {
    az_1 = ""
    az_2 = ""
    az_3 = ""
    az_4 = ""
  }
}

########## VPC Internet Gateway ########
variable "igw_tag_name" {}

