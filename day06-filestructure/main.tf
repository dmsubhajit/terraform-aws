
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
