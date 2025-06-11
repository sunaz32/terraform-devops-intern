variable "cluster_name" {}
variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}
variable "sg_id" {}
variable "app_name" {}
variable "desired_count" {}
variable "min_capacity" {}
variable "max_capacity" {}
variable "execution_role_arn" {}
variable "image_url" {}
variable "target_group_arn" {}