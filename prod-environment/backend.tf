terraform {
  backend "s3" {
    bucket         = "naz-terraform-state-prod"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "prod-lock-table"
    encrypt        = true
  }
}