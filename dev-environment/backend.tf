terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-dev-naziya"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-dev-terraform-locks"
    encrypt        = true
  }
}

