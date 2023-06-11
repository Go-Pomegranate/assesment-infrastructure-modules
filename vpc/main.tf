terraform {
    required_version = ">= 1.1.6"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 5.0.0"
        }
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# VPC subnets
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_subnet" "frontend_subnet" {
  count             = length(var.frontend_subnets_cidrs)
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.frontend_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index % length(var.azs)]

  tags = merge(
    {
      Name        = "Presentation tier"
      Type        = "Public"
      Terragrunt  = "true"
      Terraform   = "true"
    },
    var.custom_tags
  )
}

resource "aws_subnet" "application_subnet" {
  count             = length(var.application_subnets_cidrs)
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.application_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index % length(var.azs)]

  tags = merge(
    {
      Name        = "Application tier"
      Type        = "Private"
      Terragrunt  = "true"
      Terraform   = "true"
    },
    var.custom_tags
  )
}

resource "aws_subnet" "database_subnet" {
  count             = length(var.database_subnets_cidrs)
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.database_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index % length(var.azs)]

  tags = merge(
    {
      Name        = "Database tier"
      Type        = "Private"
      Terragrunt  = "true"
      Terraform   = "true"
    },
    var.custom_tags
  )
}

# ---------------------------------------------------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------------------------------------------------
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    cidr = var.vpc_cidr
    
    tags = merge({
        Name        = var.vpc_name
        Terragrunt  = "true"
        Terraform   = "true"
    }, var.custom_tags)
}
