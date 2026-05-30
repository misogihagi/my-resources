variable "kube_config_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "/etc/rancher/k3s/k3s.yaml"
}

# --- headlamp ---

variable "headlamp_release_name" {
  description = "Helm release name for Headlamp"
  type        = string
  default     = "my-headlamp"
}

variable "headlamp_namespace" {
  description = "Kubernetes namespace for Headlamp"
  type        = string
  default     = "kube-system"
}

variable "headlamp_chart_version" {
  description = "Helm chart version for Headlamp"
  type        = string
  default     = "0.28.0"
}

# --- navidrome ---

variable "navidrome_release_name" {
  description = "Helm release name for Navidrome"
  type        = string
  default     = "my-navidrome"
}

variable "navidrome_namespace" {
  description = "Kubernetes namespace for Navidrome"
  type        = string
  default     = "navidrome"
}

variable "navidrome_chart_version" {
  description = "Helm chart version for Navidrome"
  type        = string
  default     = "6.8.3"
}

variable "navidrome_config_size" {
  description = "Storage size for the Navidrome config PVC"
  type        = string
  default     = "1Gi"
}

variable "navidrome_music_size" {
  description = "Storage size for the Navidrome music PVC"
  type        = string
  default     = "100Gi"
}

variable "navidrome_timezone" {
  description = "Timezone for Navidrome"
  type        = string
  default     = "Asia/Tokyo"
}

variable "navidrome_log_level" {
  description = "Log level for Navidrome"
  type        = string
  default     = "info"
}

variable "navidrome_ingress_enabled" {
  description = "Enable ingress for Navidrome"
  type        = bool
  default     = false
}

variable "navidrome_ingress_host" {
  description = "Hostname for the Navidrome ingress"
  type        = string
  default     = "navidrome.example.com"
}

# --- netbox ---

variable "netbox_release_name" {
  description = "Helm release name for Netbox"
  type        = string
  default     = "my-release"
}

variable "netbox_namespace" {
  description = "Kubernetes namespace for Netbox"
  type        = string
  default     = "netbox"
}

variable "netbox_chart_version" {
  description = "Helm chart version for Netbox"
  type        = string
  default     = "8.2.14"
}

# --- paperless-ngx ---

variable "paperless_ngx_release_name" {
  description = "Helm release name for Paperless-ngx"
  type        = string
  default     = "my-paperless-ngx"
}

variable "paperless_ngx_namespace" {
  description = "Kubernetes namespace for Paperless-ngx"
  type        = string
  default     = "paperless-ngx"
}

variable "paperless_ngx_chart_version" {
  description = "Helm chart version for Paperless-ngx"
  type        = string
  default     = "0.24.1"
}

variable "paperless_ngx_consume_size" {
  description = "Storage size for the Paperless-ngx consume PVC"
  type        = string
  default     = "4Gi"
}

variable "paperless_ngx_export_size" {
  description = "Storage size for the Paperless-ngx export PVC"
  type        = string
  default     = "1Gi"
}
