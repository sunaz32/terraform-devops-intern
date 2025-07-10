region                  = "ap-south-1"
app_name                = "naz-stage-intern-app"

# VPC and Subnets for Stage
vpc_cidr                = "10.10.0.0/16"
public_subnet_cidrs     = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs    = ["10.10.101.0/24", "10.10.102.0/24"]

# ALB Domain for Stage
alb_domain              = "stage.naziya.visiontechguru.in"

# Bastion Host (Stage)
bastion_key_name        = "Bastion-key"
bastion_instance_type   = "t2.micro"
bastion_ami_id          = ""  # ✅ Replace if using a custom AMI

# ECS EC2 Configuration
instance_type           = "t3.micro"
key_name                = "naz-dev1-key"
iam_instance_profile_name = "ecsInstanceRole"

# ECR / Docker Image for Stage
image_url               = ""
