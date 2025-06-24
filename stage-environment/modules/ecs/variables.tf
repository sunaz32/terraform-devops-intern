variable "cluster_name" {}
variable "app_name" {}
variable "image_url" {}
variable "execution_role_arn" {}
variable "desired_count" {}
variable "ecs_sg_id" {}
variable "target_group_arn" {}
variable "private_subnets" { type = list(string) }
variable "max_capacity" {}
variable "min_capacity" {}
