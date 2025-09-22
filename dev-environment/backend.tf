terraform {
  backend "s3" {
    bucket         = "naz-terraform-state-dev"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dev-lock-table"
    encrypt        = true
  }
}

