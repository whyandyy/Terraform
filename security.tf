resource "vkcs_networking_secgroup" "Fedorov-An" {
  name        = "security_group_Fedorov-An"
  description = "terraform security group"
}

resource "vkcs_networking_secgroup_rule" "ssh_Fedorov-An" {
  direction        = "ingress"
  port_range_max   = 22
  port_range_min   = 22
  protocol         = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.Fedorov-An.id
  description      = "Allow SSH"
}

resource "vkcs_networking_secgroup_rule" "http_Fedorov-An" {
  direction        = "ingress"
  port_range_max   = 80
  port_range_min   = 80
  protocol         = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.Fedorov-An.id
  description      = "Allow HTTP"
}

resource "vkcs_networking_secgroup_rule" "https_Fedorov-An" {
  direction        = "ingress"
  port_range_max   = 443
  port_range_min   = 443
  protocol         = "tcp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.Fedorov-An.id
  description      = "Allow HTTPS"
}

resource "vkcs_networking_secgroup_rule" "dns_Fedorov-An" {
  direction        = "egress"
  port_range_max   = 53
  port_range_min   = 53
  protocol         = "udp"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.Fedorov-An.id
  description      = "Allow DNS"
}