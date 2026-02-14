variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type    = string
}

variable "cluster_name" {
  type    = string
}

variable "public_subnet_cidrs" {
  type    = list(string)
}

variable "private_subnet_cidrs" {
  type    = list(string)
}