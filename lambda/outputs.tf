output "lambda_function_name" {
  description = "Nombre de la función Lambda"
  value       = aws_lambda_function.this.function_name
}

output "lambda_function_arn" {
  description = "ARN de la función Lambda"
  value       = aws_lambda_function.this.arn
}

output "lambda_function_invoke_arn" {
  description = "ARN de la función Lambda para invocarla"
  value       = aws_lambda_function.this.invoke_arn
}

output "api_lambda_sendmail" {
  description = "URL de la API para enviar correos"
  value       = module.api_gateway.api_lambda_sendmail
}