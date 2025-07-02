resource "aws_ecr_repository" "this" {
  name = var.app_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.app_name}-ecr"
  }
}
