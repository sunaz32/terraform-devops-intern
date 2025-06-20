provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  app_name       = var.app_name
  alb_domain     = var.alb_domain
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg_id      = module.security_group.alb_sg_id
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.cluster_name
  public_subnets     = module.vpc.public_subnets
  sg_id            = module.security_group.ecs_sg_id
  vpc_id             = module.vpc.vpc_id
  app_name           = var.app_name
  desired_count      = var.desired_count
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
  execution_role_arn = var.execution_role_arn  
  image_url         = var.image_url
  target_group_arn   = module.alb.target_group_arn
}
module "ecs_instance" {
  source           = "./modules/ecs_ec2"
  app_name         = var.app_name
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.public_subnets[0]
  cluster_name     = var.cluster_name     # Only if needed internally
  ecs_sg_id        = module.security_group.ecs_sg_id      # ✅ Required for instance SG
  ecs_key_public   = var.ecs_key_public
}

