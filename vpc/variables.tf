variable "vpc_name" {
  description = "AWS VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR range"
  type        = string
}

variable "azs" {
  description = "AWS Availability Zones"
  type        = list(string)
}

variable "frontend_subnets_cidrs" {
  description = "AWS Frontend Subnets CIDR ranges"
  type        = list(string)
}

variable "application_subnets_cidrs" {
  description = "AWS application logic subnets CIDR ranges"
  type        = list(string)
}

variable "database_subnets_cidrs" {
  description = "AWS Database Subnets CIDR ranges"
  type        = list(string)
}

variable "tag_environment" {
  description = "Resource tag for environment"
  type        = string
  default     = "dev"
}

variable "custom_tags" {
  description = "A map of custom tags to add to the resources"
  type        = map(string)
  default     = {}
}
