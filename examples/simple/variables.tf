variable "region" {
  default     = "us-west-2"
}

variable "service_role_arn" {
  type        = string
  description = "(Required) The service role ARN that allows deployments."
}
