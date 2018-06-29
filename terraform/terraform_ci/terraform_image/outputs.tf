/** 出力定義 */

output "ecr_repository_url" {
  value = "${aws_ecr_repository.terraform.repository_url}"
}