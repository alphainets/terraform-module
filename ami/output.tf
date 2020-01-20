output "ami_image" {
  value = data.aws_ami.ubuntu.id
}