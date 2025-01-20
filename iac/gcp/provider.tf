terraform {
  required_providers {
      google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project     = "my-project-id"
  region      = "us-central1"
}
