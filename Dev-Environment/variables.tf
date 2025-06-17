variable "region" {
  description = "AWS region"
}

variable "app_name" {
  description = "Application name"
}

variable "cluster_name" {
  description = "ECS cluster name"
}

variable "alb_domain" {
  description = "Domain or hostname for the ALB"
}

variable "desired_count" {
  description = "Initial ECS service desired count"
}

variable "min_capacity" {
  description = "Minimum number of ECS tasks"
}

variable "max_capacity" {
  description = "Maximum number of ECS tasks"
}

variable "execution_role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}
variable "image_url" {
  description = "Docker image URL to deploy"
  type        = string
}
