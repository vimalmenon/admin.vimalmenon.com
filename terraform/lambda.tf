locals {
  apis = [
    {
      source        = "${path.module}/../api/s3-upload/upload.js"
      output        = "${path.module}/asset/upload.zip"
      function_name = "s3-upload"
      handler       = "upload.handler"
    },
    {
      source        = "${path.module}/../api/s3-upload/delete.js"
      output        = "${path.module}/asset/delete.zip"
      function_name = "s3-delete"
      handler       = "delete.handler"
    }
  ]
}
data "archive_file" "upload" {
  count       = length(local.apis)
  type        = "zip"
  source_file = local.apis[count.index].source
  output_path = local.apis[count.index].output
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  count         = length(local.apis)
  filename      = local.apis[count.index].output
  function_name = local.apis[count.index].function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = local.apis[count.index].handler

  source_code_hash = filebase64sha256(local.apis[count.index].output)

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

output "zip_file" {
  value = data.archive_file.upload
}

output "local_values" {
  value = local.apis
}