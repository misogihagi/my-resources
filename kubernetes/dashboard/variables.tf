variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "kubernetes-dashboard"
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  default     = "kubernetes-dashboard"
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  type        = string
  default     = "7.10.4" # Latest version as of now, can be adjusted
}

variable "kube_config_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "/etc/rancher/k3s/k3s.yaml"
}
