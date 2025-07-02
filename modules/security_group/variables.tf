variable "vpc_id" {}
variable "env" {}
variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into ECS EC2"
  type        = string
}