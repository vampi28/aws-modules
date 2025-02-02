# Módulo Terraform para AWS WAF con Restricciones Geográficas

## Introducción

Este módulo se encarga de crear un Web ACL en AWS WAF con restricciones geográficas para permitir o bloquear el acceso basado en la ubicación geográfica de las solicitudes. El Web ACL se asocia con un recurso específico, como un Application Load Balancer (ALB).

## Requisitos Previos

Antes de usar este módulo, asegúrate de cumplir con los siguientes requisitos:

- Una cuenta de AWS con permisos para gestionar recursos de WAF.
- Terraform instalado en tu máquina local (versión >= 1.4.0).
- Configuración previa de credenciales de AWS en tu entorno (`~/.aws/credentials` o variables de entorno).

## Build and Test

Para ejecutar este módulo, inclúyelo en un archivo principal de Terraform. Posteriormente, utiliza los siguientes comandos para desplegar la infraestructura:

```bash
terraform init
terraform plan
terraform apply
```

## Recursos

El código crea los siguientes recursos en AWS:

- `aws_wafv2_web_acl`: Este recurso crea un Web ACL en AWS WAF.
- `aws_wafv2_web_acl_association`: Asocia el Web ACL con un recurso específico (por ejemplo, un ALB).

## Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

| Nombre              | Descripción                                                                  | Tipo           | Valor por defecto | Obligatorio |
| ------------------- | ---------------------------------------------------------------------------- | -------------- | ----------------- | ----------- |
| `name`              | Nombre del Web ACL.                                                          | `string`       | -                 | Sí          |
| `description`       | Descripción del Web ACL.                                                     | `string`       | -                 | Sí          |
| `allowed_countries` | Lista de códigos de país permitidos (ISO 3166-1 alpha-2).                    | `list(string)` | `["US"]`    | No          |
| `resource_arn`      | ARN del recurso al que se asociará el Web ACL (por ejemplo, el ARN del ALB). | `string`       | -                 | Sí          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "waf" {
  source            = "./modules/waf"
  name              = "geo-restriction-acl"
  description       = "Web ACL to restrict access based on geolocation"
  allowed_countries = var.allowed_countries
  resource_arn      = module.alb.alb_arn
}
```

## Notas adicionales

- Las restricciones geográficas (geo-restrictions) se configuran utilizando una lista de códigos de país (ISO 3166-1 alpha-2).
- El Web ACL se asocia con un recurso específico, como un ALB, para aplicar las restricciones geográficas.
- Las métricas de CloudWatch están habilitadas para monitorear las solicitudes bloqueadas y permitidas.
