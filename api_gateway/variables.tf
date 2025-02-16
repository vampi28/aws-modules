variable "api_description" {
  description = "The description of the API Gateway"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "The ARN of the Lambda function to invoke"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "stage_name" {
  description = "The name of the deployment stage"
  type        = string
  default     = "prod"
}

variable "api_key_required" {
  description = "Whether an API key is required"
  type        = bool
  default     = false
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}