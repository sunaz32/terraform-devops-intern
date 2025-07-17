region   = "ap-south-1"
app_name = "naz-prod-intern-app"

# VPC and Subnets for Prod
vpc_cidr             = "10.20.0.0/16"
public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs = ["10.20.101.0/24", "10.20.102.0/24"]

# ALB Domain for Prod
alb_domain = "prod.naziya.visiontechguru.in"

# Bastion Host (Prod)
bastion_key_name      = "Bastion-key"
bastion_instance_type = "t2.micro"
bastion_ami_id        = ""

# ECS EC2 Configuration
instance_type             = "t2.small"
key_name                  = "naz-dev1-key"
iam_instance_profile_name = "ecsInstanceRole-prod" # ✅ Create this if not already present

# ECR / Docker Image for Prod
image_url = ""

acm_certificate_arn ="arn:aws:acm:ap-south-1:851725602228:certificate/cc215228-6410-4951-b2ba-fba97b63e07e"