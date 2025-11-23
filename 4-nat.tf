resource "aws_eip" "morris-nat-eip" {
  domain = "vpc"

  tags = {
    Name = "terraform-eip-for-nat"
  }

  depends_on = [aws_internet_gateway.morris-IGW] # explict dependency 
}

resource "aws_nat_gateway" "morris" {
  allocation_id = aws_eip.morris-nat-eip.id # implict dependency for eip
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "terraform-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.morris-IGW]
}