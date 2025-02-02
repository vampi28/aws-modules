variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "s3_bucket" {
  description = "Nombre del bucket S3 que contiene el código fuente"
  type        = string
}

variable "s3_key" {
  description = "Clave del objeto S3 que contiene el código fuente"
  type        = string
}

variable "handler" {
  description = "Handler de la función Lambda"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "runtime" {
  description = "Runtime de la función Lambda"
  type        = string
  default     = "python3.8"
}

variable "environment_variables" {
  description = "Variables de entorno para la función Lambda"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "IDs de los security groups para la función Lambda"
  type        = list(string)
}

variable "subnet_ids" {
  description = "IDs de las subnets para la función Lambda"
  type        = list(string)
}