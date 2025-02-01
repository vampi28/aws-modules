variable "sg_name" {
  description = "Nombre del Security Group"
  type        = string
}

variable "sg_description" {
  description = "Descripción del Security Group"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "ingress_rules" {
  description = "Lista de reglas de entrada"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
}

