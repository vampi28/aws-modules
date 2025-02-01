variable "alb_name" {
  description = "Nombre del ALB"
  type        = string
}

variable "internal" {
  description = "Si el ALB es interno o no"
  type        = bool
  default     = false
}

variable "security_group_id" {
  description = "ID del Security Group para el ALB"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets para el ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Habilitar protección contra eliminación"
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "Habilitar balanceo de carga entre zonas"
  type        = bool
  default     = true
}

variable "target_group_name" {
  description = "Nombre del Target Group"
  type        = string
}

variable "target_group_port" {
  description = "Puerto del Target Group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocolo del Target Group"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "ssl_certificate_arn" {
  description = "ARN del certificado SSL"
  type        = string
}