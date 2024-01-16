terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project     = "Hillel"
      Chapter     = "HW7"
      Environment = "Test"
    }
  }
}

resource "aws_vpc" "hillel-demo-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main"
  }
}

### Public subnet configuration ###

resource "aws_subnet" "hillel-demo-public-subnet" {
  vpc_id     = aws_vpc.hillel-demo-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.hillel-demo-vpc.id

  tags = {
    Name = "Main"
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

#  route {
#    cidr_block = aws_vpc.hillel-demo-vpc.cidr_block
#    network_interface_id = aws_network_interface.test.id
#  }

#  route {
#    cidr_block = "10.0.0.0/16"
#    gateway_id = "local"
#  }
}

### Private subnet configuration ###

resource "aws_subnet" "hillel-demo-private-subnet" {
  vpc_id     = aws_vpc.hillel-demo-vpc.id
  cidr_block = "10.0.101.0/24"

  tags = {
    Name = "Private"
  }
}

resource "aws_nat_gateway" "gw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.hillel-demo-private-subnet.id

  tags = {
    Name = "Private"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.hillel-demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

#  route {
#    cidr_block = aws_vpc.hillel-demo-vpc.cidr_block
#    network_interface_id = aws_network_interface.test.id
#    gateway_id = "local"
#  }

#  route {
#    cidr_block = "10.0.0.0/16"
#    gateway_id = "local"
#  }
}

### EC2 Instances ###

resource "aws_instance" "frontend" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.hillel-demo-public-subnet.id

  tags = {
    Name = "Frontend"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.hillel-demo-private-subnet.id

  tags = {
    Name = "Backend"
  }
}
