output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.private.*.id
}

output "private_without_nat_gateway_route_table_ids" {
  description = "List of IDs of private route tables without NAT Gateway"
  value       = aws_route_table.private_without_nat_gateway.*.id
}

output "database_route_table_ids" {
  description = "List of IDs of database route tables"
  value       = length(aws_route_table.database.*.id) > 0 ? aws_route_table.database.*.id : aws_route_table.private.*.id
}

output "public_subnet_arns" {
  description = "List of public subnet arns"
  value = [aws_subnet.public.*.arn]
}

output "private_subnet_arns" {
  description = "List of private subnet arns"
  value = [aws_subnet.private.*.arn]
}

output "database_subnet_arns" {
  description = "List of database subnet arns"
  value = [aws_subnet.database.*.arn]
}

output "public_subnets" {
  description = "List of public subnet ids"
  value = [aws_subnet.public.*.id]
}

output "private_subnets" {
  description = "List of private subnet ids"
  value = [aws_subnet.private.*.id]
}

output "database_subnets" {
  description = "List of database subnet ids"
  value = [aws_subnet.database.*.id]
}