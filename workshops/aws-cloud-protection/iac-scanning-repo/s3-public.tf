# Intentionally misconfigured — S3 bucket with public ACL
resource "aws_s3_bucket" "public_bucket" {
  bucket = "cortex-lab-public-bucket"
}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "public_bucket_versioning" {
  bucket = aws_s3_bucket.public_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}
