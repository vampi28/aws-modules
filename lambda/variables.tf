variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "s3_bucket" {
  description = "Nombre del bucket S3"
  type        = string
  default     = ""
}

variable "s3_key" {
  description = "Clave del objeto en S3"
  type        = string
  default     = ""
}

variable "filename" {
  description = "Nombre del archivo ZIP"
  type        = string
  default     = ""
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
  description = "Lista de IDs de los Security Groups"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de los Subnets"
  type        = list(string)
}

variable "region" {
  description = "Región de AWS."
  type        = string
  default     = "us-east-1"
}