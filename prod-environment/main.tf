provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source               = "../modules/vpc"
  app_name             = var.app_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security_group" {
  source   = "../modules/security_group"
  app_name = var.app_name
  vpc_id   = module.vpc.vpc_id
}

module "bastion" {
  source           = "../modules/bastion"
  app_name         = var.app_name
  instance_type    = var.bastion_instance_type
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  bastion_sg_id    = module.security_group.bastion_sg_id
  bastion_key_name = var.bastion_key_name
}

module "alb" {
  source            = "../modules/alb"
  app_name          = var.app_name
  vpc_id            = module.vpc.vpc_id
  alb_sg_id         = module.security_group.alb_sg_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_domain        = var.alb_domain
}

module "ecs_ec2" {
  source             = "../modules/ecs_ec2"
  app_name           = var.app_name
  instance_type      = var.instance_type
  iam_instance_profile_name= var.iam_instance_profile_name
  key_name           = var.key_name
  ec2_sg_id          = module.security_group.ec2_sg_id
  public_subnet_ids  = [] # Not using public subnets
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_name       = "${var.app_name}-cluster"
}

module "ecr" {
  source        = "../modules/ecr"
  ecr_repo_name = var.app_name
}

module "ecs" {
  source               = "../modules/ecs"
  app_name             = var.app_name
  image_url            = var.image_url
  alb_target_group_arn = module.alb.target_group_arn
  public_subnet_ids    = [] # Not used
  private_subnet_ids   = module.vpc.private_subnet_ids
  ec2_sg_id            = module.security_group.ec2_sg_id
}
