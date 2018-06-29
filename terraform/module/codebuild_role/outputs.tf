/** 出力定義 */

output "name" {
  value = "${aws_iam_role.codebuild.name}"
}

output "arn" {
  value = "${aws_iam_role.codebuild.arn}"
}