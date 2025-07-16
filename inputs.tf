

variable "resource_tags" {
  type      = map(string)
  sensitive = false
  default = {
    "name" = "prog8830-condormatics"
  }
}