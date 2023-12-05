# localstack-apigateway-integration-bug

API Gateway + OpenAPI with Integration doesn't respect integration `httpMethod`

```bash
# Fetched from terraform.tfstate
INGEST_URL=$(cat terraform.tfstate | jq .outputs.local_url.value --raw-output)
```

POST endpoint

```bash
curl -XPOST --location $INGEST_URL \
--header 'Content-Type: application/json' \
--data '{"hello": "world"}'
```

Output:

```
{"FailedEntryCount": 0, "Entries": [{"EventId": "be00e00c-f93f-45f2-84e9-90a431329de0"}]}
```

DELETE endpoint

```bash
curl -XDELETE --location $INGEST_URL \
--header 'Content-Type: application/json' \
--data '{"hello": "world"}'
```

Output:

```
{"Type": "User", "message": "Error invoking integration for API Gateway ID 'uhy3xhv50s': API Gateway integration type \"AWS\", method \"DELETE\", URI \"arn:aws:apigateway:ap-southeast-2:events:action/PutEvents\" not yet implemented", "__type": "InvalidRequest"}%
```