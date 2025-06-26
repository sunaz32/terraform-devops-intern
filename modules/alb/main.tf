resource "aws_lb" "app_alb" {
  name               = "${var.app_name}-alb"
  internal           = false
  load_balancer_type = "application"
 security_groups    = var.alb_sg_id
  subnets   = var.public_subnet_ids
  
 

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
    Name        = "${var.app_name}-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name        = "${var.app_name}-tg"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

   health_check {
    path                = "/"               # 👈 Update if your app exposes e.g. /health
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200"             # Expected HTTP code
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

