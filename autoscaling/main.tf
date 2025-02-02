resource "aws_autoscaling_group" "app_asg" {
  name = var.asg_name
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnets
  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  health_check_type         = "ELB"
  health_check_grace_period = 60

  target_group_arns = var.target_group_arns

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = var.min_healthy_percentage
    }
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 30
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale_down_policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
}