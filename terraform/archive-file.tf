locals {
  archive = {
    s3-bucket-upload = {
      source = "${path.module}/../api/s3-upload/upload.js"
      output = "${path.module}/asset/upload.zip"
    }
    s3-bucket-delete = {
      source = "${path.module}/../api/s3-upload/delete.js"
      output = "${path.module}/asset/delete.zip"
    }
  }

}

data "archive_file" "lambda_archive" {
  for_each    = local.archive
  type        = "zip"
  source_file = each.value.source
  output_path = each.value.output
}

output "lambda_archive" {
  value = data.archive_file.lambda_archive
}