terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "interview-1-terraform-1"
    key            = "devops-assignment/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}