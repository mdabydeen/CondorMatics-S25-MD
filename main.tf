# List of supported availability zones 
data "aws_availability_zones" "available" {
  state = "available"
}

# Networking
module "networking" {
  source         = "./modules/networking"
  vpc_cidr_block = var.vpc_cidr_block
}

# Web Server Module 
module "web_servers" {
  source            = "./modules/web_servers"
  core_count        = 1
  thread_count      = 2
  s3_bucket_id      = aws_s3_bucket.web_bucket.id
  security_group_id = aws_security_group.public_security_group.id
  public_subnet_id  = aws_subnet.public_subnet.id
}

# Cloudwatch module
module "cloudwatch" {
  source = "./modules/cloudwatch"
}


# Database module 
module "databases" {
  source = "./modules/databases"
}
