data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = var.pythonFile
    output_path   = var.fileZip
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

resource "aws_lambda_function" "lambda_function" {
    depends_on       = [aws_iam_role.iam_for_lambda]
    filename         = var.fileZip
    function_name    = var.name_function
    role             = aws_iam_role.iam_for_lambda.arn
    handler          = var.handler
    runtime          = "python3.7"
}