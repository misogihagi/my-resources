variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "my-release"
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  default     = "netbox"
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  type        = string
  default     = "8.2.14" # Example version, can be adjusted
}

variable "kube_config_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "/etc/rancher/k3s/k3s.yaml"
}
