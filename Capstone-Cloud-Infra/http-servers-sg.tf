
resource "alicloud_security_group" "http-sec" {
  name        = "http-sec"
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "ssh_for_http" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.http-sec.id
  source_security_group_id = alicloud_security_group.jump-server-sec.id
}
resource "alicloud_security_group_rule" "lallow_loadbalancer_to_http_servers" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.http-sec.id
  cidr_ip           = "0.0.0.0/0"
}

