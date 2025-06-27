variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  type = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into instances"
  type        = string
}

variable "image_url" {}


variable "alb_domain" {
  description = "Domain name for ALB"
  type        = string
}

variable "bastion_ami_id" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "EC2 instance type for bastion"
  type        = string
}

variable "ecs_instance_type" {
  description = "EC2 instance type for ECS"
  type        = string
}
