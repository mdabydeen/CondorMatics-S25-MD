variable "project_name" {
  type        = string
  description = "The name of the project"
  default     = "Condormatics"
}

variable "vpc_cidr_block" {
  description = "The CIDR Block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "A list of CIDR blocks for public subnet"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "A list of CIDR blocks for public subnet"
}

variable "availability_azs" {
  description = "A list of available AWS Availability zones"
  type        = list(string)
}

variable "resource_tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
}
