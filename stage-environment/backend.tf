terraform {
  backend "s3" {
    bucket         = "naz-terraform-stage2"
    key            = "stage/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-stage-lock-table"
    encrypt        = true
  }
}

