output "alb_arn" {
  description = "ARN del ALB"
  value       = aws_lb.main.arn
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = aws_lb_target_group.main.arn
}

output "alb_dns_name" {
  description = "Nombre del DNS del ALB"
  value       = aws_lb.main.dns_name
}