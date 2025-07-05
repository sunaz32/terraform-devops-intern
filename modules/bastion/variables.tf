variable "app_name" {
  description = "Name of the application for tagging"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the bastion host"
  type        = string
}

variable "bastion_key_name" {
  description = "Key pair name to use for Bastion host SSH access"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the bastion will be launched"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID where the bastion instance will be deployed"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security group ID for the bastion instance"
  type        = string
}
