########################## Public subnets ##########################


resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.morris.id
  # step 1: make VPC
  # step 2: get VPC ID
  # step 3: add VPC ID into vpc_id argument in this subnet 
  # which VPC to create subnet in

  cidr_block              = "10.10.1.0/24"
  availability_zone       = "ap-southeast-7a" # specify AZ 
  map_public_ip_on_launch = true              # allow public IPs to be assigned 

  tags = {
    Name = "public-subnet-ap-southeast-7a"
  }
}


resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.morris.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "ap-southeast-7b" # specify AZ 
  map_public_ip_on_launch = true              # allow public IPs to be assigned 

  tags = {
    Name = "public-subnet-ap-southeast-7"
  }
}



########################## Private subnets ##########################

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.morris.id
  cidr_block              = "10.10.11.0/24"
  availability_zone       = "ap-southeast-7a" # specify AZ 
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-ap-southeast-7a"
  }
}


resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.morris.id
  cidr_block              = "10.10.12.0/24"
  availability_zone       = "ap-southeast-7b" # specify AZ 
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-ap-southeast-7"
  }
}


