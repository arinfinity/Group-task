terraform {
  backend "s3" {
    bucket = "kitchu1991"
    key    = "backend/terraform.tfstate"
    region = "ap-south-1"
  }
}