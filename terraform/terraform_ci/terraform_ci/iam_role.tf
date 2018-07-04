/* Elysium用IAMロール定義 */

module "role" {
  source = "../module/codebuild_role"
  name = "terraform-ci"
}

// 管理者ポリシを追加
// TODO もう少し権限を絞ったほうが良いかも...
resource "aws_iam_role_policy_attachment" "administrator" {
  role = "${module.role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}