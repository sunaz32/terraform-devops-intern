variable "app_name" {}
variable "image_url" {
  description = "Full image URI with tag (e.g., :sha)"
  type        = string
}
variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security group ID for ECS EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}