module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  env                  = var.env
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  env    = var.env
}

module "alb" {
  source         = "./modules/alb"
  env            = var.env
  alb_sg_id      = module.security_group.alb_sg_id
  public_subnets = module.vpc.public_subnet_ids
  vpc_id         = module.vpc.vpc_id
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.cluster_name
  app_name           = var.app_name
  image_url          = var.image_url
  execution_role_arn = var.execution_role_arn
  desired_count      = var.desired_count
  ecs_sg_id          = module.security_group.app_sg_id
  target_group_arn   = module.alb.target_group_arn
  private_subnets    = module.vpc.private_subnet_ids
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
}

module "ecs_ec2" {
  source             = "./modules/ecs_ec2"
  app_name           = var.app_name
  ecs_key_public     = var.ecs_key_public
  cluster_name       = var.cluster_name
  ecs_sg_id          = module.security_group.app_sg_id
  instance_type      = var.ecs_instance_type
  private_subnet_id  = module.vpc.private_subnet_ids[0]
}

module "bastion" {
  source           = "./modules/bastion"
  ami_id           = var.bastion_ami_id
  instance_type    = var.bastion_instance_type
  key_name         = var.bastion_key_name
  public_subnet_id = module.vpc.public_subnet_ids[0]
  sg_id            = module.security_group.app_sg_id
  env              = var.env
}