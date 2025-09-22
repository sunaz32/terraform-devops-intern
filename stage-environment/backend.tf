terraform {
  backend "s3" {
    bucket         = "naz-terraform-state-stage"
    key            = "stage/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "stage-lock-table"
    encrypt        = true
  }
}

