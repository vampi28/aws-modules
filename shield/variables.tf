variable "name" {
  description = "Nombre de la protección de AWS Shield"
  type        = string
}

variable "resource_arn" {
  description = "ARN del recurso a proteger con AWS Shield"
  type        = string
}