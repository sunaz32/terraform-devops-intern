variable "vpc_id" {}
variable "env" {}
variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into bastion (e.g. your IP)"
  type        = string
}
