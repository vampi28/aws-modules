variable "asg_name" {
  description = "Nombre del Auto Scaling Group"
  type        = string
}

variable "evaluation_periods" {
  description = "Número de períodos de evaluación"
  type        = number
}

variable "period" {
  description = "Período de evaluación"
  type        = number
}

variable "high_cpu_threshold" {
  description = "Umbral alto de CPU"
  type        = number
}

variable "low_cpu_threshold" {
  description = "Umbral bajo de CPU"
  type        = number
}

variable "high_memory_threshold" {
  description = "Umbral alto de memoria"
  type        = number
}

variable "low_memory_threshold" {
  description = "Umbral bajo de memoria"
  type        = number
}

variable "scale_up_policy_arn" {
  description = "ARN de la política de escalado hacia arriba"
  type        = string
}

variable "scale_down_policy_arn" {
  description = "ARN de la política de escalado hacia abajo"
  type        = string
}