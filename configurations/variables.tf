# variable "access_key" {
#     type = string
#     description = "AWS account access key"
# }

# variable "secret_key" {
#     type = string
#     description = "AWS account secret key"
# }

variable "aws_region" {
    type = string
    description = "AWS region"
    default = "us-east-1"
}