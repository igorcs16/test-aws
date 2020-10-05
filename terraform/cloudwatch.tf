resource "aws_cloudwatch_event_rule" "trigger_lambda" {
    depends_on = [aws_lambda_function.lambda_function]
    name = var.name_cloudw
    schedule_expression = var.schedule
    is_enabled = var.is_enabled
}

resource "aws_cloudwatch_event_target" "target_function" {
    depends_on = [aws_lambda_function.lambda_function]
    rule = aws_cloudwatch_event_rule.trigger_lambda.name
    arn = aws_lambda_function.lambda_function.arn
}