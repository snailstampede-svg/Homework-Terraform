resource "aws_internet_gateway" "morris-IGW" {
  vpc_id = aws_vpc.morris.id

  tags = {
    Name = "morris-IGW"

  }
}