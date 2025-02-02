# Módulo Terraform para AWS Lambda

## Introducción

Este módulo crea una función Lambda en AWS con la configuración especificada.

## Requisitos Previos

- Una cuenta de AWS con permisos para gestionar funciones Lambda.
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

- `aws_lambda_function.this`: Función Lambda configurada con las variables especificadas.
- `aws_iam_role.lambda_exec`: Rol IAM para la ejecución de la función Lambda.
- `aws_iam_role_policy_attachment.lambda_exec_policy`: Adjunta la política básica de ejecución de Lambda al rol IAM.

## Variables utilizadas

| Nombre                   | Descripción                           | Tipo           | Valor por defecto | Obligatorio |
|--------------------------|---------------------------------------|----------------|-------------------|-------------|
| `function_name`          | Nombre de la función Lambda           | `string`       | -                 | Sí          |
| `s3_bucket`              | Nombre del bucket S3                  | `string`       | -                 | Sí          |
| `s3_key`                 | Clave del objeto en S3                | `string`       | -                 | Sí          |
| `handler`                | Manejador de la función Lambda        | `string`       | -                 | Sí          |
| `runtime`                | Runtime de la función Lambda          | `string`       | -                 | Sí          |
| `environment_variables`  | Variables de entorno para la función  | `map(string)`  | `{}`              | No          |
| `security_group_ids`     | IDs de los grupos de seguridad        | `list(string)` | `[]`              | No          |
| `subnet_ids`             | IDs de las subnets                    | `list(string)` | `[]`              | No          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "lambda_function" {
    source                 = "./modules/lambda"
    function_name          = "my-lambda-function"
    s3_bucket              = "my-lambda-bucket"
    s3_key                 = "my-lambda-code.zip"
    handler                = "index.handler"
    runtime                = "nodejs14.x"
    environment_variables  = {
        ENV_VAR1 = "value1"
        ENV_VAR2 = "value2"
    }
    security_group_ids     = ["sg-12345678"]
    subnet_ids             = ["subnet-12345678", "subnet-87654321"]
}
```

## Notas adicionales

- La configuración de VPC es opcional y se puede omitir si no se necesita.
- Asegúrate de que el bucket S3 y la clave del objeto existen antes de aplicar la configuración.
- La política de ejecución básica de Lambda se adjunta automáticamente al rol IAM.