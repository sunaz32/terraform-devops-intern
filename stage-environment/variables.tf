variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "app_name" {
  description = "Application name used for naming resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}
variable "bastion_key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}

variable "bastion_instance_type" {
  description = "EC2 instance type for bastion host"
  type        = string
}

variable "bastion_ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for ECS instances"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name for ECS EC2 instances"
  type        = string
}

variable "alb_domain" {
  description = "Domain name to associate with the Application Load Balancer"
  type        = string
}

variable "image_url" {
  description = "Docker image URL for ECS deployment"
  type        = string
}
