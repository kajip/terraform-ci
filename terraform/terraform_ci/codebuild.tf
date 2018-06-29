/* サブディレクトリ定義 */

module "terraform_image" {
  source = "./terraform_image"

  region = "${var.region}"
}

module "terraform_ci" {
  source = "./terraform_ci"
  codebuild_image = "${module.terraform_image.ecr_repository_url}:latest"
  github_location = "${var.github_location}"
  github_oauth_token = "${data.aws_ssm_parameter.github_token.value}"
}
