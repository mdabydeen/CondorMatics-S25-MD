output "load_balancer_public_dns" {
  value = "https://${aws_lb.nginx_lb.dns_name}"
}