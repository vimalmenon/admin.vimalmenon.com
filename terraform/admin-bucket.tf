resource "aws_s3_bucket" "admin_bucket" {
  bucket = "admin.vimalmenon.com"
  tags = {
    Name        = "admin.vimalmenon.com"
    Environment = "Production"
  }
  force_destroy = true
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



data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.admin_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.admin_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

output "s3_bucket" {
  value = aws_s3_bucket.admin_bucket
}

output "s3_bucket_policy" {
  value = aws_s3_bucket_website_configuration.admin_bucket_website
}
output "bucket_policy" {
  value = data.aws_iam_policy_document.s3_bucket_policy.json
}