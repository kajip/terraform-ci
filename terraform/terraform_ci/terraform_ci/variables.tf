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

variable "github_location" {
  description = "GitHubのクローンURL"
//  default = "https://github.com/biglobe-isp/elysium.git"
}
variable "github_oauth_token" {
  description = "GitHub用のOAuthトークン"
}