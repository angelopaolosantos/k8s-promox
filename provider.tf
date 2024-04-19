terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.53.1"
    }
    ansible = {
      source = "ansible/ansible"
      version = "1.2.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  # or remove the line, and use PROXMOX_VE_USERNAME environment variable
  username = var.proxmox_username
  # or remove the line, and use PROXMOX_VE_PASSWORD environment variable
  password = var.proxmox_password
  # because self-signed TLS certificate is in use
  insecure = false
  # uncomment (unless on Windows...)
  # tmp_dir  = "/var/tmp"

  ssh {
    agent = true
    # TODO: uncomment and configure if using api_token instead of password
    # username = "root"
  }
}

provider "ansible" {
  # Configuration options
}