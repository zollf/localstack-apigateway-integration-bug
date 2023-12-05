resource "aws_api_gateway_rest_api" "main" {
  name = "TestApiGateway"

  body = jsonencode({
    openapi = "3.0.3"
    info = {
      title = "Test"
      version = "v1.0"
    }
    paths = {
      "/" = {
        post = {
          summary = "POST Test"
          description = "POST Test"
          "x-amazon-apigateway-integration" = {
            httpMethod           = "POST"
            type                 = "aws"
            passthroughBehaviour = "WHEN_NO_TEMPLATES"
            uri                  = "arn:aws:apigateway:${local.region}:events:action/PutEvents"
            requestTemplates     = {
              "application/json" = <<-EOT
                #set($context.requestOverride.header.X-Amz-Target = "AWSEvents.PutEvents")
                #set($context.requestOverride.header.Content-Type = "application/x-amz-json-1.1")
                #set($detail = $util.escapeJavaScript($input.json('$')).replaceAll("\\'","'"))
                {
                  "Entries": [
                    {
                      "Detail": "$detail",
                      "DetailType": "DetailType",
                      "EventBusName": "${aws_cloudwatch_event_bus.main.name}",
                      "Source": "test"
                    }
                  ]
                }
              EOT
            }
          }
          responses = {
            "200" = {
              description = "Success"
              content = {}
            }
          }
        }
        delete = {
          summary = "DELETE Test"
          description = "DELETE Test"
          "x-amazon-apigateway-integration" = {
            httpMethod           = "POST"
            type                 = "aws"
            passthroughBehaviour = "WHEN_NO_TEMPLATES"
            uri                  = "arn:aws:apigateway:${local.region}:events:action/PutEvents"
            requestTemplates     = {
              "application/json" = <<-EOT
                #set($context.requestOverride.header.X-Amz-Target = "AWSEvents.PutEvents")
                #set($context.requestOverride.header.Content-Type = "application/x-amz-json-1.1")
                #set($detail = $util.escapeJavaScript($input.json('$')).replaceAll("\\'","'"))
                {
                  "Entries": [
                    {
                      "Detail": "$detail",
                      "DetailType": "DetailType",
                      "EventBusName": "${aws_cloudwatch_event_bus.main.name}",
                      "Source": "test"
                    }
                  ]
                }
              EOT
            }
          }
          responses = {
            "200" = {
              description = "Success"
              content = {}
            }
          }
        }
      }
    }
  })
}
