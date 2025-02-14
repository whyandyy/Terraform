terraform {
  required_providers {
    vkcs = {
      source = "vk-cs/vkcs"
      version = "0.9.2"
    }
  }
}
provider "vkcs" {
  username  = "fedorovaa21@st.ithub.ru"
  password  = "FedorovAndrey4IB2"
  project_id = "ac59ff807de449719b9ed55351d1dee2"
  region    = "RegionOne"
  auth_url  = "https://infra.mail.ru:35357/v3/"
}

data "vkcs_images_image" "centos-7" {
  name = var.image_id
}

resource "vkcs_networking_network" "network" {
  name = "ITHUBterraformnetwork-Fedorov-An"
}

resource "vkcs_networking_subnet" "subnet" {
  name       = "ITHUBterraformsubnet-Fedorov-An"
  network_id = vkcs_networking_network.network.id
  cidr       = "192.168.250.0/24"
}

resource "vkcs_networking_router" "router" {
  name                 = "ITHUBterraformrouter-Fedorov-An"
}

resource "vkcs_networking_router_interface" "router_interface" {
  router_id  = vkcs_networking_router.router.id
  subnet_id  = vkcs_networking_subnet.subnet.id
}

resource "vkcs_networking_secgroup" "security_group" {
  name        = "security_group-Fedorov-An"
  description = "terraform security group"
}

resource "vkcs_networking_secgroup_rule" "ssh" {
  direction         = "ingress"
  port_range_max   = 22
  port_range_min   = 22
  protocol         = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.security_group.id
  description      = "Allow SSH"
}

resource "vkcs_networking_secgroup_rule" "http" {
  direction         = "ingress"
  port_range_max   = 80
  port_range_min   = 80
  protocol         = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.security_group.id
  description      = "Allow HTTP"
}

resource "vkcs_networking_secgroup_rule" "https" {
  direction         = "ingress"
  port_range_max   = 443
  port_range_min   = 443
  protocol         = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.security_group.id
  description      = "Allow HTTPS"
}

resource "vkcs_networking_secgroup_rule" "dns" {
  direction         = "egress"
  port_range_max   = 53
  port_range_min   = 53
  protocol         = "udp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.security_group.id
  description      = "Allow DNS"
}

resource "vkcs_compute_instance" "vm" {
  count               = 3
  name                = "ITHUBterraforubuntuper${count.index + 1}-Fedorov-An"
  availability_zone   = var.availability_zones[count.index]
  flavor_name         = "STD2-2-2" 
  block_device {
    source_type       = "image"
    uuid              = data.vkcs_images_image.centos-7.id
    destination_type  = "volume"
    volume_size       = var.volume_size
    delete_on_termination = true
  }
  network {
    uuid        = vkcs_networking_network.network.id
    fixed_ip_v4 = var.fixed_ips[count.index]
  }

  security_groups = [vkcs_networking_secgroup.security_group.name]
  user_data = <<-EOF
    #cloud-config
    package_upgrade: true
    packages:
      - curl
      - wget
      - nginx
    runcmd:
      - systemctl start nginx
      - systemctl enable nginx
  EOF

  depends_on = [
    vkcs_networking_router_interface.router_interface,
    vkcs_networking_network.Fedorov-An,
    vkcs_networking_subnet.Fedorov-An
  ]
}

output "vm_info" {
  value = {
    for vm in vkcs_compute_instance.vm : vm.name => {
      ip = vm.network[0].fixed_ip_v4
      hostname = vm.name
    }
  }
}