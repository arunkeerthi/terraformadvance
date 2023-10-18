resource "aws_iam_user" "myiam" {
    count = length(var.iam_user)
    name = var.iam_user[count.index]
}