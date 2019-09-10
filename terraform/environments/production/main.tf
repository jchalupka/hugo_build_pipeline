provider "aws" {
  region = "us-east-1"
}

module "build" {
  source = "../../modules/static_site_pipeline"

  aws_region = "us-east-1"

  namespace = "build-pipeline"
  stage     = "production"
  name      = "build-pipeline"

  # Enable the pipeline creation
  enabled = true

  # Application repository on GitHub
  github_oauth_token = "123"
  repo_owner         = "jchalupka"
  repo_name          = "hugo_build_pipeline"
  branch             = "master"

  # http://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref.html
  # http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html
  build_image        = "aws/codebuild/standard:2.0"
  build_compute_type = "BUILD_GENERAL1_SMALL"

}
