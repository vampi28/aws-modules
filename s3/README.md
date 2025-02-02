# Módulo Terraform para S3 en AWS

## Introducción

Este módulo se encarga de crear un bucket S3 en AWS con las configuraciones necesarias para gestionar almacenamiento, versionado y etiquetado dinámico.

## Requisitos Previos

Antes de usar este módulo, asegúrate de cumplir con los siguientes requisitos:

- Una cuenta de AWS con permisos para gestionar recursos S3.
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

- `aws_s3_bucket`: Este recurso crea un bucket S3 en AWS.
- aws_s3_bucket_public_access_block: Configura las políticas de acceso público del bucket.

## Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

| Nombre          | Descripción                                                        | Tipo          | Valor por defecto | Obligatorio |
| --------------- | ------------------------------------------------------------------ | ------------- | ----------------- | ----------- |
| `bucket_name`   | Especifica el nombre del bucket S3. Debe ser único a nivel global. | `string`      | -                 | Sí          |
| `force_destroy` | Permite eliminar el bucket incluso si contiene objetos.            | `bool`        | `false`           | No          |
| `tags`          | Mapa de etiquetas que se asignarán dinámicamente al bucket S3.     | `map(string)` | `{}`              | No          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "s3_bucket" {
  source        = "./terraform-s3-module"
  bucket_name   = "my-dynamic-bucket"
  force_destroy = true

  tags = {
    Environment = "Production"
    Project     = "Dynamic-Tags"
    Owner       = "Diego"
    Team        = "DevOps"
  }
}

```

## Notas adicionales

- Las etiquetas (`tags`) se asignan dinámicamente utilizando un mapa, lo que permite una fácil personalización para distintos entornos o proyectos.
- El bucket creado con este módulo puede ser eliminado automáticamente (si `force_destroy` es `true`), incluso si contiene objetos.
