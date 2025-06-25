variable "app_name" {}
variable "ami_id" {}
variable "ecs_instance_type" {}
variable "ecs_key_public" {
  description = "Public key for EC2 access"
  type        = string
}
variable "ecs_sg_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "alb_target_group_arn" {}
variable "ecs_cluster_arn" {}
variable "image_url" {}
variable "container_port" {
  type = number
}
variable "environment" {
  type = string
}