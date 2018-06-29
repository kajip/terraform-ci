/* CodeBuild用ロールのデフォルトポリシー定義 */

data "aws_iam_policy" "codebuild" {
  arn = "arn:aws:iam::529165812037:policy/codebuild-base-policy"
}
