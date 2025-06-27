variable "app_name" {
  description = "Application name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "instance_type" {
  description = "Instance type for bastion"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID for bastion"
  type        = string
}

variable "key_name" {
  description = "Key pair name for bastion"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security group ID for bastion"
  type        = string
}
