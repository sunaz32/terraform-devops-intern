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
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  sg_id          = module.security_group.alb_sg
  alb_domain     = var.alb_domain
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  sg_id              = module.security_group.ecs_sg
  app_name           = var.app_name
  desired_count      = var.desired_count
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  image_url          = "<your-container-image-url>"
  target_group_arn   = module.alb.target_group_arn
}