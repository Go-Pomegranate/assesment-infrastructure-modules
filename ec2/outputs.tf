output "security_group_id" {
  description = "The ID of the created security group"
  value       = module.security-group.security_group_id
}

output "security_group_name" {
  description = "The name of the created security group"
  value       = module.security-group.security_group_name
}

output "security_group_arn" {
  description = "The ARN of the created security group"
  value       = module.security-group.security_group_arn
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instances"
  value       = [for instance in module.ec2 : instance.public_ip]
}

output "ec2_instance_id" {
  description = "The IDs of the EC2 instances"
  value       = [for instance in module.ec2 : instance.id]
}


