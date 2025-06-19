variable "app_name" {
  description = "App name used for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ECS instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID (public) for ECS instance"
  type        = string
}

variable "cluster_name" {
  description = "ECS cluster name to join"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB security group ID to allow ALB → ECS traffic"
  type        = string
}
