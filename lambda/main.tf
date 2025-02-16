resource "aws_lambda_function" "this" {
  function_name = var.function_name
  filename      = var.filename
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_exec.arn
  timeout       = 10

  environment {
    variables = var.environment_variables
  }

  # vpc_config {
  #   security_group_ids = var.security_group_ids
  #   subnet_ids         = var.subnet_ids
  # }
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.function_name}-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_exec_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lambda_vpc_policy" {
  name = "${var.function_name}-vpc-policy"
  role = aws_iam_role.lambda_exec.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ses:SendEmail",
          "ses:SendRawEmail"
        ],
        Resource = "*"
      }
    ]
  })
}


# ACCESO A TODO EL MUNDO

resource "aws_lambda_permission" "invoke_anywhere" {
  statement_id  = "AllowInvokeFromAnywhere"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "*"
}


module "api_gateway" {
  source                = "../api_gateway"
  function_name         = var.function_name
  api_description       = "API Gateway for ${var.function_name}"
  lambda_invoke_arn     = aws_lambda_function.this.invoke_arn
  lambda_function_name  = aws_lambda_function.this.function_name
  stage_name            = "prod"
  api_key_required      = false
  region                = var.region
}

