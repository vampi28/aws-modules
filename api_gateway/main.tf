data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.function_name}-api"
  description = "API Gateway for ${var.function_name}"
}

resource "aws_api_gateway_resource" "sendmail" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "sendmail"
}

resource "aws_api_gateway_method" "sendmail_post" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.sendmail.id
  http_method   = "POST"
  authorization = "NONE"

  request_models = {
    "application/json" = "Empty"
  }

  request_parameters = {
    "method.request.header.Content-Type" = true
  }
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id             = aws_api_gateway_rest_api.this.id
  resource_id             = aws_api_gateway_resource.sendmail.id
  http_method             = aws_api_gateway_method.sendmail_post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_deployment" "this" {
  depends_on  = [aws_api_gateway_integration.lambda]
  rest_api_id = aws_api_gateway_rest_api.this.id
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = "prod"
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.this.id}/${var.stage_name}/POST/sendmail"
}

resource "aws_api_gateway_model" "sendmail_model" {
  rest_api_id  = aws_api_gateway_rest_api.this.id
  name         = "SendMailModel"
  description  = "Modelo para la solicitud de envío de correo"
  content_type = "application/json"

  schema = jsonencode({
    type = "object",
    properties = {
      Nombre  = { type = "string" },
      Email   = { type = "string" },
      Mensaje = { type = "string" }
    },
    required = ["Nombre", "Email", "Mensaje"]
  })
}
