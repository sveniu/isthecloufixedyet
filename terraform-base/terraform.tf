provider "aws" {
  version = "3.0.0"
}

terraform {
  backend "s3" {}
}
