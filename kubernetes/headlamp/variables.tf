variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "my-headlamp"
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  default     = "kube-system"
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  type        = string
  default     = "0.28.0" # Example version, can be adjusted
}

