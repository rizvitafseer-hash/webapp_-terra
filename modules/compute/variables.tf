
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "instance_name" {
  description = "Compute instance name"
  type        = string
}

variable "machine_type" {
  description = "GCP machine type"
  type        = string
  default     = "e2-micro"
}

variable "subnet_id" {
  description = "Subnet self link"
  type        = string
}

variable "service_account_email" {
  description = "VM service account email"
  type        = string
}
