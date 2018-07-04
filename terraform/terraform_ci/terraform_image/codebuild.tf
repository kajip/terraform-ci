/* CodeBuild定義 */

resource "aws_codebuild_project" "terraform_image" {
  name = "${var.name}"
  description = "${var.description}"
  service_role = "${module.role.arn}"

  "environment" {
    compute_type = "${var.compute_type}"
    type = "LINUX_CONTAINER"
    image = "${var.codebuild_image}"
    privileged_mode = true

    environment_variable {
      name = "AWS_DEFAULT_REGION"
      value = "${var.region}"
    }
    environment_variable {
      name = "ECR_REPOSITORY_URL"
      value = "${aws_ecr_repository.terraform.repository_url}"
    }
    environment_variable {
      name = "IMAGE_TAG"
      value = "latest"
    }
  }

  "source" {
    type = "GITHUB"
    location = "${var.github_location}"
    git_clone_depth = 1
  }

  "artifacts" {
    type = "NO_ARTIFACTS"
  }
}
