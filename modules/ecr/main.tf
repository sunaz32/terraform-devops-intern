resource "aws_ecr_repository" "this" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
}
output "repository_url" {
  value = aws_ecr_repository.this.repository_url
}