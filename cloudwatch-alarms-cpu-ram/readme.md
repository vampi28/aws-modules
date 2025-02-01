# Módulo Terraform para Alarmas de CloudWatch (CPU y RAM)

## Introducción

Este módulo configura alarmas de CPU y memoria para monitorizar el Auto Scaling Group y accionar las políticas de escalado según corresponda.

## Requisitos Previos

- Una cuenta de AWS con permisos para gestionar alarmas de CloudWatch.
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

- `aws_cloudwatch_metric_alarm.high_cpu`: Alarma cuando se excede el umbral alto de CPU.
- `aws_cloudwatch_metric_alarm.low_cpu`: Alarma cuando el uso de CPU está por debajo del umbral.
- `aws_cloudwatch_metric_alarm.high_memory`: Alarma cuando se excede el umbral alto de memoria.
- `aws_cloudwatch_metric_alarm.low_memory`: Alarma cuando el uso de memoria está por debajo del umbral.

## Variables utilizadas

| Nombre                    | Descripción                                               | Tipo           | Valor por defecto | Obligatorio |
|---------------------------|-----------------------------------------------------------|----------------|-------------------|-------------|
| `asg_name`                | Nombre del Auto Scaling Group                             | `string`       | -                 | Sí          |
| `evaluation_periods`      | Número de períodos de evaluación                          | `number`       | -                 | Sí          |
| `period`                  | Período de evaluación en segundos                         | `number`       | -                 | Sí          |
| `high_cpu_threshold`      | Umbral alto de uso de CPU                                 | `number`       | -                 | Sí          |
| `low_cpu_threshold`       | Umbral bajo de uso de CPU                                 | `number`       | -                 | Sí          |
| `high_memory_threshold`   | Umbral alto de uso de memoria                             | `number`       | -                 | Sí          |
| `low_memory_threshold`    | Umbral bajo de uso de memoria                             | `number`       | -                 | Sí          |
| `scale_up_policy_arn`     | ARN de la política de escalado hacia arriba               | `string`       | -                 | Sí          |
| `scale_down_policy_arn`   | ARN de la política de escalado hacia abajo                | `string`       | -                 | Sí          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "cloudwatch_alarms" {
  source                  = "./modules/cloudwatch-alarms-cpu-ram"
  asg_name                = "auto-scaling-group-ez"
  evaluation_periods      = 2
  period                  = 300
  high_cpu_threshold      = 80
  low_cpu_threshold       = 20
  high_memory_threshold   = 80
  low_memory_threshold    = 20
  scale_up_policy_arn     = "arn:aws:autoscaling:..."
  scale_down_policy_arn   = "arn:aws:autoscaling:..."
}

```

## Notas adicionales

- Las alarmas de CloudWatch permiten monitorizar el uso de recursos y ajustar automáticamente la capacidad del Auto Scaling Group según las políticas configuradas.

