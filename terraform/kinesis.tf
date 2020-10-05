# data stream
resource "aws_kinesis_stream" "data_stream" {
  name             = var.name_stream
  shard_count      = var.shard_count
}

# firehose
resource "aws_iam_role" "firehose_role" {
  depends_on = [aws_s3_bucket.bucket]
  name = "firehose_test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_kinesis_firehose_delivery_stream" "firehose_s3" {
  depends_on = [aws_s3_bucket.bucket]
  name        = var.name_firehose
  destination = var.destination

  s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.bucket.arn
  }
}