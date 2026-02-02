terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.28"
    }
  }

  backend "s3" {
    bucket = "dmsubhajit-terraform-state-bucket-1234567890"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


variable "environment" {
    default = "dev"
    type = string
}

locals {
  env = var.environment
  bucket_name = "${var.environment}-dmsubhajit-my-tf-test-bucket-demo-1234567890"
  instance_name = "${var.environment}-EC2"
  vpc_name = "${var.environment}-VPC"
}

output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "ec2_id" {
    value = aws_instance.demo_instance.id
}
output "environment" {
    value = local.env
}

// create an S3 bucket

resource "aws_s3_bucket" "demo_bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = "${local.env}-bucket"
    Environment = local.env
  }
}

# aws vpc

resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = local.vpc_name
    Environment = local.env
  }
}

# aws ec2 instance

resource "aws_instance" "demo_instance" {
  ami           = "ami-0532be01f26a3de55"
  instance_type = "t3.micro"

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}
