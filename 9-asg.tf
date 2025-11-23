resource "aws_autoscaling_group" "web-tier" {

  name = "web-tier auto scaling group"

  vpc_zone_identifier = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  max_size            = 4
  min_size            = 2
  force_delete        = true
  health_check_type   = "ELB"
  target_group_arns   = [aws_lb_target_group.web_tier.arn]
  launch_template {
    id      = aws_launch_template.web_tier.id
    version = "$Latest"
  }
}