variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "my-grafana"
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  default     = "grafana"
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  type        = string
  default     = "10.5.15"
}
