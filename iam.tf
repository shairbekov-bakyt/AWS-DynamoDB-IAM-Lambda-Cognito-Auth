resource "aws_iam_role" "lambdaRole" {
  name = "lambdaUser"
  assume_role_policy = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  }
}

resource "aws_iam_policy" "iam_policy_for_lambdaRole" {
  name = "aws_iam_policy_for_lambdaRole_with_Terraform"
  description = "AWS IAM Policy for managing aws lambda role"
  path = "/"
  policy = {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "CreateLogGroup",
            ]
            "Resource": "arn:aws:logs:*:*:*",
            "Effect": "Allow"
        }
    ]
}
}