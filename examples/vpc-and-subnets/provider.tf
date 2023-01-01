terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0, >= 3.83"
    }
  }
}

provider "google" {
  project     = "hostproject-372817"
  region      = "europe-west2"
  zone        = "europe-west2-c"
  credentials = "/home/dhanush/mukesh/hostproject-372817-e2b69c2d11db.json"
}