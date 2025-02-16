# Módulo Terraform para AWS API Gateway

## Introducción

Este módulo crea una API Gateway en AWS con la configuración especificada.

## Requisitos Previos

- Una cuenta de AWS con permisos para gestionar API Gateway.
- Terraform instalado (versión >= 1.4.0).
- Configuración de credenciales de AWS en tu entorno (archivo `~/.aws/credentials` o variables de entorno).

## Build and Test

Para ejecutar este módulo, inclúyelo en tu archivo principal de Terraform y luego utiliza:

```bash
terraform init
terraform plan
terraform apply
```

## Recursos

El código crea los siguientes recursos en AWS:

- `aws_api_gateway_rest_api.this`: API Gateway configurada con las variables especificadas.
- `aws_api_gateway_resource.this`: Recurso de API Gateway.
- `aws_api_gateway_method.this`: Método de API Gateway.
- `aws_api_gateway_integration.this`: Integración de API Gateway con Lambda u otros servicios.
- `aws_api_gateway_deployment.this`: Despliegue de API Gateway.

## Variables utilizadas

| Nombre                   | Descripción                           | Tipo           | Valor por defecto | Obligatorio |
|--------------------------|---------------------------------------|----------------|-------------------|-------------|
| `api_name`               | Nombre de la API Gateway              | `string`       | -                 | Sí          |
| `resource_path`          | Ruta del recurso en la API            | `string`       | -                 | Sí          |
| `http_method`            | Método HTTP para el recurso           | `string`       | -                 | Sí          |
| `integration_type`       | Tipo de integración (AWS, HTTP, MOCK) | `string`       | -                 | Sí          |
| `integration_uri`        | URI de integración                    | `string`       | -                 | Sí          |
| `stage_name`             | Nombre del stage de despliegue        | `string`       | -                 | Sí          |
| `lambda_arn`             | ARN de la función Lambda (si aplica)  | `string`       | -                 | No          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "api_gateway" {
    source             = "./modules/api_gateway"
    api_name           = "my-api-gateway"
    resource_path      = "my-resource"
    http_method        = "POST"
    integration_type   = "AWS_PROXY"
    integration_uri    = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/${aws_lambda_function.my_lambda.arn}/invocations"
    stage_name         = "dev"
    lambda_arn         = aws_lambda_function.my_lambda.arn
}
```

## Notas adicionales

- Asegúrate de que la función Lambda y otros recursos necesarios existen antes de aplicar la configuración.
- La integración con Lambda requiere permisos adecuados para invocar la función desde API Gateway.
- Puedes agregar múltiples recursos y métodos según sea necesario para tu API.