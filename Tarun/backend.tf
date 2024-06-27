terraform {
  backend "s3" {
    bucket = "tarunkumar07"
    key    = "backend2/terraform.tfstate"
    region = "ap-south-1"
  }
}