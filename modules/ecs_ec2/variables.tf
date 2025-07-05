variable "app_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "iam_instance_profile_name" {}
variable "ec2_sg_id" {}
variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}
variable "cluster_name" {
  description = "Name of the ECS Cluster to register EC2 instances with"
  type        = string
}
variable "ecs_ami_id" {
  description = "ECS optimized AMI ID (optional override)"
  type        = string
  default     = ""
}
