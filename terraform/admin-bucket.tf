resource "aws_s3_bucket" "admin_bucket" {
  bucket = "admin.vimalmenon.com"
  tags = {
    Name        = "admin.vimalmenon.com"
    Environment = "Production"
  }
  lifecycle {
    ignore_changes = [
      website
    ]
  }
}

resource "aws_s3_bucket_acl" "admin_bucket_acl" {
  bucket = aws_s3_bucket.admin_bucket.id
  acl    = "public-read"

}

resource "aws_s3_bucket_versioning" "admin_bucket_version" {
  bucket = aws_s3_bucket.admin_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "admin_bucket_website" {
  bucket = aws_s3_bucket.admin_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

output "Admin_S3_Bucket" {
  value = aws_s3_bucket.admin_bucket.bucket
}