variable "app_name" {}
variable "vpc_id" {}
variable "alb_sg_id" {}
variable "public_subnet_ids" {
  type = list(string)
}