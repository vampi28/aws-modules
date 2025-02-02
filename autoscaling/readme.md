# Módulo Terraform para Auto Scaling en AWS

## Introducción

Este módulo crea y gestiona un Auto Scaling Group (ASG) en AWS, junto con sus políticas de escalado (scale up y scale down). Permite definir la capacidad deseada, tamaño máximo y mínimo, así como el Launch Template y los Target Groups asociados.

## Requisitos Previos

- Una cuenta de AWS con permisos para gestionar Auto Scaling Groups.  
- Terraform instalado (versión >= 1.4.0).
- Configuración de credenciales de AWS en tu entorno (archivo `~/.aws/credentials` o variables de entorno).

## Build and Test

Para ejecutar este módulo, inclúyelo en tu archivo principal de Terraform y luego usa:

```bash
terraform init
terraform plan
terraform apply
```

## Recursos

El código crea los siguientes recursos en AWS:

- `aws_s3_bucket`: Este recurso crea un bucket S3 en AWS.
- `aws_s3_bucket_versioning`: Configura el versionado en el bucket.
- `aws_s3_bucket_server_side_encryption_configuration`: Habilita el cifrado del lado del servidor con AES256.

## Variables utilizadas

| Nombre                    | Descripción                                               | Tipo           | Valor por defecto | Obligatorio |
|---------------------------|-----------------------------------------------------------|----------------|-------------------|-------------|
| `asg_name`                | Nombre del Auto Scaling Group                             | `string`       | -                 | Sí          |
| `desired_capacity`        | Capacidad deseada de instancias                           | `number`       | -                 | Sí          |
| `max_size`                | Tamaño máximo del ASG                                     | `number`       | -                 | Sí          |
| `min_size`                | Tamaño mínimo del ASG                                     | `number`       | -                 | Sí          |
| `subnets`                 | Lista de subnets para el ASG                              | `list(string)` | -                 | Sí          |
| `launch_template_id`      | ID del Launch Template                                    | `string`       | -                 | Sí          |
| `launch_template_version` | Versión del Launch Template                               | `string`       | -                 | Sí          |
| `target_group_arns`       | ARNs de los Target Groups                                 | `list(string)` | `[]`              | No          |
| `min_healthy_percentage`  | Porcentaje mínimo de instancias saludables                | `number`       | -                 | Sí          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "autoscaling" {
  source                  = "./modules/autoscaling"
  asg_name                = "auto-scaling-group-ez"
  desired_capacity        = 2
  max_size                = 4
  min_size                = 1
  subnets                 = ["subnet-12345", "subnet-67890"]
  launch_template_id      = "lt-abc123"
  launch_template_version = "$Latest"
  target_group_arns       = ["arn:aws:elasticloadbalancing:..."]
  min_healthy_percentage  = 75
}

```

## Notas adicionales

- El ASG ajusta automáticamente la cantidad de instancias basándose en las alarmas y políticas de escalado configuradas.
- Se configura `instance_refresh` para llevar a cabo actualizaciones de manera gradual, manteniendo un porcentaje mínimo de instancias saludables.
- El parámetro `health_check_type` se ha configurado a "ELB" para utilizar las comprobaciones de salud del Load Balancer.
- El parámetro `health_check_grace_period` se ha configurado a 60 segundos para reducir el tiempo de gracia de las nuevas instancias.


