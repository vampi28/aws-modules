output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.name
}

output "scale_up_policy_arn" {
  value = aws_autoscaling_policy.scale_up.arn
}

output "scale_down_policy_arn" {
  value = aws_autoscaling_policy.scale_down.arn
}