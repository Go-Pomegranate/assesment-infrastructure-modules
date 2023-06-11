terraform {
    required_version = ">= 1.1.6"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 4.9"
        }
    }
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.12.0"

  bucket = var.bucket_name
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = merge(
    {
      "Terragrunt"   = "true"
      "Terraform"    = "true"
      "Environment"  = var.tag_environment
    },
    var.custom_tags
  )
}
