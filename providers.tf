provider "aws" {
    region = "${var.region}"
}
terraform {
    backend "s3" {
    bucket = "terraform-jenkins-2020"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
