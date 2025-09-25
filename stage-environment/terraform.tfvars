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
bastion_instance_type = "t3.micro"
bastion_ami_id        = "" # ✅ Replace if using a custom AMI

# ECS EC2 Configuration
instance_type             = "t3.micro"
key_name                  = "project-key"
iam_instance_profile_name = "ecsInstanceRole-stage"

# ECR / Docker Image for Stage
image_url = ""
acm_certificate_arn = "arn:aws:acm:ap-south-1:289753176216:certificate/551a8046-52d0-44c3-96ed-6467613715a7"
