data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}


resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "${var.app_name}-ecs-lt"
  image_id      = data.aws_ssm_parameter.ecs_ami.value
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  user_data = base64encode(<<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config
EOF
  )

  network_interfaces {
    security_groups             = [var.ec2_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.app_name}-ecs-instance"
    }
  }
}


resource "aws_autoscaling_group" "ecs_asg" {
  name                      = "${var.app_name}-ecs-asg"
  desired_capacity          = 1
  max_size                  = 2
  min_size                  = 1
  vpc_zone_identifier       = var.public_subnet_ids
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
