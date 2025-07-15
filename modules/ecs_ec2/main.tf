# Get latest ECS Optimized AMI
data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}
resource "aws_iam_role" "ecs_instance_role" {
  name = var.iam_instance_profile_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  }
  
resource "aws_iam_role_policy_attachment" "ecs_ec2_policy" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
# IAM Instance Profile (wraps IAM Role)
resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "${var.app_name}-ecs-instance-profile"
  role = aws_iam_role.ecs_instance_role.name
}

# Launch Template for ECS EC2 instances
resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "${var.app_name}-ecs-lt"
  image_id      = data.aws_ssm_parameter.ecs_ami.value
  instance_type = var.instance_type
  key_name      = var.key_name

 iam_instance_profile {
  name = aws_iam_instance_profile.ecs_instance_profile.name
}

  user_data = base64encode(<<EOF
#!/bin/bash
,echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config
EOF
  )

  network_interfaces {
    security_groups = [var.ec2_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.app_name}-ecs-instance"
    }
  }
}

# Auto Scaling Group for ECS
resource "aws_autoscaling_group" "ecs_asg" {
  name                      = "${var.app_name}-ecs-asg"
  desired_capacity          = 1
  max_size                  = 2
  min_size                  = 1
  vpc_zone_identifier       = length(var.private_subnet_ids) > 0 ? var.private_subnet_ids : var.public_subnet_ids
  health_check_type         = "EC2"

  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.app_name}-ecs-asg"
    propagate_at_launch = true
  }
}
