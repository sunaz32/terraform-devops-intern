
variable "vpc_cidr" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "azs" { type = list(string) }
variable "env" {}

variable "cluster_name" {}
variable "app_name" {}
variable "image_url" {}
variable "execution_role_arn" {}
variable "desired_count" {}
variable "max_capacity" {}
variable "min_capacity" {}

variable "ecs_key_public" {}
variable "ecs_instance_type" {}

variable "bastion_instance_type" {}
variable "bastion_key_name" {}

