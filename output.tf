output "public_subnets" {
  description = "List of public subnet ids"
  value = [aws_subnet.public.*.id]
}

output "private_subnets" {
  description = "List of private subnet ids"
  value = [aws_subnet.private.*.id]
}