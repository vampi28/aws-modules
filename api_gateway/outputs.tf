output "api_gateway_rest_api_id" {
  description = "The ID of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.this.id
}

output "api_gateway_deployment_id" {
  description = "The ID of the API Gateway deployment"
  value       = aws_api_gateway_deployment.this.id
}

output "api_gateway_stage_name" {
  description = "The name of the API Gateway stage"
  value       = aws_api_gateway_stage.prod.stage_name
}

output "api_lambda_sendmail" {
  description = "URL de la API para enviar correos"
  value       = "https://${aws_api_gateway_rest_api.this.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_stage.prod.stage_name}/sendmail"
}