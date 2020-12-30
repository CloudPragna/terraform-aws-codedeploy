# codedeploy_app
output "app_id" {
  description = "Amazon's assigned ID for the application."
  value       = join("", aws_codedeploy_app.this.*.id)
}

output "app_name" {
  description = "The application's name."
  value       = join("", aws_codedeploy_app.this.*.name)
}

# deployment_config

output "deployment_config_name" {
  description = "The deployment group's config name."
  value       = join("", aws_codedeploy_deployment_config.this.*.id)
}

output "deployment_config_id" {
  description = "The AWS Assigned deployment config id"
  value       = join("", aws_codedeploy_deployment_config.this.*.deployment_config_id)
}


# deployment_group

output "deployment_group_id" {
  description = "Application name and deployment group name."
  value       = join("", aws_codedeploy_deployment_group.this.*.id)
}