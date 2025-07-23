

variable "resource_tags" {
  type      = map(string)
  sensitive = false
  default = {
    "name" = "prog8830-condormatics"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "The main module VPC CIDR Block"
  default     = "10.0.0.0/16"
}
