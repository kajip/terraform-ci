/** Terraform CIサブモジュールの呼出 */

module "terraform_ci" {
  source = "./terraform_ci"

  region = "${var.default_region}"
  github_location = "${var.github_location}"
}