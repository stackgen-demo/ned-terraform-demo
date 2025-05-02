module "stackgen_42593e1d-64a5-5f82-94d3-e1278a342207" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/stackgen_7a9ad7-function"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_448b96b3-953c-53d9-99ca-2252fb700b03" {
  source                = "./modules/aws_lambda"
  architecture          = "x86_64"
  authorization_type    = "NONE"
  cors                  = []
  create_function_url   = false
  description           = null
  environment_variables = {}
  event_source_arn      = null
  event_source_mapping  = []
  filename              = null
  function_name         = "stackgen_7a9ad7-function"
  handler               = "main.lambda_handler"
  image_uri             = null
  log_format            = null
  log_group_name        = "$${module.stackgen_42593e1d-64a5-5f82-94d3-e1278a342207.name}"
  memory_size           = 128
  role                  = "$${module.stackgen_8a0fc4de-e005-55cb-90aa-4f8d0f81c7ff.arn}"
  runtime               = "nodejs18.x"
  s3_bucket             = "lambda-artifacts-3599cfa2e052f4f9"
  s3_key                = "9eec123306115f41b5e706e087566fc0"
  s3_object_version     = null
  system_log_level      = null
  tags                  = {}
  timeout               = 3
}

module "stackgen_4c9a10de-a68d-4753-919e-b35d2e8e3a47" {
  source    = "./modules/aws_iam_role_policy"
  name      = "Writer-stackgen_e9607e"
  policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"CloudwatchLogGroup42593e1d64a55f8294d3e1278a3422070\",\n      \"Action\": [\n        \"logs:CreateLogGroup\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_42593e1d-64a5-5f82-94d3-e1278a342207.arn}\"\n      ]\n    },\n    {\n      \"Sid\": \"CloudwatchLogGroup42593e1d64a55f8294d3e1278a3422071\",\n      \"Action\": [\n        \"logs:CreateLogStream\",\n        \"logs:PutLogEvents\"\n      ],\n      \"Effect\": \"Allow\",\n      \"Resource\": [\n        \"$${module.stackgen_42593e1d-64a5-5f82-94d3-e1278a342207.arn}:*\"\n      ]\n    }\n  ]\n}"
  role      = "$${module.stackgen_8a0fc4de-e005-55cb-90aa-4f8d0f81c7ff.name}"
  role_type = "Writer"
}

module "stackgen_8a0fc4de-e005-55cb-90aa-4f8d0f81c7ff" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n\t\t\"Version\": \"2012-10-17\",\n\t\t\"Statement\":{\n\t\t\t\t\"Action\": \"sts:AssumeRole\",\n\t\t\t\t\"Effect\": \"Allow\",\n\t\t\t\t\"Principal\": {\n\t\t\t\t\t\"Service\": \"lambda.amazonaws.com\"\n\t\t\t\t}\n\t\t\t}\n\t}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "stackgen_7a9ad7-role"
  path                  = null
  permissions_boundary  = null
  tags                  = {}
}

