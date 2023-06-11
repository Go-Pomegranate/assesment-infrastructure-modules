output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "availability_zones" {
  description = "The availability zones used in the VPC"
  value       = var.azs
}

output "frontend_subnets" {
  description = "The IDs of the frontend subnets"
  value       = aws_subnet.frontend_subnet[*].id
}

output "application_subnets" {
  description = "The IDs of the application subnets"
  value       = aws_subnet.application_subnet[*].id
}

output "database_subnets" {
  description = "The IDs of the database subnets"
  value       = aws_subnet.database_subnet[*].id
}