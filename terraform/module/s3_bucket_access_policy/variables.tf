/** 変数定義 */

variable "s3_bucket" {
  description = "S3バケット名"
}

variable "codebuild_role_arns" {
  type = "list"
  description = "S3バケットアクセスを許可するサービスロールのARN一覧"
  default = []
}
