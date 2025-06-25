variable "app_name" {}
variable "ami_id" {}
variable "ecs_instance_type" {}
variable "ecs_key_name" {}
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
