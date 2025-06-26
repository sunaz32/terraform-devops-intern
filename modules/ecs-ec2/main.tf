resource "tls_private_key" "ecs_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ecs_key" {
  key_name   = "${var.app_name}-key"
  public_key = tls_private_key.ecs_key.public_key_openssh
}

resource "local_file" "private_key" {
  content              = tls_private_key.ecs_key.private_key_pem
  filename             = "${path.module}/ecs_key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}


resource "aws_launch_template" "ecs" {
  name_prefix   = "${var.app_name}-ecs-launch-"
  image_id = var.ami_id
  instance_type = var.ecs_instance_type
  key_name      = aws_key_pair.ecs_key.key_name

  user_data = base64encode(<<EOF
#!/bin/bash
echo "ECS_CLUSTER=${var.app_name}-cluster" >> /etc/ecs/ecs.config
systemctl enable --now ecs
EOF
)

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.ecs_sg_id]
  }
}

resource "aws_autoscaling_group" "ecs" {
  desired_capacity     = 1
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.ecs.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.app_name}-ecs-instance"
    propagate_at_launch = true
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.app_name}-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  cpu                      = 256      
  memory                   = 512   

  container_definitions = jsonencode([
    {
      name      = var.app_name
      image     = var.image_url
      essential = true
      memory    = var.container_memory  # Minimum container memory
      portMappings = [{
        containerPort = var.container_port
        hostPort      = var.container_port
      }]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "${var.app_name}-service"
  cluster         = var.ecs_cluster_arn
  task_definition = aws_ecs_task_definition.app.arn
  launch_type     = "EC2"
  desired_count   = 1

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = var.app_name
    container_port   = var.container_port
  }
}
