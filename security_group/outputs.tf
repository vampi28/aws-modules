output "sg_id" {
  description = "ID del Security Group"
  value       = aws_security_group.alb_sg.id
}