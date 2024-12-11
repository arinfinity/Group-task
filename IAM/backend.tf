terraform {
  backend "s3" {
    bucket = "rajakshaya"
    key    = "backend/terraform.tfstate"
    region = "ap-south-1"
  }
}
