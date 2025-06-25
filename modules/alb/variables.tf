variable "app_name" {}
variable "vpc_id" {}
variable "alb_sg_id" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}
variable "alb_domain" {
  description = "The custom domain to map to ALB"
  type        = string
}

variable "alb_zone_name" {
  description = "Route 53 hosted zone name (e.g. visiontechguru.in)"
  type        = string
}
variable "environment" {
  type = string
}