terraform {
  backend "s3" {
    bucket = "pythonbackendappbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    }
  }

