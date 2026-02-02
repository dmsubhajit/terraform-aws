  
  terraform {
    backend "s3" {
        bucket = "dmsubhajit-terraform-state-bucket-1234567890"
        key    = "dev/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
  }
  