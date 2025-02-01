# Módulo Terraform para Security Group en AWS

## Introducción

Este módulo crea un Security Group con reglas de entrada (ingress) y de salida (egress) en AWS.

## Requisitos Previos

- Una cuenta de AWS con permisos para gestionar Security Groups.
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

- `aws_security_group.alb_sg`: Security Group configurado con reglas de entrada dinámicas basadas en la variable `ingress_rules` y una regla de salida abierta.

## Variables utilizadas

| Nombre          | Descripción                           | Tipo           | Valor por defecto | Obligatorio |
|-----------------|---------------------------------------|----------------|-------------------|-------------|
| `sg_name`       | Nombre del Security Group             | `string`       | -                 | Sí          |
| `sg_description`| Descripción del Security Group        | `string`       | -                 | Sí          |
| `vpc_id`        | ID de la VPC                          | `string`       | -                 | Sí          |
| `ingress_rules` | Lista de reglas de entrada            | `list(object)` | -                 | Sí          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "security_group" {
  source              = "./modules/security_group"
  sg_name             = "my-security-group"
  sg_description      = "Security group for my application"
  vpc_id              = "vpc-12345678"
  ingress_rules       = [
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    },
    {
      from_port       = 443
      to_port         = 443
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    }
  ]
}

```

## Notas adicionales

- Las reglas de entrada (ingress) se configuran dinámicamente utilizando la variable ingress_rules.
- La regla de salida (egress) permite todo el tráfico por defecto.

