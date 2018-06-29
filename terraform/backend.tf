/** Remote Backendsの定義 */

terraform {
  backend "s3" {
    bucket = "kajip-terraform-bucket"
    key    = "terraform-ci/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
