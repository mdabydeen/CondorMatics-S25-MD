variable "instance_type" {
  type      = string
  sensitive = false
  default   = "t3.micro"
}

variable "core_count" {
  type = number
}

variable "thread_count" {
  type = number
}

variable "s3_bucket_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "public_subnet_id" {
  # aws_subnet.public_subnet.id
  type = string
}
