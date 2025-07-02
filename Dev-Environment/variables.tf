variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
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

variable "iam_instance_profile_name" {
  description = "IAM instance profile name attached to ECS EC2 instances"
  type        = string
}

variable "image_url" {
  description = "The image URL of the container to deploy"
  type        = string

}
variable "app_port" {
  description = "Port on which the application listens"
  type        = number
}
variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

