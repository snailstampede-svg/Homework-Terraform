resource "aws_lb_target_group" "web_tier" {
  name     = "webs-server-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.morris.id

  tags = {

    Name = "web-tier-target-group"

  }
}


