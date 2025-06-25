variable "region" {}
variable "ecs_key_name" {}
variable "ecs_ami_id" {}
variable "image_url" {}
variable "alb_domain" {
  description = "The custom domain name for the ALB"
  type        = string
}
variable "alb_zone_name" {
  description = "Route 53 hosted zone name (e.g. visiontechguru.in)"
  type        = string
}