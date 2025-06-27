terraform {
  backend "s3" {
    bucket = "naziya-stage-bucket"
    key    = "stage/terraform.tfstate"
    region = "ap-south-1"
  }
}
