variable "region" {}
variable "ecs_key_public" {
  description = "Public key for the ECS EC2 instances"
  type        = string
}
variable "ecs_ami_id" {}
variable "image_url" {}
variable "alb_domain" {
  description = "The custom domain name for the ALB"
  type        = string
}
variable "alb_zone_name" {
  description = "Route 53 hosted zone name (e.g. visiontechguru.in)"
  type        = string
}
variable "environment" {
  type = string
}
variable "container_port" {
  type = number
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}