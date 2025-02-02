# Módulo Terraform para ALB en AWS

## Introducción

Este módulo crea un Application Load Balancer (ALB) con sus respectivos listeners (HTTP y HTTPS), así como un Target Group para enrutar el tráfico.

## Requisitos Previos

- Una cuenta de AWS con permisos para gestionar Application Load Balancers.
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

- `aws_lb`: Application Load Balancer configurado con el nombre y las subnets proporcionadas.
- `aws_lb_target_group`: Target Group para enrutar el tráfico al puerto y protocolo indicados.
- `aws_lb_listener`: Listeners para HTTP (puerto 80) y HTTPS (puerto 443) que permiten enrutar el tráfico al Target Group.

## Variables utilizadas

| Nombre                             | Descripción                                            | Tipo           | Valor por defecto | Obligatorio |
| ---------------------------------- | ------------------------------------------------------ | -------------- | ----------------- | ----------- |
| `alb_name`                         | Nombre del ALB                                         | `string`       | -                 | Sí          |
| `internal`                         | Indica si el ALB es interno                            | `bool`         | `false`           | No          |
| `security_group_id`                | ID del Security Group asociado al ALB                  | `string`       | -                 | Sí          |
| `subnets`                          | Lista de subnets donde se despliega el ALB             | `list(string)` | -                 | Sí          |
| `enable_deletion_protection`       | Habilita la protección contra eliminación              | `bool`         | `false`           | No          |
| `enable_cross_zone_load_balancing` | Habilita el balanceo de carga entre diferentes zonas   | `bool`         | `true`            | No          |
| `target_group_name`                | Nombre del Target Group                                | `string`       | -                 | Sí          |
| `target_group_port`                | Puerto del Target Group                                | `number`       | -                 | Sí          |
| `target_group_protocol`            | Protocolo del Target Group (por ejemplo, HTTP o HTTPS) | `string`       | -                 | Sí          |
| `vpc_id`                           | ID de la VPC donde se configurará el ALB               | `string`       | -                 | Sí          |
| `ssl_certificate_arn`              | ARN del certificado SSL utilizado en HTTPS             | `string`       | -                 | Sí          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "alb" {
  source                            = "./modules/alb"
  alb_name                          = "my-alb"
  internal                          = false
  security_group_id                 = "sg-12345678"
  subnets                           = ["subnet-12345", "subnet-67890"]
  enable_deletion_protection        = false
  enable_cross_zone_load_balancing  = true
  target_group_name                 = "my-target-group"
  target_group_port                 = 80
  target_group_protocol             = "HTTP"
  vpc_id                            = "vpc-12345678"
  ssl_certificate_arn               = "arn:aws:acm:..."
}

```

## Notas adicionales

- El ALB se configura con listeners para HTTP y HTTPS, permitiendo enrutar el tráfico al Target Group especificado.
- La protección contra eliminación y el balanceo de carga entre zonas se pueden habilitar o deshabilitar según sea necesario.
- Las comprobaciones de salud se configuran para verificar la ruta raíz (`/`) utilizando el protocolo HTTP, con un intervalo de 10 segundos, un tiempo de espera de 5 segundos, y umbrales de éxito y fallo de 2.
- El tiempo de drenado de las instancias antiguas (`deregistration_delay`) se ha configurado a 30 segundos para permitir una transición más rápida entre instancias.