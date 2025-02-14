variable "image_id" {
  type        = string
  description = "centos-7"
  default     = "centos-7.9-202408071036.gitefba813a" 
}

variable "volume_size" {
  type        = number
  description = "Size of the volume in GB"
  default     = 10
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for VMs"
  default     = ["MS1", "GZ1", "ME1"]
}

variable "fixed_ips" {
  type        = list(string)
  description = "Fixed IPs for VMs"
  default     = ["192.168.250.101", "192.168.250.102", "192.168.250.103"]
}