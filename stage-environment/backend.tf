terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-stage-naziya"
    key            = "stage/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "naz-stage-terraform-locks"
    encrypt        = true
  }
}

