terraform {
    required_version = ">= 1.1.6"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 4.66"
        }
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# EC2 Security Group
# ---------------------------------------------------------------------------------------------------------------------
module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = var.sg_name
  description = var.sg_description

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = var.ingress_rules

  tags = merge(
    {
      "Terragrunt"   = "true"
      "Terraform"    = "true"
      "Environment"  = var.tag_environment
    },
    var.custom_tags
  )
}

# ---------------------------------------------------------------------------------------------------------------------
# EC2 Instance
# ---------------------------------------------------------------------------------------------------------------------
module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  count = var.instance_count

  name          = format("%s-%02d", var.ec2_instance_name, count.index + 1)
  instance_type = var.instance_type
  ami           = var.ami_id

  vpc_security_group_ids = [module.security-group.security_group_id]
  subnet_id              = var.subnet_ids[count.index]

  ebs_block_device = var.create_ebs_volume ? [
    {
      device_name           = var.ebs_device_name
      volume_type           = var.ebs_volume_type
      volume_size           = var.ebs_volume_size
      delete_on_termination = var.ebs_delete_on_termination
    },
  ] : []

  tags = merge(
    {
      "Terragrunt"   = "true"
      "Terraform"    = "true"
      "Environment"  = var.tag_environment
    },
    var.custom_tags
  )
}
