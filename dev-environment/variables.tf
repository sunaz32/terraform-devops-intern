variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "alb_domain" {
  description = "Domain name for the ALB"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for ECS hosts"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}



variable "image_url" {
  description = "Full image URI with tag (e.g., :sha)"
  type        = string
}
variable "app_port" {
  description = "Port on which the application listens"
  type        = number
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to attach to EC2 instances"
  type        = string
}
variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS listener"
  type        = string
}

#rule added