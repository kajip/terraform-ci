/* Elysium用S3定義 */

data "aws_s3_bucket" "codebuild" {
  bucket = "${var.s3_bucket}"
}

resource "aws_s3_bucket_policy" "codebuild" {
  bucket = "${var.s3_bucket}"
  policy = "${data.aws_iam_policy_document.codebuild_bucket_policy.json}"
}
data "aws_iam_policy_document" "codebuild_bucket_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "${var.codebuild_role_arns}",

        // Jenkinsクラスタからのアクセスを許可
        "${data.aws_iam_role.jenkins_master.arn}"

      ]
    }
    actions = [
      "s3:PutObject",
      "s3:GetObjectVersion",
      "s3:GetObject"
    ]
    resources = [
      "${data.aws_s3_bucket.codebuild.arn}/*"
    ]
  }
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "${var.codebuild_role_arns}",

        // Jenkinsクラスタからのアクセスを許可
        "${data.aws_iam_role.jenkins_master.arn}"
      ]
    }
    actions = [
      "s3:GetBucketVersioning"
    ]
    resources = [
      "${data.aws_s3_bucket.codebuild.arn}"
    ]
  }
}
