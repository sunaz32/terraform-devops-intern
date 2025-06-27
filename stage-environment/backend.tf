terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket-name"
    key            = "stage/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-stage-terraform-locks"
    encrypt        = true
  }
}

