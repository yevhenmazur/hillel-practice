resource "aws_instance" "hillel-demo-public-instance" {
  ami           = var.public-instance-ami
  instance_type = var.public-instance-type
  subnet_id     = var.public-subnet-id
  #aws_subnet.hillel-demo-public-subnet.id

  tags = {
    Name = "hillel-demo-public-instance"
  }
}

resource "aws_instance" "hillel-demo-private-instance" {
  ami           = var.public-instance-ami
  instance_type = var.private-instance-type
  subnet_id     = var.private-subnet-id
  #aws_subnet.hillel-demo-private-subnet.id

  tags = {
    Name = "hillel-demo-private-instance"
  }
}