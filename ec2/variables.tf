variable "ec2_instance_name" {
  description = "Name for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro" # This is a cost-effective choice, adjust as necessary
}

variable "instance_count"{
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch resources in"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "ebs_device_name" {
  description = "The name of the device to mount"
  type        = string
  default     = "/dev/sda1"
}

variable "ebs_volume_type" {
  description = "The type of volume (e.g., gp2, io1, st1, sc1, or standard)"
  type        = string
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "The size of the volume in gigabytes"
  type        = number
  default     = 30
}

variable "ebs_delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  type        = bool
  default     = true
}

variable "create_key_pair" {
  description = "Whether to create a new key pair"
  type        = bool
  default     = false
}

variable "create_ebs_volume" {
  description = "Whether to create a new EBS volume"
  type        = bool
  default     = false
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for inbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type        = list(string)
  default     = []
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

