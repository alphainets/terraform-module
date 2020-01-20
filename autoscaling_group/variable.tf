

######## Launch Configuration ########

variable "ecs_cluster" {
  description = "ECS cluster name"
  default     = "kaios_ecs"
}

variable "sg" {}

# variable "instance_role" {}

variable "key_pair" {}

######## Autoscale Config ########

variable "subnet_public" {}

variable "subnet_private" {}

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
  default     = 2
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
  default     = 1
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
  default     = 1
}

######## launch_configuration ########
variable "config_name" {}

variable "image_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "with_public_ip" {}

### block ###
variable "volume_type" {
  default = "standard"
}

variable "volume_size" {
  default = 100
}

variable "delete_on_termination" {
  default = true 
}



