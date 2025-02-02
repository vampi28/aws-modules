# Módulo Terraform para AWS Shield Advanced

## Introducción
Este módulo se encarga de habilitar AWS Shield Advanced para proteger automáticamente sus recursos de AWS contra ataques DDoS. AWS Shield Advanced ofrece protección adicional y características avanzadas, pero conlleva un costo adicional de $3000 al mes. Está integrado con servicios como AWS CloudFront, AWS Route 53, AWS Global Accelerator y Elastic Load Balancing.

## Requisitos Previos

Antes de usar este módulo, asegúrate de cumplir con los siguientes requisitos:

- Una cuenta de AWS con permisos para gestionar recursos de Shield.
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

- `aws_shield_protection`: Este recurso habilita AWS Shield Standard para los recursos especificados.

## Variables utilizadas

Las variables pueden ser modificadas al realizar la llamada al módulo:

| Nombre         | Descripción                                           | Tipo     | Valor por defecto | Obligatorio |
| -------------- | ----------------------------------------------------- | -------- | ----------------- | ----------- |
| `resource_arn` | ARN del recurso al que se aplicará la protección DDoS | `string` | -                 | Sí          |
| `name`         | Nombre para el recurso                                | `string` | -                 | Sí          |

## Ejemplo de uso

Ejemplo de llamada desde un módulo principal:

```hcl
module "shield" {
    source       = "./modules/shield"
    name         = "name"
    resource_arn = module.alb.alb_arn
}
```

## Notas adicionales

- AWS Shield Standard se activa automáticamente sin necesidad de configuración adicional.
- **Tenga cuidado de no activar AWS Shield Advanced, ya que conlleva costes elevados.** AWS Shield Advanced ofrece protección adicional y características avanzadas, pero puede resultar en cargos significativos.

