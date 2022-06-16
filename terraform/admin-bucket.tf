resource "aws_s3_bucket" "admin_bucket" {
  bucket = "admin.vimalmenon.com"

  lifecycle {
    ignore_changes = [
      grant
    ]
  }
}

resource "aws_s3_bucket_acl" "admin_bucket_acl" {
  bucket = aws_s3_bucket.admin_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "admin_bucket_version" {
  bucket = aws_s3_bucket.admin_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "Admin_S3_Bucket" {
  value = aws_s3_bucket.admin_bucket
}