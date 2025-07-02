variable "app_name" {}
variable "image_url" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}
variable "ec2_sg_id" {
  description = "Security group ID for ECS EC2 instances"
  type        = string
}