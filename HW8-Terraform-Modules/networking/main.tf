resource "aws_vpc" "hillel-demo-vpc" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = "hillel-demo-vpc"
  }
}

### Public subnet configuration ###

resource "aws_subnet" "hillel-demo-public-subnet" {
  vpc_id     = aws_vpc.hillel-demo-vpc.id
  cidr_block = var.public-subnet-cidr

  tags = {
    Name = "hillel-demo-public-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.hillel-demo-vpc.id

  tags = {
    Name = "gw"
  }
}

resource "aws_network_interface" "test" {
  subnet_id = aws_subnet.hillel-demo-public-subnet.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.hillel-demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

### Private subnet configuration ###

resource "aws_subnet" "hillel-demo-private-subnet" {
  vpc_id     = aws_vpc.hillel-demo-vpc.id
  cidr_block = var.private-subnet-cidr

  tags = {
    Name = "hillel-demo-private-subnet"
  }
}

resource "aws_nat_gateway" "gw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.hillel-demo-private-subnet.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.hillel-demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }
}