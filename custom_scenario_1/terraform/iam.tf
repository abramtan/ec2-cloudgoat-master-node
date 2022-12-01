#IAM User
resource "aws_iam_user" "phisherman" {
  name = "cg-phisherman-${var.cgid}"
  tags = {
    deployment_profile = "${var.profile}"
  }
}

resource "aws_iam_access_key" "phisherman" {
  user = aws_iam_user.phisherman.name
}