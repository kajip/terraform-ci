/* Elysium用CodeBuild定義 */

resource "aws_iam_role" "codebuild" {
  name = "codebuild-${var.name}"
  assume_role_policy = "${data.aws_iam_policy_document.codebuild.json}"
}
data "aws_iam_policy_document" "codebuild" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "codebuild.amazonaws.com"
      ]
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role_policy_attachment" "codebuild" {
  role = "${aws_iam_role.codebuild.name}"
  policy_arn = "${data.aws_iam_policy.codebuild.arn}"
}