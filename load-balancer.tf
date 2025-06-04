# LOAD BALANCER 

# aws_lb 
resource "aws_lb" "nginx_lb" {
  name               = "prog8830-lb-tf"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.load_balancer_security_group.id]
  subnets         = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id]

  tags = {
    Name = "PROG8830_LB"
  }

}


# aws_lb_listener
resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.nginx_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_target_group.arn
  }
}


# aws_lb_target_group 
resource "aws_lb_target_group" "nginx_target_group" {
  name     = "nginx-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app.id
}


# aws_lb_target_group_attachment 
resource "aws_lb_target_group_attachment" "nginx1" {
  target_group_arn = aws_lb_target_group.nginx_target_group.arn
  target_id        = aws_instance.nginx1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "nginx2" {
  target_group_arn = aws_lb_target_group.nginx_target_group.arn
  target_id        = aws_instance.nginx2.id
  port             = 80
}


