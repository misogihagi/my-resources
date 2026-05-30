variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "my-navidrome"
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  default     = "navidrome"
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  type        = string
  default     = "6.8.3"
}


variable "config_size" {
  description = "Storage size for the Navidrome config/data PVC"
  type        = string
  default     = "1Gi"
}

variable "music_size" {
  description = "Storage size for the music library PVC"
  type        = string
  default     = "100Gi"
}

variable "timezone" {
  description = "Timezone for the Navidrome container"
  type        = string
  default     = "Asia/Tokyo"
}

variable "log_level" {
  description = "Log level for Navidrome (debug, info, warn, error)"
  type        = string
  default     = "info"
}

variable "ingress_enabled" {
  description = "Enable ingress for Navidrome"
  type        = bool
  default     = false
}

variable "ingress_host" {
  description = "Hostname for the Navidrome ingress (required if ingress_enabled = true)"
  type        = string
  default     = "navidrome.example.com"
}
