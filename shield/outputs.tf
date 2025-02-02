output "shield_protection_id" {
  description = "ID de la protección de AWS Shield"
  value       = aws_shield_protection.aws_shield.id
}