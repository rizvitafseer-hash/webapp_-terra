
# Default deny ingress
resource "google_compute_firewall" "deny_ingress" {
  name      = "${var.network_name}-deny-ingress"
  network   = google_compute_network.vpc.name
  direction = "INGRESS"
  priority  = 65534

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow internal traffic
resource "google_compute_firewall" "allow_internal" {
  name      = "${var.network_name}-allow-internal"
  network   = google_compute_network.vpc.name
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "udp"
    ports    = ["53", "123"]
  }

  source_ranges = [var.subnet_cidr]
}

# IAP SSH only
resource "google_compute_firewall" "allow_iap_ssh" {
  name      = "${var.network_name}-iap-ssh"
  network   = google_compute_network.vpc.name
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-ssh"]
}

# Public HTTP for Apache
resource "google_compute_firewall" "allow_http" {
  name      = "${var.network_name}-allow-http"
  network   = google_compute_network.vpc.name
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["apache-webserver"]
}
