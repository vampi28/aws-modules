variable "bucket_name" {
  description = "Nombre del bucket S3."
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "Nombre de dominio regional del bucket S3."
  type        = string
}

variable "comment" {
  description = "Comentario para la distribución de CloudFront."
  type        = string
}

variable "min_ttl" {
  description = "Tiempo mínimo de vida (TTL) para los objetos en la caché de CloudFront."
  type        = number
}

variable "default_ttl" {
  description = "Tiempo de vida (TTL) por defecto para los objetos en la caché de CloudFront."
  type        = number
}

variable "max_ttl" {
  description = "Tiempo máximo de vida (TTL) para los objetos en la caché de CloudFront."
  type        = number
}

variable "tags" {
  description = "Mapa de etiquetas para aplicar a la distribución de CloudFront."
  type        = map(string)
  default     = {}
}

variable "cloudfront_invalidation_paths" {
  description = "Lista de rutas para invalidar en CloudFront"
  type        = list(string)
  default     = []
}