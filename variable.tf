variable "proxmox_endpoint" {
  type = string
  default = "https://my-proxmox-endpoint.local/"
}

variable "proxmox_username" {
  type = string
  default = "root@pam"
}

variable "proxmox_password" {
  type = string
  default = "my-proxmox-password"
}

variable "gateway" {
    type = string
    default = "192.168.254.254"
    description = "network gateway"
}

variable "controlplane_ips" {
    type = list(string)
    default = [
        "192.168.254.101"
    ]
}

variable "worker_ips" {
    type = list(string)
    default = [
        "192.168.254.102",
        "192.168.254.103"
    ]
}

variable "nfs_ips" {
    type = list(string)
    default = [
        "192.168.254.105",
    ]
}

variable "controlplane_count" {
    type = number
    default = 1
}

variable "worker_count" {
  type = number
  default = 2
}

variable "network_range" {
    type = string
    default = "24"
}

variable "vm_user" {
    type = string
    default = "ubuntu"
}