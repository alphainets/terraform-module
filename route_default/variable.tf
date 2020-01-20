variable "routes" {
  default = [
    {
      cidr_block = ""
      gateway_id = ""
    }
  ]
}

variable "subnet_public" {}

variable "subnet_private" {}

variable "default_route_table_id" {}

variable "default_route_tag" {}
