variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
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
