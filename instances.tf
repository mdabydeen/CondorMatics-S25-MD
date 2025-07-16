module "web_servers" {
  source       = "./web_servers"
  core_count   = 1
  thread_count = 2
  s3_bucket_id = aws_s3_bucket.web_bucket.id
}