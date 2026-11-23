
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR range"
  type        = string
}

variable "app_bucket_name" {
  description = "Application storage bucket"
  type        = string
}

variable "secret_id" {
  description = "Secret Manager secret ID"
  type        = string
}

variable "kms_key_name" {
  description = "Optional KMS encryption key"
  type        = string
  default     = null
}
