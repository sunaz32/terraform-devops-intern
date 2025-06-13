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
  sg_id          = module.security_group.alb_sg
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.cluster_name
  public_subnets     = module.vpc.public_subnets
  sg_id              = module.security_group.ecs_sg
  app_name           = var.app_name
  desired_count      = var.desired_count
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
  execution_role_arn = var.execution_role_arn  
  image_url          = "<your-ecr-image-url>"
  target_group_arn   = module.alb.target_group_arn
}
