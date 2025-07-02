provider "aws" {
  region = var.region
}

# 🔹 Fetch the latest ECS-optimized AMI
data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

module "vpc" {
  source              = "../modules/vpc"
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
}


module "security_group" {
  source  = "../modules/security_group"
  vpc_id  = module.vpc.vpc_id
  env   = "dev"
}

module "alb" {
  source            = "../modules/alb"
  app_name          = "naz-dev-app"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnets
   alb_sg_id         =[ module.security_group.alb_sg_id]
    environment         = var.environment
}
  
 

module "ecs" {
  source    = "../modules/ecs"
  app_name  = "naz-dev-app"
}

module "ecs_ec2" {
  source               = "../modules/ecs-ec2"
  app_name             = "naz-dev-app"
  subnet_ids = module.vpc.public_subnets
  alb_target_group_arn = module.alb.target_group_arn
  ecs_cluster_arn      = module.ecs.cluster_arn
  ecs_instance_type    = "t2.small"
  ami_id             = data.aws_ssm_parameter.ecs_ami.value
  public_subnets   = module.vpc.public_subnets
  ecs_sg_id            = module.security_group.ecs_sg_id
  image_url            = var.image_url
  container_port       = 5000
  container_memory     = 512
  environment          = var.environment
  ec2_key_name         = "naz-dev-1-key"
}


