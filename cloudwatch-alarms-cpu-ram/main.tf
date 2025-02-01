resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name                = "high_cpu_alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.high_cpu_threshold
  alarm_description         = "This metric monitors EC2 CPU utilization"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = [var.scale_up_policy_arn]
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name                = "low_cpu_alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.low_cpu_threshold
  alarm_description         = "This metric monitors EC2 CPU utilization"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = [var.scale_down_policy_arn]
}

resource "aws_cloudwatch_metric_alarm" "high_memory" {
  alarm_name                = "high_memory_alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "MemoryUtilization"
  namespace                 = "CWAgent"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.high_memory_threshold
  alarm_description         = "This metric monitors EC2 Memory utilization"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = [var.scale_up_policy_arn]
}

resource "aws_cloudwatch_metric_alarm" "low_memory" {
  alarm_name                = "low_memory_alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "MemoryUtilization"
  namespace                 = "CWAgent"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.low_memory_threshold
  alarm_description         = "This metric monitors EC2 Memory utilization"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = [var.scale_down_policy_arn]
}