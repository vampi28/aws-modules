variable "asg_name" {
  description = "Nombre del Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
}

variable "subnets" {
  description = "Lista de subnets para el Auto Scaling Group"
  type        = list(string)
}

variable "launch_template_id" {
  description = "ID del Launch Template"
  type        = string
}

variable "launch_template_version" {
  description = "Versión del Launch Template"
  type        = string
}

variable "target_group_arns" {
  description = "ARNs de los Target Groups"
  type        = list(string)
  default     = []
}

variable "min_healthy_percentage" {
  description = "Porcentaje mínimo de instancias saludables"
  type        = number
}