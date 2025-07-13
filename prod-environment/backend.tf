terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-prod-naziya"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-prod-terraform-locks"
    encrypt        = true
  }
}