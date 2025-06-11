# INSTANCES
resource "aws_instance" "nginx1" {
  ami           = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type = "t3.micro"

  iam_instance_profile = aws_iam_instance_profile.nginx_profile.name

  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public_security_group.id]


  user_data = file("./initial-server-setup.sh")

}

# INSTANCES
resource "aws_instance" "nginx2" {
  ami           = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type = "t3.micro"

  iam_instance_profile = aws_iam_instance_profile.nginx_profile.name

  subnet_id       = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.public_security_group.id]

  user_data = file("./initial-server-setup.sh")

}

resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx-profile"
  role = "LabRole"
}

