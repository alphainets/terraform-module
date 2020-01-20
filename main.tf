module "vpc" {
  source               = "./vpc"
  enable_dns_hostnames = true
  vpc_cidr             = "10.0.0.0/16"
  vpc_tag_name         = "bgl"

  public_subnet_cidr = "10.0.100.0/24"
  public_subnet_tag  = "bgl_public"
  availability_zone = {
    az_1 = "eu-west-1a"
    az_2 = "eu-west-1b"
  }
  private_subnet_cidr = "10.0.10.0/24"
  private_subnet_tag  = "bgl_private"

  igw_tag_name      = "bgl_igw"
}

module "default_route" {
  source                 = "./route_default"
  default_route_table_id = module.vpc.default_route_id
  default_route_tag      = "kaios_default_route"
  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.vpc.vpc_igw
    }
  ]
  subnet_public          = module.vpc.subnet_public
  subnet_private         = module.vpc.subnet_private
}

module "security_group" {
  source         = "./security_group"
  sg_tag_name    = "normal"
  sg_description = "bgl security group"
  vpc_id         = module.vpc.vpc
  ingress_rules = [
    {
      from_port : 22
      to_port : 22
      protocol : "tcp"
      cidr_blocks : ["0.0.0.0/0"]
    },
    {
      from_port : 80
      to_port : 80
      protocol : "tcp"
      cidr_blocks : ["0.0.0.0/0"]
    },
    {
      from_port : 443
      to_port : 443
      protocol : "tcp"
      cidr_blocks : ["0.0.0.0/0"]
    }
  ]
}

module "key_pair" {
  source     = "./key_pair"
  public_key = "{key}"
}

module "ami" {
    source = "./ami"
}

module "autoscaling_group" {
  source            = "./autoscaling_group"
  sg                = module.security_group.bgl_sg.id
  key_pair          = module.key_pair.key
  subnet_public     = module.vpc.subnet_public
  subnet_private    = module.vpc.subnet_private
  config_name       = "ecs-launch-configuration"
  image_id          = module.ami.ami_image
  instance_type     = "t2.micro"
  with_public_ip    = "true"
  max_instance_size = 2
  min_instance_size = 1
  desired_capacity  = 1
}
