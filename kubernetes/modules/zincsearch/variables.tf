variable "release_name" {
  description = "The name of the ZincSearch deployment"
  type        = string
  default     = "my-zincsearch"
}

variable "namespace" {
  description = "The namespace to install ZincSearch into"
  type        = string
  default     = "zincsearch"
}

variable "image_tag" {
  description = "Docker image tag for ZincSearch"
  type        = string
  default     = "latest"
}

variable "admin_user" {
  description = "Initial admin username for ZincSearch"
  type        = string
  default     = "admin"
}

variable "admin_password" {
  description = "Initial admin password for ZincSearch"
  type        = string
  sensitive   = true
}

variable "data_size" {
  description = "Storage size for ZincSearch data PVC"
  type        = string
  default     = "10Gi"
}

variable "service_type" {
  description = "Kubernetes service type for ZincSearch"
  type        = string
  default     = "ClusterIP"
}

variable "resource_requests_cpu" {
  description = "CPU request for ZincSearch"
  type        = string
  default     = "100m"
}

variable "resource_requests_memory" {
  description = "Memory request for ZincSearch"
  type        = string
  default     = "128Mi"
}

variable "resource_limits_cpu" {
  description = "CPU limit for ZincSearch"
  type        = string
  default     = "500m"
}

variable "resource_limits_memory" {
  description = "Memory limit for ZincSearch"
  type        = string
  default     = "512Mi"
}
