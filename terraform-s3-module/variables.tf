variable "tags" {
  description = "Mapa de etiquetas para aplicar al bucket S3."
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "Terraform-S3"
    Owner       = "Diego"
  }
}

variable "bucket_name" {
  description = "Nombre del bucket S3."
  type        = string
}

variable "force_destroy" {
  description = "Permitir la eliminación del bucket incluso si contiene objetos."
  type        = bool
  default     = false
}