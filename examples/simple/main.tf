module "code_deploy" {
  source = "../../"
  name = "example"
  deployment_group_name = "example-deployment-group"
  service_role_arn = var.service_role_arn
  
}