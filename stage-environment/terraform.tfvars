region               = "ap-south-1"
app_name             = "stage-app"
environment          = "stage"
vpc_cidr          = "10.20.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b"]
public_subnets    = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnets   = ["10.20.3.0/24", "10.20.4.0/24"]
alb_domain           = "stage.naziya.visiontechguru.in"
bastion_ami_id       = ""
bastion_instance_type = "t2.micro"

ecs_instance_type    = "t2 small"
