output "bucket_name" {
  description = "Name of the application storage bucket"
  value       = google_storage_bucket.app_bucket.name
}
