output "local_url" {
  value = "http://${aws_api_gateway_rest_api.main.id}.execute-api.localhost.localstack.cloud:4566/v1"
}