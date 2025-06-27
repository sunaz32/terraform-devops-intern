variable "app_name" {}
variable "vpc_id" {}
variable "alb_sg_id" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "environment" {
  type = string
}