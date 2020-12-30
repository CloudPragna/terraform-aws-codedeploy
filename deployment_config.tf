resource "aws_codedeploy_deployment_config" "this" {
  count = var.create_deployment_config ? 1 : 0

  deployment_config_name = var.deployment_config_name
  compute_platform       = var.compute_platform


  dynamic "minimum_healthy_hosts" {
    for_each = length(keys(var.minimum_healthy_hosts)) == 0 ? [] : [var.minimum_healthy_hosts]
    content {
      type  = lookup(minimum_healthy_hosts.value, "type")
      value = lookup(minimum_healthy_hosts.value, "value")
    }
  }

  dynamic "traffic_routing_config" {
    for_each = length(keys(var.traffic_routing_config)) == 0 ? [] : [var.traffic_routing_config]
    content {
      type = lookup(minimum_healthy_hosts.value, "type", null)

      dynamic "time_based_canary" {
        for_each = length(keys(lookup(traffic_routing_config.value, "time_based_canary", {}))) == 0 ? [] : [lookup(traffic_routing_config.value, "time_based_canary", {})]

        content {
          interval   = lookup(time_based_canary.value, "interval", null)
          percentage = lookup(time_based_canary.value, "percentage", null)
        }
      }

      dynamic "time_based_linear" {
        for_each = length(keys(lookup(traffic_routing_config.value, "time_based_linear", {}))) == 0 ? [] : [lookup(traffic_routing_config.value, "time_based_linear", {})]

        content {
          interval   = lookup(time_based_linear.value, "interval", null)
          percentage = lookup(time_based_linear.value, "percentage", null)
        }
      }
    }
  }
}
