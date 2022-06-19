locals {
  lambda = {
    s3-bucket-upload = {
      function_name = "s3-bucket-upload"
      archive_file  = "s3-bucket-upload"
      handler       = "upload.handler"
    }
    s3-bucket-delete = {
      function_name = "s3-bucket-delete"
      archive_file  = "s3-bucket-delete"
      handler       = "delete.handler"
    }
  }
}

resource "aws_lambda_function" "lambda" {
  for_each      = local.lambda
  filename      = data.archive_file.lambda_archive[each.value.archive_file].output_path
  function_name = each.value.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = each.value.handler

  source_code_hash = filebase64sha256(data.archive_file.lambda_archive[each.value.archive_file].output_path)

  runtime = "nodejs16.x"

  #   environment {
  #     variables = {
  #       foo = "bar"
  #     }
  #   }
}
