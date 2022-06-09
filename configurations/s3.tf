## aws_s3_bucket

resource "aws_s3_bucket" "s3-bucket" {
    bucket = "locals.s3_bucket_name"
    acl = "private"
    force_destroy = true

    policy = <<POLICY
    {
        'Version":"2012-10-17",
        "Statement":[
            {
        {
            "Effect" : "Allow",
            "Principal":{
                "service":"delivery.logs.amazonaws.com"
            },
            "Action":"s3:PutObject",
            "Resource":"arn:aws:s3:::${local.s3_bucket_name}/alb-logs/*"
            "Condition":{
                "StringEquals":{
                    "s3:x-amz-acl":"bucket-owner-full-control"
                }
            }
        },
        {
            "Effect":"Allow".
            "Principal"{
                "Service":"delivery.logs.amazonaws.com"
            },
            "Actions":"s3:GetBucketAcl",
            "Resource":"arn:aws:s3:::${local.s3_bucket_name}/alb-logs/*"
        }
    }
        ]
    }
    POLICY
}


## aws_s3_bucket_object

## aws_iam_role

resource "aws_iam_role" "allow_nginix_s3" {
  name = "allow_nginix_s3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}


## aws_iam_role_policy

## aws_iam_instance_profile