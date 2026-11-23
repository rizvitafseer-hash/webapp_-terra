
variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "project-3d116623-b2e3-4d71-83e"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "app_bucket_name" {
  description = "Application GCS bucket name"
  type        = string
}
