variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster, used for tagging subnets"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}