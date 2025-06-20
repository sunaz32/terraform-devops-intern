variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "image_url" {
  description = "Docker image URL for ECS task"
  type        = string
}

variable "desired_count" {
  description = "Number of desired ECS service tasks"
  type        = number
  default     = 1
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security group ID for the ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for the load balancer"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the IAM role used by ECS tasks to pull images and write logs"
  type        = string
}

variable "min_capacity" {
  description = "Minimum number of ECS service tasks for auto scaling"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of ECS service tasks for auto scaling"
  type        = number
  default     = 3
}


variable "vpc_id" {
  description = "VPC ID"
  type        = string
}