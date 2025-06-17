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

variable "resource_tags" {
  type      = map(string)
  sensitive = false
  default = {
    "name" = "prog8830-condormatics"
  }
}