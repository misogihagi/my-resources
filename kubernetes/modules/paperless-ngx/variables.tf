variable "release_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "my-paperless-ngx"
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  default     = "paperless-ngx"
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  type        = string
  default     = "0.24.1"
}


variable "consume_size" {
  description = "Storage size for the consume PVC"
  type        = string
  default     = "4Gi"
}

variable "export_size" {
  description = "Storage size for the export PVC"
  type        = string
  default     = "1Gi"
}
