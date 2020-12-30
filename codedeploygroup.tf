resource "aws_codedeploy_deployment_group" "this" {
  count = var.create_deployment_group ? 1 : 0

  app_name               = var.create_app ? aws_codedeploy_app.this[0].name : var.app_name
  deployment_group_name  = var.deployment_group_name
  deployment_config_name = var.deployment_config_name
  service_role_arn       = var.service_role_arn
  autoscaling_groups     = var.autoscaling_groups

  # alarm_configuration
  # Only one alarm_configuration is allowed.
  dynamic "alarm_configuration" {
    for_each = length(keys(var.alarm_configuration)) == 0 ? [] : [var.alarm_configuration]
    content {
      alarms                    = lookup(alarm_configuration.value, "alarms", null)
      enabled                   = lookup(alarm_configuration.value, "enabled", null)
      ignore_poll_alarm_failure = lookup(alarm_configuration.value, "ignore_poll_alarm_failure", false)
    }
  }
  # auto_rollback_configuration
  # Only one auto_rollback_configuration is allowed.
  dynamic "auto_rollback_configuration" {
    for_each = length(keys(var.auto_rollback_configuration)) == 0 ? [] : [var.auto_rollback_configuration]
    content {
      enabled = lookup(auto_rollback_configuration.value, "enabled", null)
      events  = lookup(auto_rollback_configuration.value, "events", null)
    }

  }
  # blue_green_deployment_config 
  # Only one blue_green_deployment_config is allowed.
  dynamic "blue_green_deployment_config" {
    for_each = length(keys(var.blue_green_deployment_config)) == 0 ? [] : [var.blue_green_deployment_config]
    content {

    }
  }
}
