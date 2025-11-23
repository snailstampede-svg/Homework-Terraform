resource "aws_security_group" "web_lb" {
  name        = "web_alb-sg"
  description = "Allow HTTP for web server"
  vpc_id      = aws_vpc.morris.id

  tags = {
    Name = "web-server-ingress"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_lb_http" {
  security_group_id = aws_security_group.web_lb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


resource "aws_vpc_security_group_egress_rule" "web_lb_egress" {
  security_group_id = aws_security_group.web_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}