resource "aws_lb" "web-tier" {
  name               = "web-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_lb.id]
  subnets = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  enable_deletion_protection = false



  tags = {
    Name = "web-tier-alb"
  }
}