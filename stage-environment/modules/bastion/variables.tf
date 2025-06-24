
variable "instance_type" {}
variable "key_name" {}
variable "public_subnet_id" {}
variable "sg_id" {}
variable "env" {}
variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
  default     = ""
}
