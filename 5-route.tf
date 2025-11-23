########################## Public rtb ##########################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.morris.id

  # default gateway route 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.morris-IGW.id
  }

  tags = {
    Name = "terraform-public-rtb"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}



########################## Private rtb ##########################
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.morris.id

  # default gateway route 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.morris.id
  }

  tags = {
    Name = "terraform-private-rtb"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

