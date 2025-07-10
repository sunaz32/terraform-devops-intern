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

variable "iam_role_name" {
  description = "IAM role name to use for ECS EC2 instances"
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

