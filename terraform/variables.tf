variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type    = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "devops-assignment-eks" # הוספת השורה הזו פותרת את הבעיה
}

variable "public_subnet_cidrs" {
  type    = list(string)
}

variable "private_subnet_cidrs" {
  type    = list(string)
}