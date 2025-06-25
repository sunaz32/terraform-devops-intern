terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-dev-naziya"
    key    = "terraform-lock-dev-naziya"
    region = "ap-south-1"
  }
}