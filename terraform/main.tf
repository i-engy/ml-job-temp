resource "aws_sagemaker_code_repository" "ml-job" {
  code_repository_name = "ml-source-code"

  git_config {
    repository_url = "https://github.com/i-engy/ml-job-temp.git"
  }
}


resource "aws_sagemaker_notebook_instance" "default" {
  name                    = var.sagemaker_notebook_name
  instance_type           = "ml.t2.medium"
  platform_identifier     = "notebook-al2-v1"
  volume_size             = 10
  role_arn                = "arn:aws:iam::909172569716:role/sm_notebook_role"
  default_code_repository = aws_sagemaker_code_repository.ml-job.code_repository_name
}
