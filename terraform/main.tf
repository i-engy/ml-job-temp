resource "aws_sagemaker_code_repository" "example" {
  code_repository_name = "ml-source-code"

  git_config {
    repository_url = "https://github.com/tanujjain/deploy-ml-model.git"
  }
}


resource "aws_sagemaker_notebook_instance" "default" {
  name          = var.sagemaker_notebook_name
  role_arn      = var.aws_iam_role
  instance_type = "ml.t2.medium"
}
