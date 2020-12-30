variable "create_app" {
  type        = bool
  description = "(Optional) Do you want to create Code deploy app"
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) The name of the application."
}

variable "compute_platform" {
  type        = string
  description = "(Optional) The compute platform can either be ECS, Lambda, or Server. Default is Server."
  default     = "Server"
}

variable "create_deployment_group" {
  type        = bool
  description = "(Optional) Do you want create codedeploy deployment group"
  default     = true
}

variable "app_name" {
  type        = string
  description = "(Optional) The name of the application."
  default     = ""
}
variable "deployment_group_name" {
  type        = string
  description = "(Required) The name of the deployment group."
}

variable "deployment_config_name" {
  type        = string
  description = "(Optional) The name of the group's deployment config. The default is `CodeDeployDefault.OneAtATime`."
  default     = "CodeDeployDefault.OneAtATime"
}

variable "service_role_arn" {
  type        = string
  description = "(Required) The service role ARN that allows deployments."
}

variable "autoscaling_groups" {
  type        = list(string)
  description = "(Optional) Autoscaling groups associated with the deployment group."
  default = [

  ]
}
variable "alarm_configuration" {
  type        = any
  description = "(Optional) Configuration block of alarms associated with the deployment group"
  default = {

  }
}

variable "auto_rollback_configuration" {
  type        = any
  description = "(Optional) Configuration block of the automatic rollback configuration associated with the deployment group"
  default = {

  }
}

variable "blue_green_deployment_config" {
  type        = any
  description = "(Optional) Configuration block of the blue/green deployment options for a deployment group"
  default = {

  }
}

