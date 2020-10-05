# lambda
variable "name_function" {
    type = "string"
    description = "lambda function name"
}

variable "fileZip" {
    type = "string"
    description = "zip file"
}

variable "handler" {
    type = "string"
    description = "call function"
}

variable "pythonFile" {
    type = "string"
    description = "call function"
}

# cloudwatch
variable "name_cloudw" {
    type = "string"
    description = "lambda function name"
}

variable "schedule" {
    type = "string"
    description = "cron"
}

variable "is_enabled" {
    type = "string"
    description = "state"
    default = "false"
}

# kinesis data stream
variable "name_stream" {
    type = "string"
    description = "kinesis data stream"
}

variable "shard_count" {
    type = number
    description = "shard count"
    default = 1
}

# kinesis firehose
variable "name_firehose" {
    type = "string"
    description = "kinesis firehose"
}

variable "destination" {
    type = "string"
    description = "data destination"
}

# s3
variable "bucket" {
    type = "string"
    description = "bucket name"
}

variable "acl" {
    type = "string"
    description = "public or private permission"
}