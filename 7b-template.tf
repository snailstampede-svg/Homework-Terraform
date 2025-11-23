
resource "aws_launch_template" "web_tier" {

  description            = "Launch Template for web tier servers"
  name                   = "web-tier-server-template"
  image_id               = "ami-04f41aacd9c4116ec"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]
  tags = {
    Name = "web server tier template"
  }

  user_data = filebase64("website_file.sh")

  tag_specifications {

    resource_type = "instance"
    tags = {
      ManagedBy = "Terraform"
    }

  }
  lifecycle {
    create_before_destroy = true
  }
}





