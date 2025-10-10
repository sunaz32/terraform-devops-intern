region   = "ap-south-1"
app_name = "naz-stage-intern-app"

# VPC and Subnets for Stage
vpc_cidr             = "10.10.0.0/16"
public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs = ["10.10.101.0/24", "10.10.102.0/24"]

# ALB Domain for Stage
alb_domain = "stage.naziya.learn.cloudshastrainfotech.com"

# Bastion Host (Stage)t2.small
bastion_key_name      = "Bastion-key"
bastion_instance_type = "t2.micro"
bastion_ami_id        = "" 

# ECS EC2 Configuration
instance_type             = "t3.micro"
key_name                  = "project-key"
iam_instance_profile_name = "ecsInstanceRole-stage"

# ECR / Docker Image for Stage
image_url = ""

acm_certificate_arn ="arn:aws:acm:ap-south-1:582176670119:certificate/d105dff3-bf20-4ce4-ba7a-8b1c3774cea6"

