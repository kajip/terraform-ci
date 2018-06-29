/* SSMパラメータストア定義 */

// GitHubのトークン
data "aws_ssm_parameter" "github_token" {
  name = "github.token"
}
