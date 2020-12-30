resource "aws_codedeploy_deployment_group" "this" {
  count = var.create_deployment_group ? 1 : 0

  app_name               = var.create_app ? aws_codedeploy_app.this[0].name : var.app_name
  deployment_group_name  = var.deployment_group_name
  deployment_config_name = var.create_deployment_config ? aws_codedeploy_deployment_config.this[0].id : var.deployment_config_name
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
      dynamic "deployment_ready_option" {
        for_each = length(keys(lookup(blue_green_deployment_config.value, "deployment_ready_option", {}))) == 0 ? [] : [lookup(blue_green_deployment_config.value, "deployment_ready_option", {})]

        content {
          action_on_timeout    = lookup(deployment_ready_option.value, "action_on_timeout", null)
          wait_time_in_minutes = lookup(deployment_ready_option.value, "wait_time_in_minutes", null)
        }
      }

      dynamic "green_fleet_provisioning_option" {
        for_each = length(keys(lookup(blue_green_deployment_config.value, "green_fleet_provisioning_option", {}))) == 0 ? [] : [lookup(blue_green_deployment_config.value, "green_fleet_provisioning_option", {})]

        content {
          action = lookup(green_fleet_provisioning_option.value, "action", null)
        }
      }

      dynamic "terminate_blue_instances_on_deployment_success" {
        for_each = length(keys(lookup(blue_green_deployment_config.value, "terminate_blue_instances_on_deployment_success", {}))) == 0 ? [] : [lookup(blue_green_deployment_config.value, "terminate_blue_instances_on_deployment_success", {})]

        content {
          action                           = lookup(terminate_blue_instances_on_deployment_success.value, "action", null)
          termination_wait_time_in_minutes = lookup(terminate_blue_instances_on_deployment_success.value, "termination_wait_time_in_minutes", null)
        }
      }

    }
  }

  # deployment_style
  # Only one deployment_style is allowed.
  dynamic "deployment_style" {
    for_each = length(keys(var.deployment_style)) == 0 ? [] : [var.deployment_style]
    content {
      deployment_option = lookup(deployment_style.value, "deployment_option", "WITHOUT_TRAFFIC_CONTROL")
      deployment_type   = lookup(deployment_style.value, "deployment_type", "IN_PLACE")
    }
  }
  dynamic "ec2_tag_filter" {
    for_each = var.ec2_tag_filter
    content {
      key   = lookup(ec2_tag_filter.value, "key", null)
      type  = lookup(ec2_tag_filter.value, "type", null)
      value = lookup(ec2_tag_filter.value, "value", null)
    }
  }
  # ecs_service
  dynamic "ecs_service" {
    for_each = var.ecs_service
    content {
      cluster_name = lookup(ecs_service.value, "cluster_name")
      service_name = lookup(ecs_service.value, "service_name")
    }
  }
  dynamic "load_balancer_info" {
    for_each = length(keys(var.load_balancer_info)) == 0 ? [] : [var.load_balancer_info]
    content {
      dynamic "elb_info" {
        for_each = length(keys(lookup(load_balancer_info.value, "elb_info", {}))) == 0 ? [] : [lookup(load_balancer_info.value, "elb_info", {})]

        content {
          name = lookup(elb_info.value, "name", null)
        }
      }

      dynamic "target_group_info" {
        for_each = length(keys(lookup(load_balancer_info.value, "target_group_info", {}))) == 0 ? [] : [lookup(load_balancer_info.value, "target_group_info", {})]

        content {
          name = lookup(target_group_info.value, "name", null)
        }
      }

      dynamic "target_group_pair_info" {
        for_each = length(keys(lookup(load_balancer_info.value, "target_group_pair_info", {}))) == 0 ? [] : [lookup(load_balancer_info.value, "target_group_pair_info", {})]

        content {

          dynamic "prod_traffic_route" {
            for_each = [lookup(target_group_pair_info.value, "prod_traffic_route")]

            content {
              listener_arns = lookup(prod_traffic_route.value, "listener_arns")
            }
          }

          dynamic "target_group" {
            for_each = [lookup(target_group_pair_info.value, "target_group")]

            content {
              name = lookup(target_group.value, "name")
            }
          }

          dynamic "test_traffic_route" {
            for_each = [lookup(target_group_pair_info.value, "test_traffic_route")]

            content {
              listener_arns = lookup(test_traffic_route.value, "listener_arns")
            }
          }


        }
      }

    }
  }

  dynamic "trigger_configuration" {
    for_each = var.ec2_tag_filter
    content {
      trigger_events     = lookup(trigger_configuration.value, "trigger_events")
      trigger_name       = lookup(trigger_configuration.value, "trigger_name")
      trigger_target_arn = lookup(trigger_configuration.value, "trigger_target_arn")
    }
  }
}
