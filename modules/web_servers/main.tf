# INSTANCES
resource "aws_instance" "nginx" {
  ami = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  # ami         = nonsensitive("/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2")
  instance_type = var.instance_type
  count         = 2

  cpu_options {
    core_count       = var.core_count
    threads_per_core = var.thread_count
  }

  subnet_id       = var.public_subnet_id
  security_groups = [var.security_group_id]

  iam_instance_profile = aws_iam_instance_profile.nginx_profile.name

  user_data = templatefile("${path.module}/initial-server-setup.sh", {
    s3_bucket_id = var.s3_bucket_id
  })

  tags = {
    "Name" : "nginx-${count.index + 1}"
  }

}



resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx-profile"
  role = "LabRole"
}

