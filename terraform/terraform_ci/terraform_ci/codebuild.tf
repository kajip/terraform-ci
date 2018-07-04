/* Terraform CI用CodeBuild定義 */

resource "aws_codebuild_project" "terraform_ci" {
  name = "terraform-ci"
  description = "Terraform自動実行プロジェクト"
  service_role = "${module.role.arn}"

  "environment" {
    compute_type = "${var.compute_type}"
    type = "LINUX_CONTAINER"
    image = "${var.codebuild_image}"
  }

  "source" {
    type = "GITHUB"
    location = "${var.github_location}"
    auth {
      type = "OAUTH"
      resource = "${var.github_oauth_token}"
    }
    git_clone_depth = 1
  }

  "artifacts" {
    type = "NO_ARTIFACTS"
  }

  badge_enabled = true
}

resource "aws_codebuild_webhook" "terraform_ci" {
  project_name = "${aws_codebuild_project.terraform_ci.name}"
  branch_filter = "master"
}