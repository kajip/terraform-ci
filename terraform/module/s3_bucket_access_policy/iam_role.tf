/* IAMロール定義 */

// Jenkinsクラスタのインスタンスロール
data "aws_iam_role" "jenkins_master" {
  name = "jenkins-master-instance-profile-role"
}
data "aws_iam_role" "jenkins_slave" {
  name = "jenkins-slave-instance-profile-role"
}
