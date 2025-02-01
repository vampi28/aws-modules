output "high_cpu_alarm_arn" {
  description = "ARN de la alarma de CPU alta"
  value       = aws_cloudwatch_metric_alarm.high_cpu.arn
}

output "low_cpu_alarm_arn" {
  description = "ARN de la alarma de CPU baja"
  value       = aws_cloudwatch_metric_alarm.low_cpu.arn
}

output "high_memory_alarm_arn" {
  description = "ARN de la alarma de memoria alta"
  value       = aws_cloudwatch_metric_alarm.high_memory.arn
}

output "low_memory_alarm_arn" {
  description = "ARN de la alarma de memoria baja"
  value       = aws_cloudwatch_metric_alarm.low_memory.arn
}