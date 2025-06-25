provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "../modules/vpc"
  vpc_name       = "naz-dev-vpc"
  cidr_block     = "10.10.0.0/16"
  public_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnets = []
}

module "security_group" {
  source  = "../modules/security_group"
  vpc_id  = module.vpc.vpc_id
  env     = "dev"
}

module "alb" {
  source            = "../modules/alb"
  app_name          = "naz-dev-app"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_group.alb_sg_id
}

module "ecs" {
  source    = "../modules/ecs"
  app_name  = "naz-dev-app"
}

module "ecs_ec2" {
  source               = "../modules/ecs-ec2"
  app_name             = "naz-dev-app"
  subnet_ids           = module.vpc.public_subnet_ids
  alb_target_group_arn = module.alb.target_group_arn
  ecs_cluster_arn      = module.ecs.cluster_arn
  ecs_instance_type    = "t2.small"
  ecs_key_name         = var.ecs_key_name
  ami_id               = var.ecs_ami_id
  ecs_sg_id            = module.security_group.ecs_sg_id
  image_url            = var.image_url
  container_port       = 5000
}