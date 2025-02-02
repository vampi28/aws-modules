variable "name" {
  description = "Nombre del Web ACL"
  type        = string
}

variable "description" {
  description = "Descripción del Web ACL"
  type        = string
}

variable "allowed_countries" {
  description = "Lista de códigos de país permitidos (ISO 3166-1 alpha-2)"
  type        = list(string)
  default     = ["US"]
}

variable "resource_arn" {
  description = "ARN del recurso al que se asociará el Web ACL (por ejemplo, el ARN del ALB)"
  type        = string
}
