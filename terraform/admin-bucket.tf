resource "aws_s3_bucket" "S3adminBucket" {
  bucket = "admin.vimalmenon.com"

  lifecycle {
    ignore_changes = [
      grant
    ]
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.S3adminBucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.S3adminBucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
