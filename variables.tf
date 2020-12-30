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


variable "deployment_style" {
  type        = any
  description = "(Optional) Configuration block of the type of deployment, either in-place or blue/green, you want to run and whether to route deployment traffic behind a load balancer"
  default = {

  }
}

variable "ec2_tag_filter" {
  type        = any
  description = "(Optional) Tag filters associated with the deployment group."
  default = [

  ]
}

variable "ecs_service" {
  type        = any
  description = "(Optional) Configuration block(s) of the ECS services for a deployment group"
  default = [

  ]
}

variable "load_balancer_info" {
  type        = any
  description = "(Optional) Single configuration block of the load balancer to use in a blue/green deployment"
  default = {

  }
}

variable "trigger_configuration" {
  type        = any
  description = "(Optional) Configuration block(s) of the triggers for the deployment group"
  default = [

  ]
}

########### aws_codedeploy_deployment_config

variable "create_deployment_config" {
  tybe        = bool
  description = "(Optional) Do you want to create deployment config"
  default     = true
}

variable "minimum_healthy_hosts" {
  type        = any
  description = "(Optional) A minimum_healthy_hosts block. Required for Server compute platform."
  default = [

  ]
}

variable "traffic_routing_config" {
  type        = any
  description = "(Optional) A traffic_routing_config block."
  default = [

  ]
}
