resource "aws_codedeploy_app" "this" {
  count            = var.create_app ? 1 : 0
  compute_platform = var.compute_platform
  name             = var.name
}
