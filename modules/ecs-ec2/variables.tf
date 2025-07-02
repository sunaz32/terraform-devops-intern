variable "app_name" {}
variable "ami_id" {
  description = "The AMI ID to use for ECS EC2 instances"
  type        = string
}
variable "ecs_instance_type" {}
variable "ecs_sg_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "public_subnets" {
  type        = list(string)
  description = "List of CIDRs for public subnets"
}
variable "alb_target_group_arn" {}
variable "ecs_cluster_arn" {}
variable "image_url" {}
variable "container_port" {
  type = number
}
variable "environment" {
  type = string
}
variable "container_memory" {
  type        = number
  default     = 512
  description = "Memory (in MiB) for the container"
}
variable "ec2_key_name" {
  description = "Name of the EC2 key pair to SSH into ECS EC2 instances"
  type        = string
}
