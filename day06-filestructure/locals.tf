locals {
  env = var.environment
  bucket_name = "${var.environment}-dmsubhajit-my-tf-test-bucket-demo-1234567890"
  instance_name = "${var.environment}-EC2"
  vpc_name = "${var.environment}-VPC"
}
