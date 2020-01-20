resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = var.config_name
    image_id                    = var.image_id
    instance_type               = var.instance_type

    root_block_device {
      volume_type = var.volume_type
      volume_size = var.volume_size
      delete_on_termination = var.delete_on_termination
    }

    lifecycle {
      create_before_destroy = true
    }

    security_groups             = [var.sg]
    associate_public_ip_address = var.with_public_ip
    key_name                    = var.key_pair
}