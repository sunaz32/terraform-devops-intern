terraform {
  backend "s3" {
    bucket         = "naz-terraform-prod2"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-prod-lock-table"
    encrypt        = true
  }
}