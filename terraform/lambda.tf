locals {
  apis = [
    {
      source        = "${path.module}/../api/s3-upload/upload.js"
      output        = "${path.module}/asset/upload.zip"
      function_name = "s3-upload"
      handler       = "upload.handler"
      method        = "PUT"
      url           = "s3-bucket"
    },
    {
      source        = "${path.module}/../api/s3-upload/delete.js"
      output        = "${path.module}/asset/delete.zip"
      function_name = "s3-delete"
      handler       = "delete.handler"
      method        = "DELETE"
      url           = "s3-bucket"
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

resource "aws_lambda_function" "lambda" {
  count         = length(local.apis)
  filename      = local.apis[count.index].output
  function_name = local.apis[count.index].function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = local.apis[count.index].handler

  source_code_hash = filebase64sha256(local.apis[count.index].output)

  runtime = "nodejs16.x"

  #   environment {
  #     variables = {
  #       foo = "bar"
  #     }
  #   }
}

resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "vimalmenon.com"
  description = "This is api's for VimalMenon.com"
}

resource "aws_api_gateway_resource" "api_resource" {
  count       = length(local.apis)
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = local.apis[count.index].url
}

resource "aws_api_gateway_method" "MyDemoMethod" {
  count         = length(aws_api_gateway_resource.api_resource)
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.api_resource[count.index].id
  http_method   = local.apis[count.index].method
  authorization = "NONE"
}

output "zip_file" {
  value = data.archive_file.upload
}

output "local_values" {
  value = local.apis
}

output "lamda_methods" {
  value = aws_lambda_function.lambda
}

output "api_geteway_resource" {
  value = aws_api_gateway_resource.api_resource
}

output "api_gateway_methods" {
  value = aws_api_gateway_method.MyDemoMethod
}