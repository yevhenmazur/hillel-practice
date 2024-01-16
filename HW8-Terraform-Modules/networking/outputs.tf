output "private-subnet-id" {
  value       = aws_subnet.hillel-demo-private-subnet.id
  description = "Subnet.id for private subnet"
}

output "public-subnet-id" {
  value       = aws_subnet.hillel-demo-public-subnet.id
  description = "Subnet.id for public subnet"
}
