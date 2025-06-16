region         = "ap-south-1"
app_name       = "naziya-devops-intern-app"
cluster_name   = "naziya-devops-cluster-dev"
alb_domain     = "dev.naziya.devopswala.com"
desired_count  = 2
min_capacity   = 2
max_capacity   = 4
execution_role_arn = "arn:aws:iam::851725602228:role/ecsTaskExecutionRole"
