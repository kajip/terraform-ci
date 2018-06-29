/* Elysium用S3定義 */

data "aws_s3_bucket" "terraform" {
  bucket = "biglobe-isp-terraform-bucket"
}

resource "aws_s3_bucket_policy" "terraform" {
  bucket = "${data.aws_s3_bucket.terraform.bucket}"
  policy = "${data.aws_iam_policy_document.terraform_bucket_policy.json}"
}
data "aws_iam_policy_document" "terraform_bucket_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "${module.role.arn}"
      ]
    }
    actions = [
      "s3:PutObject",
      "s3:GetObjectVersion",
      "s3:GetObject"
    ]
    resources = [
      "${data.aws_s3_bucket.terraform.arn}/*"
    ]
  }
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "${module.role.arn}"
      ]
    }
    actions = [
      "s3:GetBucketVersioning"
    ]
    resources = [
      "${data.aws_s3_bucket.terraform.arn}"
    ]
  }
}
