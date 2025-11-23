resource "aws_instance" "web_server" {
  ami                         = "ami-04f41aacd9c4116ec"
  associate_public_ip_address = true
  instance_type               = "t3.small"
  # key_name = 
  vpc_security_group_ids = [aws_security_group.ping.id, aws_security_group.web_server.id]
  subnet_id              = aws_subnet.public_1.id

  user_data = file("website_file.sh")

  tags = {
    Name = "web-server"
  }
}
