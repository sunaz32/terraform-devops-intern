provider "aws" {
  region = var.region
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
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_zone_name  = var.alb_zone_name
   alb_domain       = var.alb_domain
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
  subnet_ids           = module.vpc.public_subnet_ids
  alb_target_group_arn = module.alb.target_group_arn
  ecs_cluster_arn      = module.ecs.cluster_arn
  ecs_instance_type    = "t2.small"
  ecs_key_public        = var.ecs_key_public
  ami_id               = var.ecs_ami_id
  ecs_sg_id            = module.security_group.ecs_sg_id
  image_url            = var.image_url
  container_port       = 5000
  environment          = var.environment 
}