
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = [for subnet in aws_subnet.public : subnet.id]
}


output "private_subnet_ids" {
  value = [for s in aws_subnet.private : s.id]
}
