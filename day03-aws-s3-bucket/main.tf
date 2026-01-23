terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.28"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

// create an S3 bucket

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "dmsubhajit-my-tf-test-bucket-demo-1234567890"

  tags = {
    Name        = "My bucket v2"
    Environment = "Dev"
  }
}