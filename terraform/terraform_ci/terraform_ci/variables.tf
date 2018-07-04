/* 変数定義 */

variable "name" {
  description = "プロジェクト名"
  default = "terraform_ci"
}
variable "description" {
  description = "プロジェクト概要"
  default = "TerraformによるAWS環境の自動構築"
}

variable "compute_type" {
  description = "CodeBuildの実行環境タイプ"
  default = "BUILD_GENERAL1_SMALL"
}
variable "codebuild_image" {
  description = "ビルド用のDockerイメージ"
}

variable "terraform_s3_bucket" {
  description = "Terraformのstatusファイルを保存するS3バケット名"
}

variable "github_location" {
  description = "GitHubのクローンURL"
}
variable "github_oauth_token" {
  description = "GitHub用のOAuthトークン"
}
