# Módulos de Terraform para AWS

## Introducción

Este repositorio contiene una colección de módulos de Terraform para gestionar diversos recursos en AWS. Cada módulo está diseñado para ser reutilizable y configurable, facilitando la implementación de infraestructura en la nube de manera eficiente y consistente.

## Módulos Disponibles

### [ALB](alb/readme.md)
Este módulo crea un Application Load Balancer (ALB) con sus respectivos listeners (HTTP y HTTPS), así como un Target Group para enrutar el tráfico.

### [Auto Scaling](autoscaling/readme.md)
Este módulo crea y gestiona un Auto Scaling Group (ASG) en AWS, junto con sus políticas de escalado (scale up y scale down).

### [CloudWatch Alarms (CPU y RAM)](cloudwatch-alarms-cpu-ram/readme.md)
Este módulo configura alarmas de CPU y memoria para monitorizar el Auto Scaling Group y accionar las políticas de escalado según corresponda.

### [CloudFront](cloudfront/readme.md)
Este módulo crea una distribución de CloudFront en AWS para la entrega eficiente y segura de contenido.

### [Security Group](security_group/readme.md)
Este módulo crea un Security Group con reglas de entrada (ingress) y de salida (egress) en AWS.

### [S3](s3/readme.md)
Este módulo crea y gestiona buckets de S3 en AWS, incluyendo configuración de versionado y cifrado del lado del servidor.

### [WAF](waf/readme.md)
Este módulo crea y configura un Web Application Firewall (WAF) en AWS para proteger tus aplicaciones web de ataques comunes.

### [SHIELD](shield/readme.md)
Este módulo crea y configura AWS Shield para la protección contra ataques DDoS. AWS Shield proporciona dos niveles de protección:

- **AWS Shield Standard**: Este nivel de protección está incluido de forma gratuita y se aplica automáticamente a todos los recursos de AWS. Protege contra ataques DDoS más comunes y volumétricos.
- **AWS Shield Advanced**: Este nivel de protección ofrece capacidades adicionales, como protección contra ataques más sofisticados, acceso a un equipo de respuesta a incidentes de AWS (DDoS Response Team), y cobertura de costos adicionales asociados con ataques DDoS. **Activar AWS Shield Advanced genera un costo adicional de $3000 USD al mes**.

Este módulo permite configurar AWS Shield Advanced según las necesidades de protección de tu infraestructura.
## Requisitos Previos

- Una cuenta de AWS con permisos adecuados para gestionar los recursos.
- Terraform instalado (versión >= 1.4.0).
- Configuración de credenciales de AWS en tu entorno (archivo `~/.aws/credentials` o variables de entorno).

## Uso

Para utilizar cualquiera de estos módulos, inclúyelos en tu archivo principal de Terraform y configura las variables necesarias. Por ejemplo:

```hcl
module "s3_bucket" {
  source        = "./terraform-s3-module"
  bucket_name   = "my-dynamic-bucket"
  force_destroy = true

  tags = {
    Environment = "Production"
    Project     = "Dynamic-Tags"
    Owner       = "sys-admin"
    Team        = "DevOps"
  }
}