terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

# Latest ECS-Optimized AMI
data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

# Generate ECS SSH key pair
resource "tls_private_key" "ecs" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ecs_key" {
  key_name   = "stage-ecs-key"
  public_key = tls_private_key.ecs.public_key_openssh
}

resource "local_file" "ecs_private_key" {
  filename        = "${path.module}/stage-ecs-key.pem"
  content         = tls_private_key.ecs.private_key_pem
  file_permission = "0400"
}

# Generate Bastion SSH key pair
resource "tls_private_key" "bastion" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "stage-bastion-key"
  public_key = tls_private_key.bastion.public_key_openssh
}

resource "local_file" "bastion_private_key" {
  filename        = "${path.module}/stage-bastion-key.pem"
  content         = tls_private_key.bastion.private_key_pem
  file_permission = "0400"
}

# VPC
module "vpc" {
  source                = "../modules/vpc"
   environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
}

# Security Groups
module "security_group" {
  source = "../modules/security_group"
  vpc_id  = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  env   = "stage"
}


# ALB in public subnet
module "alb" {
  source         = "../modules/alb"
   app_name          = "naz-stage-app"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnets
  alb_sg_id         =[ module.security_group.alb_sg_id]
  environment         = var.environment
}

# Bastion in public subnet
module "bastion" {
  source            = "../modules/bastion"
  subnet_id         = module.vpc.public_subnet_ids[0]
  bastion_sg_id     = module.security_group.bastion_sg_id
  key_name          = aws_key_pair.bastion_key.key_name
  ami_id            = var.bastion_ami_id
  instance_type     = var.bastion_instance_type
  app_name          = var.app_name                # ✅ Required by the module
}
# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.app_name}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
} 

module "ecs" {
  source    = "../modules/ecs"
  app_name  = "naz-stage-app"
}

# ECS EC2 service in private subnets
module "ecs_ec2" {
  source               = "../modules/ecs-ec2"
  app_name             = "naz-dev-app"
  subnet_ids = module.vpc.private_subnets
  alb_target_group_arn = module.alb.target_group_arn
  ecs_cluster_arn      = module.ecs.cluster_arn
  ecs_instance_type    = "t2.small"
  ami_id               = data.aws_ssm_parameter.ecs_ami.value
  public_subnets       = module.vpc.public_subnets
  ecs_sg_id            = module.security_group.ecs_sg_id
  image_url            = var.image_url
  container_port       = 5000
  container_memory     = 512
  environment          = var.environment
}