# Bucket for Terraform remote backend.
resource "aws_s3_bucket" "terraform_remote_backend" {
  bucket = "${local.s3_bucket_prefix}-tfstate-testcases"
  acl    = "private"

  versioning {
    enabled = true
  }
}
