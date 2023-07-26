data "aws_iam_policy_document" "policy" {
  statement {

    resources = [
      "arn:aws:s3:::blake-rollover-staging/*",
      "arn:aws:s3:::blake-rollover-staging",
      "arn:aws:s3:::blake-admin-staging/*",
      "arn:aws:s3:::blake-admin-staging",
    ]

    actions = ["s3:*"]
  }

  statement {
    resources = ["*"]
    actions   = ["ssm:DescribeParameters"]
  }

  statement {
    resources = ["arn:aws:ssm:ap-southeast-2:503293294884:parameter/apps/blake-admin/*"]

    actions = [
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameterHistory",
      "ssm:GetParameter",
    ]
  }
}
