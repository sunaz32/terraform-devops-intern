variable "app_name" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "alb_sg_id" {}
variable "alb_domain" {
  description = "The domain name to associate with the ALB"
  type        = string
}