terraform {
  backend "s3" {
    bucket         = "naz-terraform-dev"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-dev-lock-table"
    encrypt        = true
  }
}

