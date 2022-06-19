locals {
  main_routes = {
    api = {
      path = "api"
    }
  }
  second_routes = {
    admin = {
      path   = "admin",
      parent = "api"
    }
  }
  third_routes = {
    s3_bucket = {
      path   = "s3-bucket"
      parent = "admin"
    }
  }
  apis = [
    {
      method          = "PUT"
      url             = "s3-bucket"
      parent_resource = "third_routes"
    },
    {
      method          = "DELETE"
      url             = "s3-bucket"
      parent_resource = "third_routes"
    }
  ]
}


resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "vimalmenon.com"
  description = "API for VimalMenon.com"
}

resource "aws_api_gateway_resource" "main_api_resource" {
  for_each    = local.main_routes
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = each.value.path
}

resource "aws_api_gateway_resource" "second_api_resource" {
  for_each    = local.second_routes
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_resource.main_api_resource[each.value.parent].id
  path_part   = each.value.path
}

resource "aws_api_gateway_resource" "third_api_resource" {
  for_each    = local.third_routes
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_resource.second_api_resource[each.value.parent].id
  path_part   = each.value.path
}

resource "aws_api_gateway_method" "MyDemoMethod" {
  count         = length(local.apis)
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.third_api_resource["s3_bucket"].id
  http_method   = local.apis[count.index].method
  authorization = "NONE"
}

# resource "aws_api_gateway_integration" "integration" {
#   rest_api_id             = aws_api_gateway_rest_api.api_gateway.id
#   resource_id             = aws_api_gateway_resource.resource.id
#   http_method             = aws_api_gateway_method.method.http_method
#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.lambda.invoke_arn
# }


output "api_resource_main" {
  value = aws_api_gateway_resource.main_api_resource
}

output "api_resource_second" {
  value = aws_api_gateway_resource.second_api_resource
}

output "api_resource_third" {
  value = aws_api_gateway_resource.third_api_resource
}
