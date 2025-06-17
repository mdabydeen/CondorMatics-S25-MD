# INSTANCES
resource "aws_instance" "nginx1" {
  ami           = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type = var.instance_type

  cpu_options {
    core_count       = var.core_count
    threads_per_core = var.thread_count
  }

  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public_security_group.id]


  user_data = file("./initial-server-setup.sh")

  tags = {
    "Name" : "nginx2"
  }


}

# INSTANCES
resource "aws_instance" "nginx2" {
  ami           = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type = var.instance_type

  cpu_options {
    core_count       = var.core_count
    threads_per_core = var.thread_count
  }

  subnet_id       = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.public_security_group.id]

  user_data = file("./initial-server-setup.sh")

  tags = {
    "Name" : "nginx2"
  }

}

resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx-profile"
  role = "LabRole"
}

