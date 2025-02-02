# Módulo Terraform para CloudFront en AWS

## Introducción

Este módulo se encarga de crear una distribución de CloudFront en AWS con las configuraciones necesarias para gestionar la entrega de contenido de manera eficiente y segura.

## Requisitos Previos

Antes de usar este módulo, asegúrate de cumplir con los siguientes requisitos:

- Una cuenta de AWS con permisos para gestionar recursos de CloudFront.
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

- `aws_cloudfront_distribution`: Este recurso crea una distribución de CloudFront en AWS.
- `aws_cloudfront_origin_access_identity`: Configura una identidad de acceso de origen para la distribución.

## Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

| Nombre                          | Descripción                                                                  | Tipo           | Valor por defecto | Obligatorio |
| ------------------------------- | ---------------------------------------------------------------------------- | -------------- | ----------------- | ----------- |
| `bucket_name`                   | Nombre del bucket S3.                                                        | `string`       | -                 | Sí          |
| `bucket_regional_domain_name`   | Nombre de dominio regional del bucket S3.                                    | `string`       | -                 | Sí          |
| `comment`                       | Comentario para la distribución de CloudFront.                               | `string`       | -                 | Sí          |
| `min_ttl`                       | Tiempo mínimo de vida (TTL) para los objetos en la caché de CloudFront.      | `number`       | 0                 | No          |
| `default_ttl`                   | Tiempo de vida (TTL) por defecto para los objetos en la caché de CloudFront. | `number`       | 3600              | No          |
| `max_ttl`                       | Tiempo máximo de vida (TTL) para los objetos en la caché de CloudFront.      | `number`       | 86400             | No          |
| `cloudfront_invalidation_paths` | Lista de rutas para invalidar en CloudFront.                                 | `list(string)` | `["/*"]`          | No          |
| `aws_access_key_id`             | AWS Access Key ID.                                                           | `string`       | -                 | Sí          |
| `aws_secret_access_key`         | AWS Secret Access Key.                                                       | `string`       | -                 | Sí          |
| `tags`                          | Mapa de etiquetas que se asignarán dinámicamente a la distribución.          | `map(string)`  | `{}`              | No          |
| `allowed_countries`             | Lista de códigos de país permitidos (ISO 3166-1 alpha-2).                    | `list(string)` | `["US"]`    | No          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "cloudfront" {
  source                        = "./modules/cloudfront"
  bucket_name                   = module.s3-imagenes.bucket_name
  bucket_regional_domain_name   = module.s3-imagenes.bucket_regional_domain_name
  comment                       = "My CloudFront Distribution"
  min_ttl                       = 0
  default_ttl                   = 3600
  max_ttl                       = 86400
  cloudfront_invalidation_paths = var.cloudfront_invalidation_paths
  allowed_countries             = var.allowed_countries
}
```

## Notas adicionales

- Las etiquetas (`tags`) se asignan dinámicamente utilizando un mapa, lo que permite una fácil personalización para distintos entornos o proyectos.
- En caso de querer recargar la cache, utiliza el siguiente comando:
  ```bash
  aws cloudfront create-invalidation --distribution-id <DISTRIBUTION_ID> --paths "/*"
  ```
- Se han configurado restricciones geográficas (geo-restrictions) en CloudFront para permitir el acceso solo desde USA y Europa.