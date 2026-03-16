variable "aws_region" {
  description = "AWS region for Jenkins infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "jenkins-on-demand"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner tag"
  type        = string
  default     = "esen"
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins"
  type        = string
  default     = "t3.small"
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access Jenkins UI on port 8080"
  type        = list(string)
}

variable "ssh_allowed_cidr_blocks" {
  description = "Optional CIDR blocks allowed to access SSH on port 22. Keep empty if using SSM only."
  type        = list(string)
  default     = []
}

variable "use_default_vpc" {
  description = "Use the default VPC for this lightweight lab project"
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "Optional subnet ID. Required only if not using default VPC/subnet discovery."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "Optional VPC ID. Required only if not using default VPC."
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 20
}

variable "jenkins_admin_username" {
  description = "Placeholder admin username note for documentation/bootstrap reference"
  type        = string
  default     = "admin"
}


variable "terraform_version" {
  description = "Terraform version to install on Jenkins host"
  type        = string
  default     = "1.8.5"
}